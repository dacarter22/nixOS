{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  # Enable GUI
  services.xserver.enable = true;

  # GNOME
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = false; # IMPORTANT for VM/NOS3
  services.xserver.desktopManager.gnome.enable = true;

  # Audio (modern)
  sound.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Docker
  virtualisation.docker.enable = true;

  # User
  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };

  # Packages
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