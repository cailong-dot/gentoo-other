# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="TinyTeX is a lightweight, cross-platform, portable, and easy-to-maintain LaTeX distribution based on TeX Live."
HOMEPAGE="https://yihui.org/tinytex"
SRC_URI="https://ghproxy.com/https://github.com/rstudio/tinytex-releases/releases/download/v${PV}/TinyTeX-v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

# src_compile() {
# 	true
# }

src_install() {
	dodir "${WORKDIR}/tinytex-${PV}"
	cp -r "${S}" "${WORKDIR}/tinytex-${PV}"

	#Install in /opt
	insinto /opt
	doins -r "${WORKDIR}/tinytex-${PV}"
	fperms -R 755 /opt/tinytex-${PV}

	#Install icon and desktop file
	# domenu "${FILESDIR}/calibre.desktop"
}
