{
  description = "A very basic flake";

  inputs.gtk4-layer-shell.url = "git+file:/home/shekhinah/Projects/flakes/gtk4-layer-shell";
  inputs.flake-compat = {
  url = "github:edolstra/flake-compat";
  flake = false;
};

  outputs = { self, nixpkgs, gtk4-layer-shell, flake-compat }: 
  let pkgs = import nixpkgs { system = "x86_64-linux"; };
  in {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    devShells.x86_64-linux.default = pkgs.mkShell {

      buildInputs = with pkgs; [

    ghc

      zlib
      zlib.static
    zlib.dev
  
    gtk3
    gtk4

    freetype
    harfbuzz
    graphene

    gobject-introspection

    gdk-pixbuf-xlib

    atk
    glib
    gdk-pixbuf
    pango
    harfbuzzFull
    cairo 
    
    gtk-layer-shell
    pkg-config
    deno
    mdbook
    git 

    pcre2
    libadwaita
    clutter
    cogl
    libdbusmenu-gtk3
    gst_all_1.gst-editing-services

    libnotify
    vips
    vte
    gtk-layer-shell
    libsecret
    json-glib
    ostree
    libwnck
    poppler
    poppler_gi
    gnome.libsoup
    webkitgtk
    ibus
    librsvg
    gtksourceview
    gtksourceview4
    gtksourceview5
    libhandy
    webkitgtk
    webkitgtk_6_0

    libgit2-glib

    gtk4-layer-shell.packages."x86_64-linux".gtk4-layer-shell
    (haskell.packages.ghc927.ghcWithPackages (pkgs: with pkgs; [ cabal-install stack ]))

jq    
        
      ];
      HASKELL_GI_GIR_SEARCH_PATH="${gtk4-layer-shell.packages.x86_64-linux.gtk4-layer-shell}/share/gir-1.0/";
    };

  };
}
