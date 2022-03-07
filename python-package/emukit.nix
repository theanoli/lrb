{ pkgs, buildPythonPackage }:

buildPythonPackage rec {
	pname = "emukit-${version}";
	version = "0.4.9";

	src = pkgs.fetchurl {
		url = "https://files.pythonhosted.org/packages/a0/b9/d57828e1dc7d3a215dbeef9a661280fec41f8c39065070c017754c2d252a/emukit-0.4.9.tar.gz";
		sha256 = "100cdde8b4af16c8261a0af1870bfdd683b45e7b9a7a22dd2cf0241732f3a811";
	};

	propagatedBuildInputs = with pkgs.python38Packages; [
		cython
		emcee
		numpy
		gpy
		scipy
	];

	prePatch = ''
		substituteInPlace requirements/requirements.txt \
			--replace "GPy[plotting]" "gpy"
	'';

	doCheck = false;
}
