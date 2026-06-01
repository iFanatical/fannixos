{ stdenv, lib, pkg-config, libdrm, xorg, perl }:

stdenv.mkDerivation {
  pname = "cmdemo";
  version = "alpha-v3";
  
  src = ./cmdemo;
  
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ libdrm xorg.libX11 xorg.libXrandr perl ];
  
  buildPhase = ''
    runHook preBuild
    make
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin $out/libexec/cmdemo
    install -m755 cmdemo $out/libexec/cmdemo/cmdemo
    install -m755 ${./cmdemo/cmdemo_script} $out/lib/exec/cmdemo/cmdemo_script

    sed -i "1s|.*|#!${perl}/bin/perl|" $out/libexec/cmdemo/cmdemo_script

    ln -s $out/libexec/cmdemo/cmdemo_script $out/bin/cmdemo_scripts
    ln -s $out/libexec/cmdemo/cmdemo $out/bin/cmdemo
    runHook postInstall
  '';

  meta = with lib; {
    description = "AMD color manager for adjusting screen saturation.";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}

