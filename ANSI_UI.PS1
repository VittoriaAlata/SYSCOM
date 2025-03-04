function isDownArrowPrem {
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        if ($key.VirtualKeyCode -eq 40) {  # 40 è il codice del tasto freccia giù
        $DSK_SO_MESS = "┃`t{Esc}[41m1. Manutenzione del Sistema Operativo e dei Dischi      {Esc}[0m┃"
        return 1
    }
}