{ config, lib, ... }:
{
	options.mediaServer.enable = lib.mkEnableOption "Enable Jellyfin and ARR";

	imports = [
		./jellyfin.nix
		./prowlarr.nix
		./bazarr.nix
		./flaresolverr.nix
	#	./qbit.nix
		./radarr.nix
		./sonar.nix
	];
}
