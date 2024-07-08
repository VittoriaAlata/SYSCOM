using System;
using System.Diagnostics;
using System.Reflection;
using System.Security.Cryptography;
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

        var ColorMain = new ColorScheme()
        {
            Normal = Application.Driver.MakeAttribute(Color.White, Color.BrightBlue),
            HotNormal = Application.Driver.MakeAttribute(Color.White, Color.Blue),
            Focus = Application.Driver.MakeAttribute(Color.Blue, Color.White),
            HotFocus = Application.Driver.MakeAttribute(Color.White, Color.Blue),
            //Disabled = Application.Driver.MakeAttribute(Color.Black, Color.Black), Non attualmente implementato
        };

        Window win = new Window()
        {
            X = 0,
            Y = 1, // Leave space for the title
            //Width = Dim.Fill(),
            //Height = Dim.Fill() - 2, // Leave space for the title bar*/
            Width = 65,
            Height = 22,
            ColorScheme = ColorMain //schema dei colori utilizzato nella finestra MAIN
        };

        var frame = new FrameView("                 SYSCOM - System Commander                  ")
        {
            X = 0,
            Y = 0,
            Width = Dim.Fill(),
            Height = Dim.Fill(),
            CanFocus = true
        };

        //var subTitle = new FrameView("MIT License (c) 2024 Vittoria                   v0.0.5-beta")
        var subTitle = new FrameView("Q = Chiudi | ESC = Precedente                   v0.0.5-beta")
        {
            X = 0,
            Y = Pos.Bottom(win) - 1, // This will position the subtitle at the bottom of the window
            Width = Dim.Fill(),
            Height = 1,
        };


        var menuText = new Label(
            "     dP\"8 Y88b Y8P  dP\"8   e88'Y88   e88 88e       e   e        \r\n  C8b Y  Y88b Y  C8b Y  d888  'Y  d888 888b     d8b d8b       \r\n  Y8b    Y88b    Y8b  C8888     C8888 8888D   e Y8b Y8b      \r\n  b Y8D    888   b Y8D  Y888  ,d  Y888 888P   d8b Y8b Y8b     \r\n   8edP     888   8edP    \"88,d88   \"88 88\"   d888b Y8b Y8b    \n"
            )
        {
            X = 0,
            Y = 1,
            Width = Dim.Fill() - 1,
            Height = Dim.Fill() - 2,
        };

        var DskSo = new Button("Manutenzione del Sistema Operativo e  dei Dischi")
        {
            X = 5,
            Y = 8,
        };
        DskSo.Clicked += GOTODSKSO;

        void GOTODSKSO(object sender, EventArgs e)
        {
            DSK_SO();
        }

        static void DSK_SO()
        {
            DSKSO.Dialog();
        }

        var NetApp = new Button("Gestione     di     Rete     e      Applicazioni")
        {
            X = 5,
            Y = 9,
        };
        NetApp.Clicked += GOTONETAPP;

        void GOTONETAPP(object sender, EventArgs e)
        {
            NET_APP();
        }

        static void NET_APP()
        {
            NETAPP.Dialog();
        }

        var Secure = new Button("Sicurezza              e              Protezione")
        {
            X = 5,
            Y = 10,
        };
        Secure.Clicked += GOTOSECURE;

        void GOTOSECURE(object sender, EventArgs e)
        {
            SECUREPROT();
        }

        static void SECUREPROT()
        {
            SECURE.Dialog();
        }

        var Info = new Button("Informazioni")
        {
            X = 5,
            Y = 12,
        };
        Info.Clicked += GOTOINFO;

        void GOTOINFO(object sender, EventArgs e)
        {
            INFORMATION();
        }

        static void INFORMATION()
        {
            INFORM.Dialog();
        }

        var SYSCOM = new Button("SYSCOM ( CLI )")
        {
            X = 24,
            Y = 12,
        };
        SYSCOM.Clicked += GOTOSYSCOM;

        void GOTOSYSCOM(object sender, EventArgs e)
        {
            var psi = new System.Diagnostics.ProcessStartInfo()
            {
                FileName = "powershell",
                Arguments = $"cd C:\\Users\\pierl\\Desktop\\SYSCOM\\; .\\SYSCOM.PS1",
                UseShellExecute = true,
            };
            var process = System.Diagnostics.Process.Start(psi);
        }

        var VISO = new Button(" VISO  ( CLI )")
        {
            X = 24,
            Y = 14,
        };
        VISO.Clicked += GOTOVISO;

        void GOTOVISO(object sender, EventArgs e)
        {
            var psi = new System.Diagnostics.ProcessStartInfo()
            {
                FileName = "powershell",
                Arguments = $"cd C:\\Users\\pierl\\Desktop\\SYSCOM\\VISO; .\\VISO.BAT",
                UseShellExecute = true,
            };
            var process = System.Diagnostics.Process.Start(psi);
        }

        var entry = new TextField("")
        {
            X = 1,
            Y = Pos.Bottom(menuText) + 3,
            Width = Dim.Fill() - 1
        };
        
        var labelFesta = new Label("")
        {
            X = 1,
            Y = Pos.Bottom(entry)
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
              case "1":
                  DSK_SO();
                  break;
              case "2":
                  NET_APP();
                  break;
              case "3":
                  INFORMATION();
                  break;
              case "VISO":
                    var psi = new System.Diagnostics.ProcessStartInfo()
                    {
                        FileName = "powershell",
                        Arguments = $"cd C:\\Users\\pierl\\Desktop\\SYSCOM\\VISO; .\\VISO.BAT",
                        UseShellExecute = true,
                    };
                    var process = System.Diagnostics.Process.Start(psi);
                    break;
              case "0":
                  Application.RequestStop();
                  break;
              default:
                  labelFesta.Text = "Inserisci un'opzione valida.";
                  break;
          }
        }

        frame.Add(menuText, DskSo, NetApp, Secure, Info, SYSCOM, VISO, entry, labelFesta, ExecButton);
        win.Add(frame, subTitle);
        top.Add(win);

        Application.Run();
    }

  //static void GestioneReteApplicazioni()
  //{
  //    MessageBox.Query("GestioneReteApplicazioni", "Esegui GestioneReteApplicazioni", "Ok");
  //}
  //
  //static void SicurezzaProtezione()
  //{
  //    MessageBox.Query("SicurezzaProtezione", "Esegui SicurezzaProtezione", "Ok");
  //}
  //
  //static void WINGET_UNINSTALL_SYSCOM()
  //{
  //    MessageBox.Query("WINGET_UNINSTALL_SYSCOM", "Esegui WINGET_UNINSTALL_SYSCOM", "Ok");
  //}
}
