{
  nixpkgs,
  lib,
  pkgs,
  ...
}:

{

  nixpkgs.config.allowUnfree = lib.mkForce true;
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      # hosts = ["unix:///var/run/docker.sock"];
      log-driver = "json-file";
      registry-mirrors = [ "https://docker.m.daocloud.io" ];
    };
    # storageDriver = "btrfs";
  };

  # hardware.nvidia-container-toolkit.enable = true;
  # services.xserver.videoDrivers = [
  #   "modesetting"
  #   "fbdev"
  #   "nvidia"
  #   "amdgpu"
  # ];
  # hardware.nvidia.open = true;
  # virtualisation.oci-containers = {
  #   backend = "docker";
  # };
}
