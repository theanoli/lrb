with import <nixpkgs> {}; 

mkShell {
	#nativeBuildInputs = [ ];
	buildInputs = [ gcc9 stdenv cmake pkg-config binutils procps boost169 openssl gsasl ];

	# shellHook = ''
	# 	sudo bash ./scripts/install.sh $CMAKE_PREFIX_PATH
	# '';
}
