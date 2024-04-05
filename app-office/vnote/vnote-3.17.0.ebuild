# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils xdg-utils git-r3

DESCRIPTION="VNote is a pleasant note-taking platform since 2016. VNote is open source and available on GitHub."
HOMEPAGE="https://vnotex.github.io/vnote/"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
EGIT_REPO_URI="https://mirror.ghproxy.com/https://github.com/vnotex/vnote.git"
EGIT_COMMIT="v${PV}"

RESTRICT="
bindist
mirror
strip"

DEPEND="
>=dev-qt/qtcore-5.15.2:5=
>=dev-qt/qtwebengine-5.15.2:5=[widgets]
>=dev-qt/qtwebchannel-5.15.2:5=
>=dev-qt/qtlocation-5.15.2:5=
>=dev-qt/qttranslations-5.15.2:5=
>=dev-qt/qtsvg-5.15.2:5=

>=dev-libs/openssl-1.1.1l
"
RDEPEND="${DEPEND}"
BDEPEND=""

W="${WORKDIR}"
S="${W}/${P}"

BUILD="${WORKDIR}/build"

src_configure() {
	eqmake5 vnote.pro \
		PREFIX="${BUILD}"/usr \
		DATADIR="${BUILD}"/usr/share
}

src_install() {
	emake install

	insinto /usr/bin
	doins "${BUILD}/usr/bin/vnote_extra.rcc"

	exeinto /usr/bin
	doexe "${BUILD}/usr/bin/vnote"

	insinto /usr/share
	doins -r "${BUILD}"/usr/share/{icons,applications}

	dolib.so ${BUILD}/usr/lib/*.so*
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}
