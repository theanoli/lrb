# shell.nix
{ pkgs ? import <2111> {} }:
let
	python-with-my-packages = pkgs.python38.withPackages (p: with p; [
		#pandas
		#pyyaml
		#numpy
		#pymongo
		#scikitlearn
		#pip
		#setuptools
		#wheel
		#loguru
		pywebcachesim
	]);
	pywebcachesim = pkgs.callPackage /home/theano/webcachesim/python-package/release.nix {
		pkgs=pkgs; buildPythonPackage=pkgs.python38Packages.buildPythonPackage; };
in
python-with-my-packages.env # replacement for pkgs.mkShell
