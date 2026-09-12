{
	pkgs,
	lib,
	config,
	...
}:
{
	config = lib.mkIf config.mediaServer.enable {
		services.bazarr = {
			enable = true;
			user = "media";
			group = "media";
			#dataDir = "mnt/mediadrive/bazarr/config";
			openFirewall = true;
			listenPort = 6767;
		};
	};
}
