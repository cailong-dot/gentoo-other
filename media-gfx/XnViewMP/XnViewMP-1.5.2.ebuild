# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="XnView MP image viewer/converter"
HOMEPAGE="http://www.xnview.com/"
SRC_URI="https://download.xnview.com/XnView_MP.glibc2.17-x86_64.AppImage"
S="${WORKDIR}"
# S_PATTERNS="${WORKDIR}/ImHex-Patterns-ImHex-v${PV}"

LICENSE="freedist XnView"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

RDEPEND="sys-fs/fuse:0"


QA_PREBUILT="*"

src_install() {
	newbin "${DISTDIR}/XnView_MP.glibc2.17-x86_64.AppImage" XnView
}