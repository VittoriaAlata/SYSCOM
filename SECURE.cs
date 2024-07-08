using System;
using System.Security.Cryptography;
using Terminal.Gui;

class SECURE
{
    public static void Dialog()
    {
            Application.Init();
            var SECURE_DIAG = new Dialog();

            var frame = new FrameView("Sicurezza e Protezione dei Dati e dell'Elaboratore")
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


            frame.Add(prima);
            SECURE_DIAG.Add(frame);

            Application.Run(SECURE_DIAG);
    }
}