using System;
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
        //            frame.MouseClick += GOTOCHIUDI;

        var ASCIIART = new Label(
    "                      ______     ______                        \r\n                     /\\  ___\\   /\\  __ \\                       \r\n                     \\ \\___  \\  \\ \\ \\/\\ \\                      \r\n                      \\/\\_____\\  \\ \\_____\\                     \r\n                       \\/_____/   \\/_____/                     ")
        {
            X = 1,
            Y = 1,
            Width = Dim.Fill() - 1,
            Height = Dim.Fill() - 2,
        };

        frame.Add(ASCIIART); // Aggiungi il pulsante al frame
        SO_DIAG.Add(frame); // Aggiungi il frame al dialogo

        Application.Run(SO_DIAG);
    }
}