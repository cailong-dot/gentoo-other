# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit  meson xdg

DESCRIPTION="A generic Document Reader"
HOMEPAGE="https://github.com/linuxmint/xreader"
SRC_URI="https://mirror.ghproxy.com/https://github.com/linuxmint/xreader/archive/refs/tags/master.mint21.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~amd64-linux "
#IUSE="cups djvu dvi gstreamer gnome keyring gtk-doc +introspection nautilus postscript spell tiff xps"

DEPEND="
	dev-libs/gobject-introspection
	app-text/libspectre
	x11-libs/xapp
	app-text/djvu
	x11-libs/gtk+
	app-text/poppler
	media-libs/tiff
	x11-libs/xapp
	dev-libs/libxslt
	mate-base/mate-common
	dev-libs/kpathsea
	app-text/libspectre
	app-text/libgxps
	app-crypt/libsecret
	x11-libs/xapp
	app-text/yelp-tools
	net-libs/webkit-gtk
"
BDEPEND="
	dev-build/meson
	virtual/pkgconfig
"

src_prepare() {
	default
	xdg_environment_reset
}

src_configure() {
	local emesonargs=(
		--prefix=/usr
		-Dcomics=true
		-Ddjvu=true
		-Ddvi=true
		-Dpdf=true
		-Depub=true
		-Dps=true
		-Dtiff=true
		-Dxps=true
		-Dt1lib=false
		-Dpixbuf=false
		-Dgtk_unix_print=true
		-Dkering=true
		-Dmathjax-directory=false
		-Dpreviewer=true
		-Dthumbnailer=true
		-Ddocs=false
		-Dhelp_files=false
		-Dintrospection=true
		-Denable_dbus=true
		-Ddeprecated_warnings=false
		-Denable_debug=false
	)
	meson_src_configure
}

src_install() {
	meson_src_install
}

pkg_postinst() {
	xdg_pkg_postinst
}

pkg_postrm() {
	xdg_pkg_postrm
}
