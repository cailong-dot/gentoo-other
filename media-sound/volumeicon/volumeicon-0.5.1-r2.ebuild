# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="A lightweight volume control that sits in your systray"
HOMEPAGE="http://nullwise.com/volumeicon.html"
SRC_URI="https://gitee.com/cailong-dot/gentoo-cailong/blob/master/xarchive/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="libnotify"

RDEPEND="
	dev-libs/glib:2
	media-libs/alsa-lib
	x11-libs/gtk+:3[X]
	x11-libs/libX11
	libnotify? ( >=x11-libs/libnotify-0.7 )
"
DEPEND="
	${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig
"

PATCHES=( "${FILESDIR}"/${PN}-0.5.1-fix-libnotify.patch )

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	# $(use_enable !alsa oss) fails wrt #419891, is likely only for OSS4
	econf $(use_enable libnotify notify)
}
