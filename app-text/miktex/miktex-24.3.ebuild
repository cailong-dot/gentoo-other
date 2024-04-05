# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit  ninja-utils 

DESCRIPTION="MiKTeX is a modern TeX distribution for Windows, Linux and macOS. "
HOMEPAGE="https://miktex.org/"
SRC_URI="https://mirror.ghproxy.com/https://github.com/MiKTeX/miktex/archive/refs/tags/24.3.tar.gz -> miktex-24.3.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	media-libs/libpng:=
        app-arch/bzip2:=
        dev-libs/expat:=
        dev-libs/icu:=
        dev-libs/gmp:=
        dev-libs/mpfr:=
        dev-libs/popt:=
        media-gfx/potrace:=
        app-text/hunspell:=
        dev-libs/apr-util:=
        app-arch/lzma:=
        dev-libs/fribidi:=
        x11-libs/pixman:=
        media-libs/libjpeg-turbo:=
        media-gfx/graphite2:=
        media-libs/freetype:=
        media-libs/fontconfig:=
        x11-libs/cairo:=
        media-libs/harfbuzz:= 
        media-libs/gd:=
        dev-libs/log4cxx:=
        dev-libs/zziplib:=
        dev-libs/msgpack:= 
        app-text/poppler:=
        dev-libs/uriparser:=
        dev-libs/libmspack:=
        sci-libs/mpfi:=
"
BDEPEND="
	virtual/pkgconfig
"

src_configure() {
        cmake ../${P} CMAKE_INSTALL_PREFIX=/opt/miktex WITH_UI_QT=ON
}
src_install() {
	emake DESTDIR=/opt/miktex install
}

