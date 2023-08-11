# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Calibre is an ebook management software"
HOMEPAGE="https://calibre-ebook.com"



SRC_URI="https://download.calibre-ebook.com/${PV}/calibre-${PV}-x86_64.txz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_compile() {
	true
}

src_install() {
	dodir /opt/calibre-${PV}

	insinto /opt/calibre-${PV}
	doins -r ${S}-x86_64/lib
	doins -r ${S}-x86_64/resources

	dodir /opt/calibre-${PV}-x86_64/bin
	exeinto /opt/calibre-${PV}-x86_64/bin
	doexe ${S}-x86_64/bin/*

	# exeinto /usr/bin
	# doexe ${FILESDIR}/calibre-bin

	# sed -i -e "s|@PATH@|/opt/calibre-${PV}|g" ${D}/usr/bin/calibre-bin
}
