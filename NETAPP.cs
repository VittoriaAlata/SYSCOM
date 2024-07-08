using System;
using System.Security.Cryptography;
using Terminal.Gui;

class NETAPP
{
    public static void Dialog()
    {
        Application.Init();

        var ColorNETAPP = new ColorScheme()
        {
            Normal = Application.Driver.MakeAttribute(Color.White, Color.BrightBlue),
            HotNormal = Application.Driver.MakeAttribute(Color.White, Color.Blue),
            Focus = Application.Driver.MakeAttribute(Color.Blue, Color.White),
            HotFocus = Application.Driver.MakeAttribute(Color.White, Color.Blue),
        };

        var NETAPP_DIAG = new Dialog()
        {
            X = 0,
            Y = 1, // Leave space for the title
            Width = 65,
            Height = 22,
            ColorScheme = ColorNETAPP
        }; // Crea un nuovo dialogo

        var frame = new FrameView("Network e Applicazioni")
        {
            X = 0,
            Y = 0,
            Width = Dim.Fill(),
            Height = Dim.Fill(),
            CanFocus = true
        };

        var ASCIIART = new Label(
        " __   __    ______    ______      ______    ______   ______ \r\n/\\ \"-.\\ \\  /\\  ___\\  /\\__  _\\    /\\  __ \\  /\\  == \\ /\\  == \\\r\n\\ \\ \\-.  \\ \\ \\  __\\  \\/_/\\ \\/    \\ \\  __ \\ \\ \\  _-/ \\ \\  _-/\r\n \\ \\_\\\\\"\\_\\ \\ \\_____\\   \\ \\_\\     \\ \\_\\ \\_\\ \\ \\_\\    \\ \\_\\  \r\n  \\/_/ \\/_/  \\/_____/    \\/_/      \\/_/\\/_/  \\/_/     \\/_/  ")
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
        NETAPP_DIAG.Add(frame); // Aggiungi il frame al dialogo

        Application.Run(NETAPP_DIAG);
    }
}