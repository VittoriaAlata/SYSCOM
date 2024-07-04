using System;
using Terminal.Gui;

class SYSCOM
{
    static void Main(string[] args)
    {
        Application.Init();
        Application.Current.KeyPress += (sender, args) =>
        {
            if (args.KeyEvent.Key == Key.q)
            {
                Application.RequestStop();
            } else if (args.KeyEvent.Key == Key.Q)
            {
                Application.RequestStop();
            }
        };
        var top = Application.Top;

        Window win = new Window()
        {
            X = 0,
            Y = 1, // Leave space for the title
            Width = Dim.Fill(),
            Height = Dim.Fill() - 1 // Leave space for the title bar
        };

        var frame = new FrameView("SYSCOM")
        {
            X = 0,
            Y = 0,
            Width = Dim.Fill(),
            Height = Dim.Fill(),
            CanFocus = true
        };

        var menuText = new Label(
            "    dP\"8 Y88b Y8P  dP\"8   e88'Y88   e88 88e       e   e        \r\n   C8b Y  Y88b Y  C8b Y  d888  'Y  d888 888b     d8b d8b       \r\n    Y8b    Y88b    Y8b  C8888     C8888 8888D   e Y8b Y8b      \r\n   b Y8D    888   b Y8D  Y888  ,d  Y888 888P   d8b Y8b Y8b     \r\n   8edP     888   8edP    \"88,d88   \"88 88\"   d888b Y8b Y8b    \n"
            )
        {
            X = 1,
            Y = 1,
            Width = Dim.Fill() - 1,
            Height = Dim.Fill() - 2,
            TextAlignment = TextAlignment.Centered,
        };

        var DSKso = new Button("Manutenzione del Sistema Operativo e dei Dischi")
        {
            X = 1,
            Y = Pos.Bottom(menuText) - 4,
        };
        DSKso.Clicked += GOTODSKSO;

        void GOTODSKSO(object sender, EventArgs e)
        {
            DSK_SO();
        }

        static void DSK_SO()
        {
            Application.Init();
            var DSK_SO_DIAG = new Dialog(); // Crea un nuovo dialogo con titolo "DSK SO", larghezza 60 e altezza 18

            var frame = new FrameView("DSK SO")
            {
                X = 0,
                Y = 0,
                Width = Dim.Fill(),
                Height = Dim.Fill(),
                CanFocus = true
            };

            var prima = new Button("Esegui")
            {
                X = 1,
                Y = 2,
            };

            frame.Add(prima); // Aggiungi il pulsante al frame
            DSK_SO_DIAG.Add(frame); // Aggiungi il frame al dialogo

            Application.Run(DSK_SO_DIAG);
        }

        var entry = new TextField("")
        {
            X = 1,
            Y = Pos.Bottom(menuText) + 2,
            Width = Dim.Fill() - 1
        };

        var labelFesta = new Label("")
        {
            X = 1,
            Y = Pos.Bottom(entry) + 1
        };

        var ExecButton = new Button("Esegui")
        {
            X = 1,
            Y = Pos.Bottom(entry) + 2,
        };
        ExecButton.Clicked += MenuSwitch;

        void MenuSwitch(object sender, EventArgs e)
        {
            MAINchoice();
        }

        void MAINchoice()
        {
            var input = entry.Text.ToString(); // Converti ustring in string
            switch (input)
            {
                case "2":
                    GestioneReteApplicazioni();
                    break;
                case "3":
                    SicurezzaProtezione();
                    break;
                case "404":
                    WINGET_UNINSTALL_SYSCOM();
                    break;
                case "0":
                    Application.RequestStop();
                    break;
                default:
                    labelFesta.Text = "Inserisci un'opzione valida.";
                    break;
            }
        }

        frame.Add(menuText, DSKso, entry, labelFesta, ExecButton);
        win.Add(frame);
        top.Add(win);

        Application.Run();
    }

    static void GestioneReteApplicazioni()
    {
        MessageBox.Query("GestioneReteApplicazioni", "Esegui GestioneReteApplicazioni", "Ok");
    }

    static void SicurezzaProtezione()
    {
        MessageBox.Query("SicurezzaProtezione", "Esegui SicurezzaProtezione", "Ok");
    }

    static void WINGET_UNINSTALL_SYSCOM()
    {
        MessageBox.Query("WINGET_UNINSTALL_SYSCOM", "Esegui WINGET_UNINSTALL_SYSCOM", "Ok");
    }
}
