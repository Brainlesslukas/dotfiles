{ self, inputs, ... }:
{

  flake.nixosModules.modulesDesktopHyprHyprland =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    let
      inherit (config.userOptions) userName;

      monitorSpec =
        m:
        if m.enabled then
          {
            output = m.name;
            mode = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
            position = "${toString m.x}x${toString m.y}";
            scale = 1;
          }
        else
          {
            output = m.name;
            disabled = true;
          };
    in

    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      programs.hyprland.enable = true;
      environment.variables = {
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_DESKTOP = "Hyprland";
        GTK_USE_PORTAL = "1";
        GDK_BACKEND = "wayland,x11";
        QT_QPA_PLATFORM = "wayland";
      };

      home-manager.users.${userName} = {
        wayland.windowManager.hyprland = {
          configType = "lua";
          enable = true;
          settings = {
            mainMod = {
              _var = "SUPER";
            };
            terminal = {
              _var = "ghostty";
            };
            fileManager = {
              _var = "ghostty -e yazi";
            };
            menu = {
              _var = "vicinae toggle";
            };
            screenshot = {
              _var = "flameshot gui -c -p ~/Pictures";
            };

            monitor = map monitorSpec config.monitors;

            on = {
              _args = [
                "hyprland.start"
                (lib.generators.mkLuaInline ''
                  function()
                    hl.exec_cmd("noctalia")
                  end'')
              ];
            };

            config = {
              input = {
                kb_layout = "de";
              };

              master = {
                new_status = "master";
              };

              general = {
                gaps_in = 4;
                gaps_out = {
                  top = 16;
                  right = 21;
                  bottom = 12;
                  left = 21;
                };
                border_size = 2;
                resize_on_border = false;
                allow_tearing = false;
                layout = "dwindle";
              };

              decoration = {
                rounding = 6;
                rounding_power = 4;
                active_opacity = 1.0;
                inactive_opacity = 1.0;
                shadow = {
                  enabled = false;
                  range = 4;
                  render_power = 3;
                };
                blur = {
                  enabled = true;
                  size = 2;
                  passes = 4;
                  vibrancy = 0.1696;
                };
              };

              animations.enabled = true;
            };

            curve = [
              {
                _args = [
                  "myBezier"
                  {
                    type = "bezier";
                    points = [
                      [
                        0.23
                        1
                      ]
                      [
                        0.32
                        1
                      ]
                    ];
                  }
                ];
              }
            ];

            animation = [
              {
                _args = [
                  {
                    leaf = "windows";
                    enabled = true;
                    speed = 5;
                    bezier = "myBezier";
                    stlye = "popin 70%";
                  }
                ];
              }
              {
                _args = [
                  {
                    leaf = "workspacesIn";
                    enabled = true;
                    speed = 3.5;
                    bezier = "myBezier";
                    style = "slide";
                  }
                ];
              }
              {
                _args = [
                  {
                    leaf = "workspacesOut";
                    enabled = true;
                    speed = 3.5;
                    bezier = "easeOutQuint";
                    style = "slide";
                  }
                ];
              }
            ];

            bind = [
              {
                _args = [
                  (lib.generators.mkLuaInline ''mainMod .. " + Q"'')
                  (lib.generators.mkLuaInline "hl.dsp.exec_cmd(terminal)")
                ];
              }
              {
                _args = [
                  (lib.generators.mkLuaInline ''mainMod .. " + C"'')
                  (lib.generators.mkLuaInline "hl.dsp.window.close()")
                ];
              }
              {
                _args = [
                  (lib.generators.mkLuaInline ''mainMod .. " + E"'')
                  (lib.generators.mkLuaInline "hl.dsp.exec_cmd(fileManager)")
                ];
              }
              {
                _args = [
                  (lib.generators.mkLuaInline ''mainMod .. " + W"'')
                  (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("zen")'')
                ];
              }
              {
                _args = [
                  (lib.generators.mkLuaInline ''mainMod .. " + V"'')
                  (lib.generators.mkLuaInline ''hl.dsp.window.float({ action = "toggle" })'')
                ];
              }
              {
                _args = [
                  (lib.generators.mkLuaInline ''mainMod .. " + SPACE"'')
                  (lib.generators.mkLuaInline "hl.dsp.exec_cmd(menu)")
                ];
              }
              {
                _args = [
                  (lib.generators.mkLuaInline ''mainMod .. " + S"'')
                  (lib.generators.mkLuaInline "hl.dsp.exec_cmd(screenshot)")
                ];
              }
              {
                _args = [
                  (lib.generators.mkLuaInline ''mainMod .. " + mouse_down"'')
                  (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = "e+1" })'')
                ];
              }
              {
                _args = [
                  (lib.generators.mkLuaInline ''mainMod .. " + mouse_up"'')
                  (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = "e-1" })'')
                ];
              }
            ];

            window_rule = [
              {
                name = "suppress-maximize-events";
                match = {
                  class = ".*";
                };
                suppress_event = "maximize";
              }
              {
                name = "fix-xwayland-drags";
                match = {
                  class = "^$";
                  title = "^$";
                  xwayland = true;
                  float = true;
                  fullscreen = false;
                  pin = false;
                };
                no_focus = true;
              }
            ];

            workspace_rule = [
              {
                workspace = "10";
                persistent = true;
              }
            ];
          };

          extraConfig = ''
            for i = 1, 10 do
              local key = i % 10
              hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
              hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
            end

            for i = 1, 5 do
              hl.workspace_rule({ workspace = tostring(i), persistent = true })
            end
          '';
        };
      };
    };
}
