using System;
using System.Security.Cryptography;
using Terminal.Gui;

class DSK
{
    public static void Dialog()
    {
        Application.Init();

        var ColorDSK = new ColorScheme()
        {
            Normal = Application.Driver.MakeAttribute(Color.White, Color.BrightBlue),
            HotNormal = Application.Driver.MakeAttribute(Color.White, Color.Blue),
            Focus = Application.Driver.MakeAttribute(Color.Blue, Color.White),
            HotFocus = Application.Driver.MakeAttribute(Color.White, Color.Blue),
        };

        var DSK_DIAG = new Dialog()
        {
            X = 0,
            Y = 1, // Leave space for the title
            Width = 65,
            Height = 22,
            ColorScheme = ColorDSK
        }; // Crea un nuovo dialogo

        var frame = new FrameView("Dischi e Volumi")
        {
            X = 0,
            Y = 0,
            Width = Dim.Fill(),
            Height = Dim.Fill(),
            CanFocus = true
        };

        var ASCIIART = new Label(
        " __   __ ______    __           _____    ______    __  __   \r\n/\\ \\ / //\\  __ \\  /\\ \\         /\\  __-. /\\  ___\\  /\\ \\/ /   \r\n\\ \\ \\'/ \\ \\ \\/\\ \\ \\ \\ \\____    \\ \\ \\/\\ \\\\ \\___  \\ \\ \\  _\"-. \r\n \\ \\__|  \\ \\_____\\ \\ \\_____\\    \\ \\____- \\/\\_____\\ \\ \\_\\ \\_\\\r\n  \\/_/    \\/_____/  \\/_____/     \\/____/  \\/_____/  \\/_/\\/_/")
        {
            X = 1,
            Y = 1,
            Width = Dim.Fill() - 1,
            Height = Dim.Fill() - 2,
        };

        frame.Add(ASCIIART); // Aggiungi il pulsante al frame
        DSK_DIAG.Add(frame); // Aggiungi il frame al dialogo

        Application.Run(DSK_DIAG);
    }
}