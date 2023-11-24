# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Calibre is an ebook management software"
HOMEPAGE="https://calibre-ebook.com"

SRC_URI="https://mirror.ghproxy.com/https://github.com/kovidgoyal/calibre/releases/download/v${PV}/calibre-${PV}-x86_64.txz"


LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_compile() {
	true
}

src_install() {
	dodir "${WORKDIR}/calibre-${PV}"
	cp -r "${S}" "${WORKDIR}/calibre-${PV}"

	#Install in /opt
	insinto /opt
	doins -r "${WORKDIR}/calibre-${PV}"
	fperms -R 755 /opt/calibre-${PV}

	#Install icon and desktop file
	# domenu "${FILESDIR}/calibre.desktop"
}
