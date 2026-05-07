ESTADO=$(eww get meu_toggle)

if [ "$ESTADO" = "true" ]; then
    eww open powermenu
    eww update meu_toggle=false
else
    eww close powermenu
    eww update meu_toggle=true
fi
