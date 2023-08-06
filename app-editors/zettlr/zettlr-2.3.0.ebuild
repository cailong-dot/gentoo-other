# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Your One-Stop Publication Workbench."
HOMEPAGE="https://github.com/Zettlr/Zettlr"

SRC_URI="https://git.xfj0.cn/https://github.com/Zettlr/Zettlr/releases/download/v${PV}/Zettlr-2.3.0-x86_64.AppImage"
KEYWORDS="~amd64"

LICENSE="GPL-3"
SLOT="0"
RESTRICT="strip"

RDEPEND="sys-fs/fuse:0"

S="${WORKDIR}"

QA_PREBUILT="*"

src_install() {
	newbin "${DISTDIR}/Zettlr-2.3.0-x86_64.AppImage" zettlr
}
