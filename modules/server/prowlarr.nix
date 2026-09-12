{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.mediaServer.enable {
    services.prowlarr = {
      enable = true;
      #dataDir = "mnt/mediadrive/prowlarr/config";
      openFirewall = true;
      settings = {
        server = {
          urlbase = "localhost";
          port = 9696;
          bindaddress = "*";
        };
      };
    };
  };
}
