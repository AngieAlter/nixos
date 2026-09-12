{ 
	pkgs,
	lib,
	config,
	...
}:
{
	config = lib.mkIf config.mediaServer.enable {
	services.jellyfin = {
		enable = true;
		openFirewall = true;

	#dataDir = "/mnt/mediaserver/jellyfin/config
	};
	};
}
