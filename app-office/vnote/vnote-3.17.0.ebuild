# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils xdg-utils

DESCRIPTION="A Vim-inspired note taking application that knows programmers and Markdown better"
HOMEPAGE="https://github.com/tamlok/vnote"

if [[ ${PV} == 9999 ]];then
	KEYWORDS=""
else
	KEYWORDS="~amd64"
	SRC_URI="https://mirror.ghproxy.com/https://github.com/cailong-dot/gentoo-other/releases/download/vnote-full-src/vnote-3.17.0.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
	dev-qt/qtwebchannel:5=
	dev-qt/qtsvg:5=
	dev-qt/qtlocation:5=
	dev-qt/qttranslations:5=
	dev-qt/qtwebengine:5=
	dev-qt/qtx11extras:5=
	dev-qt/qtdeclarative:5=
"
RDEPEND="${DEPEND}"

pkg_setup(){
	export INSTALL_ROOT="${D}"
}

src_configure(){
	eqmake5 vnote.pro
}

pkg_postinst(){
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm(){
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}