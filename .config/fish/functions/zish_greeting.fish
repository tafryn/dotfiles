#set -g CMD_DURATION 0
set -g TOP_BAR_MINUS ""

function bred;      set_color -o red;    end
function byellow;   set_color -o yellow; end
function bgreen;    set_color -o green;  end
function bcyan;     set_color -o cyan;   end
function bblue;     set_color -o blue;   end
function bwhite;    set_color -o white;  end
function bgray;     set_color -o black;  end
function red;       set_color red;       end
function yellow;    set_color yellow;    end
function green;     set_color green;     end
function blue;      set_color blue;      end
function cyan;      set_color cyan;      end
function dim;       set_color 444444;    end
function off;       set_color normal;    end

function fish_greeting
    echo (dim)(uname -nr)(off)
end
