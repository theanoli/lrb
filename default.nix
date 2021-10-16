with import <nixpkgs> {}; 

mkShell {
	nativeBuildInputs = [ stdenv cmake glibc pkg-config ];
	buildInputs = [ procps boost ];

	# shellHook = ''
	# 	sudo bash ./scripts/install.sh $CMAKE_PREFIX_PATH
	# '';
}

