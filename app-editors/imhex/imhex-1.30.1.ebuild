# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A hex editor for reverse engineers, programmers, and eyesight"
HOMEPAGE="https://github.com/WerWolv/ImHex"
SRC_URI="https://download.njuu.cf/WerWolv/ImHex/releases/download/v1.30.1/imhex-1.30.1-x86_64.AppImage"
S="${WORKDIR}"
# S_PATTERNS="${WORKDIR}/ImHex-Patterns-ImHex-v${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

RDEPEND="sys-fs/fuse:0"


QA_PREBUILT="*"

src_install() {
	newbin "${DISTDIR}/imhex-1.30.1-x86_64.AppImage" ImHex
}