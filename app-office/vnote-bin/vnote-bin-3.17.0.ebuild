# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg-utils

DESCRIPTION="A pleasant note-taking platform."
HOMEPAGE="https://app.vnote.fun/"
SRC_URI="https://mirrors.sdu.edu.cn/spark-store-repository/amd64-store/office/vnote/vnote_3.17.0_amd64.deb"

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
	unpack_deb ${A}
}

src_install() {
	cp -a * "${ED}/"
	ln -s vnote "${ED}/usr/bin/Zettlr"
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}