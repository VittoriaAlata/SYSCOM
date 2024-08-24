using System;
using System.Diagnostics;
using System.Security.Cryptography;
using Terminal.Gui;

class SO
{
    public static void Dialog()
    {
        Application.Init();

        var ColorSO = new ColorScheme()
        {
            Normal = Application.Driver.MakeAttribute(Color.White, Color.BrightBlue),
            HotNormal = Application.Driver.MakeAttribute(Color.White, Color.Blue),
            Focus = Application.Driver.MakeAttribute(Color.Blue, Color.White),
            HotFocus = Application.Driver.MakeAttribute(Color.White, Color.Blue),
        };

        var SO_DIAG = new Dialog()
        {
            X = 0,
            Y = 1, // Leave space for the title
            Width = 65,
            Height = 22,
            ColorScheme = ColorSO
        }; // Crea un nuovo dialogo

        var frame = new FrameView("Sistema Operativo")
        {
            X = 0,
            Y = 0,
            Width = Dim.Fill(),
            Height = Dim.Fill(),
            CanFocus = true
        };

        var ASCIIART = new Label(
    "                      ______     ______                        \r\n                     /\\  ___\\   /\\  __ \\                       \r\n                     \\ \\___  \\  \\ \\ \\/\\ \\                      \r\n                      \\/\\_____\\  \\ \\_____\\                     \r\n                       \\/_____/   \\/_____/                     ")
        {
            X = 1,
            Y = 1,
            Width = Dim.Fill() - 1,
            Height = Dim.Fill() - 2,
        };

        var SFC = new Button("SFC            (Analizza integrità file di sistema)")
        {
            X = 5,
            Y = 8,
        };
        SFC.Clicked += GOTOSFC;

        void GOTOSFC(object sender, EventArgs e)
        {
            var SFC = new ProcessStartInfo
            {
                FileName = "powershell",
                Arguments = "Start-Process -Verb RunAs powershell -ArgumentList 'sfc /scannow; Pause'",
                UseShellExecute = true
            };

            Process.Start(SFC);
        }

        var DISM = new Button("DISM           (Manutenzione immagini di sistema)")
        {
            X = 5,
            Y = 10,
        };
        DISM.Clicked += GOTODISM;

        void GOTODISM(object sender, EventArgs e)
        {
            var DISM = new ProcessStartInfo
            {
                FileName = "powershell",
                Arguments = "Start-Process -Verb RunAs powershell -ArgumentList 'dism online cleanup-image restorehealth Loglevel2; Pause'",
                UseShellExecute = true
            };

            Process.Start(DISM);
        }

        frame.Add(ASCIIART, SFC, DISM); // Aggiungi il pulsante al frame
        SO_DIAG.Add(frame); // Aggiungi il frame al dialogo

        Application.Run(SO_DIAG);
    }
}