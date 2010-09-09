import XMonad
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import System.Exit
import XMonad.Layout.Reflect

-- actions
import qualified XMonad.Actions.FlexibleResize as Flex

-- hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.UrgencyHook

-- utils
import XMonad.Util.Run(spawnPipe)

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar $HOME/.xmobarrc"  -- start xmobar
    xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig
        { manageHook = myManageHook
        , layoutHook            = myLayoutHook
        , logHook               = myLogHook xmproc
        , workspaces            = myWorkspaces
        , mouseBindings         = myMouseBindings
        , keys                  = myKeys
        , normalBorderColor     = "#222222"
        , focusedBorderColor    = "#99ccff"
        , modMask               = mod4Mask          -- Use Super instead of Alt
        , terminal              = "term-wrapper"
        }

-- hooks
ruleManageHook = composeOne . concat $
    [[checkDock         -?> doIgnore
    , isFullscreen      -?> doFullFloat
    , isDialog          -?> (doF(W.shiftMaster) <+> doCenterFloat)]
    , [className =? c   -?> doCenterFloat    | c <- cfloatApps]
    , [className =? c   -?> doShift "1:web"  | c <- webApps]
    , [className =? c   -?> doShift "2:mail" | c <- mailApps]
    , [className =? c   -?> doShift "3:chat" | c <- chatApps]
    , [className =? c   -?> doShift "6:pdf"  | c <- pdfApps]
    , [className =? c   -?> doShift "7:doc"  | c <- docApps]
    , [className =? c   -?> doShift "8:vm"   | c <- vmApps]
    , [className =? c   -?> doShift "9"      | c <- otherApps]
    , [return True      -?> insertPosition End Newer]
    ]
cfloatApps  = ["Zim","feh","MPlayer","Tomboy","/usr/lib/tomboy/Tomboy.exe","Xmessage", "Xephyr"]
webApps     = ["Iron", "Uzbl-core", "Shiretoko", "Firefox", "Namoroka"]
mailApps    = ["Mail", "Lanikai"]
chatApps    = ["Pidgin"]
pdfApps     = ["Xpdf", "Evince", "Okular"]
docApps     = ["OpenOffice.org 3.2"]
vmApps      = ["Vmplayer", "VirtualBox"]
otherApps   = ["Gimp", "Inkscape"]

myManageHook :: ManageHook
myManageHook = ruleManageHook <+> manageHook defaultConfig

myLayoutHook = avoidStruts $ (reflectVert . Mirror $ tiled ||| tiled ||| Full)
    where
            tiled = Tall nmaster delta ratio
            nmaster = 1
            delta = 3/100
            ratio = toRational (2/(1+sqrt(5)::Double))

myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ xmobarPP
    { ppOutput = hPutStrLn h
    , ppTitle = xmobarColor "#4e9a06" "" . shorten 70
    , ppCurrent = xmobarColor "#c4a000" "" . wrap "<" ">"
    , ppVisible = xmobarColor "#3465a4" "" . wrap "(" ")"
    , ppUrgent = xmobarColor "#cc0000" "" . wrap "!" "!"
    , ppSep = xmobarColor "#d3d7cf" "" " | "
    }

-- workspaces
myWorkspaces :: [WorkspaceId]
myWorkspaces = ["1:web", "2:mail", "3:chat", "4:dev-α", "5:dev-β", "6:pdf", "7:doc", "8:vm", "9"]

-- keys
myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    -- launching/killing programs
    [ ((modMask                 , xK_Return ), spawn $ XMonad.terminal conf)
    , ((modMask                 , xK_Up     ), spawn "amixer set Master 3%+")
    , ((modMask                 , xK_Down   ), spawn "amixer set Master 3%-")
    , ((modMask                 , xK_End    ), spawn "amixer set Master toggle")
    , ((modMask                 , xK_s      ), spawn "mpc stop")
    , ((modMask                 , xK_p      ), spawn "dmenu_run")
    , ((controlMask             , xK_6      ), spawn "xscreensaver-command -lock")
    , ((modMask .|. shiftMask   , xK_c      ), kill)

    -- XMonad control
    , ((modMask                 , xK_q      ), spawn "xmonad --recompile; xmonad --restart")
    , ((modMask .|. shiftMask   , xK_q      ), io (exitWith ExitSuccess))

    -- layout control
    , ((modMask .|. shiftMask   , xK_space  ), sendMessage NextLayout)
    , ((modMask .|. controlMask , xK_space  ), setLayout $ XMonad.layoutHook conf)
    , ((modMask                 , xK_b      ), sendMessage ToggleStruts)
    , ((modMask .|. controlMask , xK_t      ), sendMessage (IncMasterN 1))
    , ((modMask .|. controlMask , xK_h      ), sendMessage (IncMasterN (-1)))

    -- client control
    , ((modMask .|. shiftMask   , xK_s      ), withFocused $ windows . W.sink)
    , ((modMask                 , xK_Tab    ), windows W.focusDown)
    , ((modMask                 , xK_h      ), windows W.focusDown)
    , ((modMask                 , xK_t      ), windows W.focusUp)
    , ((modMask                 , xK_m      ), windows W.focusMaster)
    , ((modMask                 , xK_space  ), windows W.swapMaster)
    , ((modMask .|. shiftMask   , xK_h      ), windows W.swapDown)
    , ((modMask .|. shiftMask   , xK_t      ), windows W.swapUp)

    -- resizing
    , ((modMask                 , xK_r      ), refresh) -- Resize viewed windows to the correct size
    , ((modMask .|. controlMask , xK_d      ), sendMessage Shrink)
    , ((modMask .|. controlMask , xK_n      ), sendMessage Expand)

    ]
    ++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_n, xK_d, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
     [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster))
     , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
     , ((modm, button3), (\w -> focus w >> Flex.mouseResizeWindow w >> windows W.shiftMaster))
     ]

-- vim: set ts=4 sw=4 et:
