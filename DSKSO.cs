using System;
using System.Security.Cryptography;
using Terminal.Gui;

class DSKSO
{
    public static void Dialog()
    {
        Application.Init();

        var ColorDSKSO = new ColorScheme()
        {
            Normal = Application.Driver.MakeAttribute(Color.White, Color.BrightBlue),
            HotNormal = Application.Driver.MakeAttribute(Color.White, Color.Blue),
            Focus = Application.Driver.MakeAttribute(Color.Blue, Color.White),
            HotFocus = Application.Driver.MakeAttribute(Color.White, Color.Blue),
        };

        var DSK_SO_DIAG = new Dialog()
        {
            X = 0,
            Y = 1, // Leave space for the title
            Width = 65,
            Height = 22,
            ColorScheme = ColorDSKSO
        }; // Crea un nuovo dialogo

            var frame = new FrameView("Dischi e Sistema Operativo")
            {
                X = 0,
                Y = 0,
                Width = Dim.Fill(),
                Height = Dim.Fill(),
                CanFocus = true
            };
        //            frame.MouseClick += GOTOCHIUDI;

        var ASCIIART = new Label(
        " _____     ______     __  __            ______     ______    \r\n/\\  __-.  /\\  ___\\   /\\ \\/ /           /\\  ___\\   /\\  __ \\   \r\n\\ \\ \\/\\ \\ \\ \\___  \\  \\ \\  _\"-.         \\ \\___  \\  \\ \\ \\/\\ \\  \r\n \\ \\____-  \\/\\_____\\  \\ \\_\\ \\_\\         \\/\\_____\\  \\ \\_____\\ \r\n  \\/____/   \\/_____/   \\/_/\\/_/          \\/_____/   \\/_____/ ")
        {
            X = 1,
            Y = 1,
            Width = Dim.Fill() - 1,
            Height = Dim.Fill() - 2,
        };

        var OS = new Button("Sistema Operativo")
        {
            X = 5,
            Y = 8,
        };
        OS.Clicked += GOTOSO;

        void GOTOSO(object sender, EventArgs e)
        {
            SistemaOperativo();
        }

        static void SistemaOperativo()
        {
            SO.Dialog();
        }

        var VOLDSK = new Button("Dischi e Volumi")
        {
            X = 5,
            Y = 10,
        };
        VOLDSK.Clicked += GOTODSK;

        void GOTODSK(object sender, EventArgs e)
        {
            Dischi();
        }

        static void Dischi()
        {
            DSK.Dialog();
        }

        frame.Add(ASCIIART, OS, VOLDSK); // Aggiungi il pulsante al frame
            DSK_SO_DIAG.Add(frame); // Aggiungi il frame al dialogo

            Application.Run(DSK_SO_DIAG);
    }
}