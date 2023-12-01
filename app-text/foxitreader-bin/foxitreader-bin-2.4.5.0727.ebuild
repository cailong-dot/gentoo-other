# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

DESCRIPTION="A free PDF document viewer, featuring small size, quick startup, and fast page rendering"
HOMEPAGE="https://www.foxitsoftware.cn/downloads/"
SRC_URI="https://mirror.ghproxy.com/https://github.com/cailong-dot/gentoo-other/releases/download/%E8%87%AA%E7%94%A8/foxitreader-${PV}.tar.gz"

LICENSE="${PN}"
SLOT="0"
KEYWORDS="amd64 -*"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"
src_compile() {
	true
}

src_install() {
	#dodir "${WORKDIR}/foxitreader"
    #cp -r "${S}"/*/* "${WORKDIR}/foxitreader"

    #Install in /opt
    insinto /opt/
    doins -r "${WORKDIR}/foxitreader"
    #Install icon and desktop file
    domenu "/opt/foxitreader/FoxitReader.desktop"
}
