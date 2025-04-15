{
  description = "maidnix";

  inputs = {
    nixos.url = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixos-24.11/nixexprs.tar.xz";
    nixpkgs.url = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixpkgs-unstable/nixexprs.tar.xz";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  nixConfig = {
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://nix-community.cachix.org"
    ];
  };

  outputs =
    {
      self,
      nixos,
      nixpkgs,
      nixos-wsl,
      home-manager,
      ...
    }@inputs:
    let
      usr = "maidf";
      syshost = "mlnix";
    in
    {
      nixosConfigurations = {
        "${syshost}" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };

          modules = [

            ./configuration.nix

            #  ./programs/bash.nix
            #  ./programs/git.nix
            ./programs/default.nix

            ./services/default.nix

            (
              { pkgs, ... }:
              {
                users.users."${usr}" = {
                  isNormalUser = true;
                  description = "${usr}";
                  shell = pkgs.bash;
                  extraGroups = [
                    "wheel"
                  ];
                };
                networking = {
                  hostName = "${syshost}";
                  firewall.enable = false;
                };
                programs = {
                  #   fish.enable = true;
                  nano.enable = false;
                  neovim = {
                    enable = true;
                    # defaulteditor = true;
                    # vimalias = true;
                    # vialias = true;
                  };
                };
                # services.displayManager.sddm.wayland.enable = true;
                # services.pipewire.alsa.enable = true;
              }
            )

            nixos-wsl.nixosModules.default
            {
              system.stateVersion = "24.11";
              # vscode-remote-workaround.enable = true;
              wsl = {
                enable = true;
                useWindowsDriver = true;
                defaultUser = "${usr}";
                wslConf.network.generateHosts = false;
              };
            }

            # 将 home-manager 配置为 nixos 的一个 module
            # 这样在 nixos-rebuild switch 时，home-manager 配置也会被自动部署
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users."${usr}" = import ./home/home.nix;

              # 使用 home-manager.extraSpecialArgs 自定义传递给 ./home.nix 的参数
              # 取消注释下面这一行，就可以在 home.nix 中使用 flake 的所有 inputs 参数了
              home-manager.extraSpecialArgs = inputs;
            }

            {
              # given the users in this list the right to specify additional substituters via:
              #    1. `nixConfig.substituters` in `flake.nix`
              nix.settings.trusted-users = [ "${usr}" ];
            }
          ];
        };
      };
    };
}
