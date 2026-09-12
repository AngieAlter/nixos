{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.mediaServer.enable {
    services.flaresolverr = {
      enable = true;
      openFirewall = true;
      port = 8191;
    };
  };
}
