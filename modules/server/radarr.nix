{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.mediaServer.enable {
    services.radarr = {
      enable = true;
      user = "media";
      group = "media";
      #datarDir = "mnt/mediadrive/radarr/config";
      openFirewall = true;
      settings = {
        server = {
          urlbase = "localhost";
          port = 7878;
          bindaddress = "*";
        };
      };
    };
  };
}
