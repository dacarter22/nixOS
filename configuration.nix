{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  # VirtualBox guest support
  virtualisation.virtualbox.guest.enable = true;

  # Graphics / GUI
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];

  # Use LightDM instead of GDM (fixes crash in VirtualBox)
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  hardware.graphics.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "vboxsf" ];
  };

  environment.systemPackages = with pkgs; [
    nano
    vim
    helix
    git
    curl
    neofetch
    python3
    python3Packages.pip
    docker
    gnumake
  ];

  system.stateVersion = "25.11";
}