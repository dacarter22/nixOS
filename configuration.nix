{ pkgs, ... }: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/NewYork";

  virtualisation.docker.enable = true;

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
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
  ];

  system.stateVersion = "25.11";
}