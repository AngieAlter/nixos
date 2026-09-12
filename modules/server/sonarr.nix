{
	pkgs,
	lib,
	config,
	...
}:
{
	config = lib.mkIf config.mediaServer.enable {
		services.sonarr = {
			enable = true;
			user = "media";
			group = "media";
				#datarDir = "mnt/mediadrive/sonarr/config";
			openFirewall = true;
			settings = {
				server = {
					urlbase = "localhost";
					port = 8989;
					bindaddress = "*";
				};
			};
		};
	};
}
