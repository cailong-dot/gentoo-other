# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg-utils

DESCRIPTION="A pleasant note-taking platform."
HOMEPAGE="https://app.vnote.fun/"
SRC_URI="https://mirror.ghproxy.com/https://github.com/cailong-dot/gentoo-other/releases/download/%E8%87%AA%E7%94%A8/vnote-${PV}.tar.gz"

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
	# cp -a * "${ED}/"/
	insinto /
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}