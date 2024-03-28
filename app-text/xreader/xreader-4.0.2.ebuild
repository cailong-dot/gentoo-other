# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit  meson xdg

DESCRIPTION="A generic Document Reader"
HOMEPAGE="https://github.com/linuxmint/xreader"
SRC_URI="https://mirror.ghproxy.com/https://github.com/cailong-dot/gentoo-other/releases/download/%E8%87%AA%E7%94%A8/xreader-4.0.2.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="dbus +pdf +ps +thumbnailer +previewer  +print +kering +tiff +xps -pixbuf -comics -mathjax -epub -docs -introspection -debug -dvi -t1lib -djvu"

DEPEND="
	app-accessibility/at-spi2-core:2
	dev-libs/glib:2
	dev-libs/libxml2:2
	sys-libs/zlib:=
	x11-libs/cairo
	dev-util/intltool
	
	comics? ( app-arch/libarchive:= )
	app-text/poppler:=[cairo,tiff,introspection]
	djvu? ( app-text/djvu:= )
	mathjax? ( dev-libs/mathjax:= )
	dvi? (
		app-text/libspectre:=
		dev-libs/kpathsea:=
		media-libs/t1lib
	)
	introspection? ( dev-libs/gobject-introspection:= )
	ps? ( app-text/libspectre:= )
	tiff? ( media-libs/tiff:= )
	xps? ( app-text/libgxps:= )

	x11-libs/xapp

	x11-libs/gtk+:3[cups,introspection]
	pixbuf? ( x11-libs/gdk-pixbuf:=[tiff] )

	dev-libs/libxslt
	mate-base/mate-common
	
	app-crypt/libsecret
	app-text/yelp-tools
	epub? ( >=net-libs/webkit-gtk-2.41 )
"
BDEPEND="
	virtual/pkgconfig
"

src_prepare() {
	default
	xdg_environment_reset
}

src_configure() {
	local emesonargs=(
		--prefix=/usr
		-Dbuildtype=plain
		-Denable_dbus=true
		-Dpdf=true
		-Dps=true
		-Dthumbnailer=true
		-Dpreviewer=true
		-Dgtk_unix_print=true
		-Dkeyring=true
		-Dtiff=true
		-Dxps=true
	)

	if use pixbuf; then
		emesonargs+=( -Dpixbuf=true )
	fi
	if use debug; then
		emesonargs+=( 
			-Ddebug=true
			-Ddeprecated_warnings=true
		 )
	fi
	if use !epub; then
		emesonargs+=( -Depub=false )
	fi
	if use mathjax; then
		emesonargs+=( -Dmathjax-directory=/usr/share/mathjax )
		# emesonargs+=( -Dmathjax-directory=/usr/share/mathjax )
	fi
	if use comics; then
		emesonargs+=( -Dcomics=true )
	fi
	if use djvu; then
		emesonargs+=( -Ddjvu=true )
	fi
	if use dvi; then
		emesonargs+=( 
			-Ddvi =true
			-Dt1lib =true
		)
	fi
	if use docs; then
		emesonargs+=( -Ddocs=true )
	fi
	if use introspection; then
		emesonargs+=( 
			-Dintrospection =true
		)
	fi
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
