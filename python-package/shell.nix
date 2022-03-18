# shell.nix
{ pkgs ? import <nixpkgs> {} }:

let
	my-python = pkgs.python38;
	python-with-my-packages = my-python.withPackages (p: with p; [
		pywebcachesim
	]);

	pywebcachesim = pkgs.callPackage /home/theano/webcachesim/python-package/release.nix {
		pkgs=pkgs; buildPythonPackage=pkgs.python38Packages.buildPythonPackage; };
in
pkgs.mkShell {
	buildInputs = with pkgs; [
		python-with-my-packages
	];
	nativeBuildInputs = with pkgs; [
		stdenv
		cmake
		pkg-config
		gcc9
	];

	shellHook = ''
	PYTHONPATH=${python-with-my-packages}/${python-with-my-packages.sitePackages}
	# maybe set more env-vars
	'';
}
