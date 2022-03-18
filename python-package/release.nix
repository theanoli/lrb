{ pkgs, buildPythonPackage }:

buildPythonPackage rec {
	name = "pywebcachesim";

	src = /home/theano/webcachesim/python-package;

	propagatedBuildInputs = with pkgs.python38Packages; [
		pandas
		pyyaml
		numpy
		dnspython
		pymongo
	 	scikitlearn	
		pip
		setuptools
		wheel
		loguru
		emukit
	]; 

	doCheck = false; 

	emukit = pkgs.callPackage /home/theano/webcachesim/python-package/emukit.nix {
		pkgs=pkgs; buildPythonPackage=pkgs.python38Packages.buildPythonPackage; }; 

	prePatch = ''
		substituteInPlace setup.py \
			--replace "sklearn" "scikit-learn"
	''; 
}
