#!/usr/bin/fish

set a (fd "" / --hidden | fuzzel --dmenu)
if test -n "$a"
    xdg-open "$a"
end
