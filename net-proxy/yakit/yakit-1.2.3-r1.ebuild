# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
MY_PN="${PV/-sp3/}"
DESCRIPTION="Cyber Security ALL-IN-ONE Platform "
HOMEPAGE="https://yaklang.io"
SRC_URI="https://git.xfj0.cn/https://github.com/yaklang/yakit/releases/download/v${MY_PN}/Yakit-${MY_PN}-linux-amd64.AppImage"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

SLOT="0"
RESTRICT="strip"

RDEPEND="sys-fs/fuse:0"

S="${WORKDIR}"

QA_PREBUILT="*"

src_install() {
	newbin "${DISTDIR}/Yakit-1.2.3-sp3-linux-amd64.AppImage" Yakit
}