import XMonad
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import System.Exit
import XMonad.Layout.Reflect

-- actions
import qualified XMonad.Actions.FlexibleResize as Flex
import XMonad.Actions.GridSelect

-- hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.UrgencyHook

-- layouts
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.ResizableTile

{------------------------------------------------------------------------------}
-- Main --
main :: IO ()
main = xmonad =<< statusBar cmd pp kb conf
    where
        uhook = withUrgencyHook NoUrgencyHook
        cmd = "xmobar $HOME/.xmobarrc"
        pp = customPP
        kb = toggleStrutsKey
        conf = uhook config'

{------------------------------------------------------------------------------}
-- Config --
config' = defaultConfig
    { manageHook            = manageHook'
    , layoutHook            = layoutHook'
    , handleEventHook       = eventHook'
    , workspaces            = workspaces'
    , mouseBindings         = mouseBindings'
    , keys                  = keys'
    , modMask               = mod4Mask          -- Use Super instead of Alt
    , normalBorderColor     = normalBorderColor'
    , focusedBorderColor    = focusedBorderColor'
    , terminal              = "urxvt"
    }

{------------------------------------------------------------------------------}
-- Window Management --
eventHook' = handleEventHook defaultConfig <+> docksEventHook

manageHook' :: ManageHook
manageHook' = ruleManageHook <+> manageHook defaultConfig

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
cfloatApps  = ["Zim", "feh", "MPlayer", "Xmessage", "Xephyr", "Keepassx", "qemu-system-x86_64", "qemu-system-i386", "Display"]
webApps     = ["Uzbl-core", "Firefox"]
mailApps    = ["Mail", "Thunderbird"]
chatApps    = ["Pidgin", "Gajim"]
pdfApps     = ["Xpdf", "Evince", "Okular"]
docApps     = ["LibreOffice 4.0", "libreoffice-startcenter"]
vmApps      = ["Vmplayer", "VirtualBox"]
otherApps   = ["Gimp", "Inkscape"]


{------------------------------------------------------------------------------}
-- Style --
-- bar
customPP = xmobarPP
    { ppTitle = xmobarColor "#4e9a06" "" . shorten 70
    , ppCurrent = xmobarColor "#c4a000" "" . wrap "<" ">"
    , ppVisible = xmobarColor "#3465a4" "" . wrap "(" ")"
    , ppUrgent = xmobarColor "#cc0000" "" . wrap "!" "!"
    , ppSep = xmobarColor "#d3d7cf" "" " | "
    }

-- borders
normalBorderColor' = "#222222"
focusedBorderColor' = "#99ccff"

-- workspaces
workspaces' :: [WorkspaceId]
workspaces' = ["1:web", "2:mail", "3:chat", "4:dev-α", "5:dev-β", "6:pdf", "7:doc", "8:vm", "9"]

-- layouts
layoutHook' = avoidStruts $ (tiled ||| rmTiled ||| full)
    where
            rt = ResizableTall nmaster delta ratio []
            tiled = renamed [Replace "[]Ξ"] $ smartBorders rt
            rmTiled = renamed [Replace "[⊥]"] $ smartBorders (reflectVert . Mirror $ rt)
            full = renamed [Replace "[ ]"] $ noBorders Full
            nmaster = 1
            delta = 3/100
            ratio = toRational (2/(1+sqrt(5)::Double))

-- gridSelect config
gsConfig' = defaultGSConfig
    { gs_cellwidth = 160
    , gs_navigate = gsNav'
    }

{------------------------------------------------------------------------------}
-- keys
toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

