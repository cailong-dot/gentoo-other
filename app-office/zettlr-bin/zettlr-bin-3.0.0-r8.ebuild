# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
# MY_PN="${PV/-beta.8/}"

DESCRIPTION="A Markdown Editor for the 21st century."
HOMEPAGE="https://www.zettlr.com/"
SRC_URI="https://download.yzuu.cf/Zettlr/Zettlr/releases/download/v${PV}-beta.8/Zettlr-${PV}-beta.8-x86_64.AppImage"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SLOT="0"
RESTRICT="strip"

RDEPEND="sys-fs/fuse:0"

S="${WORKDIR}"

QA_PREBUILT="*"

src_install() {
	newbin "${DISTDIR}/Zettlr-${PV}-x86_64.AppImage" Zettlr
}