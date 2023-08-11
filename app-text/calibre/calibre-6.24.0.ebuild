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

# src_compile() {
# 	true
# }

src_install() {
	# cp -r "${S}" "${WORKDIR}/calibre"

	#Install in /opt
	insinto /opt/calibre/
	doins -r "${WORKDIR}/calibre"
	# fperms +x /opt/calibre/

	#Install icon and desktop file
	# domenu "${FILESDIR}/calibre.desktop"
}
