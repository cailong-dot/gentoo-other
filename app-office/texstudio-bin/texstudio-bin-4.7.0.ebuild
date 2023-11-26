# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg-utils

DESCRIPTION="TeXstudio is a fully featured LaTeX editor. Our goal is to make writing LaTeX documents as easy and comfortable as possible."
HOMEPAGE="https://www.texstudio.org"
SRC_URI="https://mirror.ghproxy.com/https://github.com/cailong-dot/gentoo-other/releases/download/%E8%87%AA%E7%94%A8/texstudio-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
"
BDEPEND=""

RESTRICT="mirror"
S="${WORKDIR}"

src_unpack() {
	# unpack_deb ${A}
	default
}

src_install() {
	cp -r "${S}"/*/*  /
	# doins -r /
	# cp ${S}/* /
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}