gsNav' :: TwoD a (Maybe a)
gsNav' = makeXEventhandler $ shadowWithKeymap navKeyMap navDefaultHandler
    where
        navKeyMap = M.fromList
            [ ((0,xK_Escape), cancel)
            , ((0,xK_Return), select)
            , ((0,xK_slash) , substringSearch gsNav')
            , ((0,xK_Left)  , move (-1,0)  >> gsNav')
            , ((0,xK_d)     , move (-1,0)  >> gsNav')
            , ((0,xK_Right) , move (1,0)   >> gsNav')
            , ((0,xK_n)     , move (1,0)   >> gsNav')
            , ((0,xK_Down)  , move (0,1)   >> gsNav')
            , ((0,xK_h)     , move (0,1)   >> gsNav')
            , ((0,xK_Up)    , move (0,-1)  >> gsNav')
            , ((0,xK_t)     , move (0,-1)  >> gsNav')
            , ((0,xK_f)     , move (-1,-1) >> gsNav')
            , ((0,xK_g)     , move (1,-1)  >> gsNav')
            , ((0,xK_b)     , move (-1,1)  >> gsNav')
            , ((0,xK_m)     , move (1,1)   >> gsNav')
            , ((0,xK_space) , setPos (0,0) >> gsNav')
            ]
        navDefaultHandler = const gsNav'

keys' :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
keys' conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    -- launching/killing programs
    [ ((modMask                 , xK_Return ), spawn $ XMonad.terminal conf)
    , ((modMask                 , xK_Up     ), spawn "amixer set Master 3%+")
    , ((modMask                 , xK_Down   ), spawn "amixer set Master 3%-")
    , ((modMask                 , xK_End    ), spawn "amixer set Master toggle")
    , ((modMask                 , xK_s      ), spawn "mpc stop")
    , ((modMask                 , xK_p      ), spawn "dmenu_run")
    , ((modMask                 , xK_m      ), spawn $ XMonad.terminal conf ++ " -e mutt -R")
    , ((modMask                 , xK_z      ), spawn "zim")
    , ((shiftMask               , xK_Scroll_Lock ), spawn "~/bin/kvm-swap")
    , ((controlMask             , xK_6      ), spawn "xscreensaver-command -lock")
    , ((modMask .|. shiftMask   , xK_c      ), kill)

    -- XMonad control
    , ((modMask                 , xK_q      ), spawn "xmonad --recompile; xmonad --restart")
    , ((modMask .|. shiftMask   , xK_q      ), io (exitWith ExitSuccess))

    -- layout control
    , ((modMask .|. shiftMask   , xK_space  ), sendMessage NextLayout)
    , ((modMask .|. controlMask , xK_space  ), setLayout $ XMonad.layoutHook conf)
    , ((modMask                 , xK_b      ), sendMessage ToggleStruts)
    , ((modMask .|. mod1Mask    , xK_t      ), sendMessage (IncMasterN 1))
    , ((modMask .|. mod1Mask    , xK_h      ), sendMessage (IncMasterN (-1)))

    -- client control
    , ((modMask .|. shiftMask   , xK_s      ), withFocused $ windows . W.sink)
    , ((modMask                 , xK_Tab    ), windows W.focusDown)
    , ((modMask                 , xK_h      ), windows W.focusDown)
    , ((modMask                 , xK_t      ), windows W.focusUp)
    , ((modMask .|. shiftMask   , xK_m      ), windows W.focusMaster)
    , ((modMask                 , xK_space  ), windows W.swapMaster)
    , ((modMask .|. shiftMask   , xK_h      ), windows W.swapDown)
    , ((modMask .|. shiftMask   , xK_t      ), windows W.swapUp)
    , ((mod1Mask                , xK_h      ), spawn "tmux select-pane -t :.+")
    , ((mod1Mask                , xK_t      ), spawn "tmux select-pane -t :.-")
    , ((modMask                 , xK_g      ), goToSelected gsConfig')

    -- resizing
    , ((modMask                 , xK_r      ), refresh) -- Resize viewed windows to the correct size
    , ((modMask .|. controlMask , xK_d      ), sendMessage Shrink)
    , ((modMask .|. controlMask , xK_n      ), sendMessage Expand)
    , ((modMask .|. controlMask , xK_h      ), sendMessage MirrorShrink)
    , ((modMask .|. controlMask , xK_t      ), sendMessage MirrorExpand)

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
        | (key, sc) <- zip [xK_n, xK_d, xK_i] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

-- mouse
mouseBindings' (XConfig {XMonad.modMask = modm}) = M.fromList $
     [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster))
     , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
     , ((modm, button3), (\w -> focus w >> Flex.mouseResizeWindow w >> windows W.shiftMaster))
     ]

-- vim: set ts=4 sw=4 et:
