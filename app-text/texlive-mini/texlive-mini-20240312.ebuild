# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
# inherit toolchain-funcs
DESCRIPTION="A lightweight, portable LaTeX distribution based on TeX Live."
HOMEPAGE="https://yihui.org/tinytex"
SRC_URI="
    https://mirror.ghproxy.com/https://github.com/cailong-dot/gentoo-other/releases/download/%E8%87%AA%E7%94%A8/texlive-mini-20240312.tar.gz
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 amd64"
IUSE=""

# DEPEND=""
# RDEPEND="${DEPEND}"
# BDEPEND=""

# S="${WORKDIR}"
S="${WORKDIR}/${P}"

# src_configure() {
# 	local dest="/opt/tinytex"
# 	local ddest="${ED}/${dest#/}"
# 	dodir "${dest}"
# 	cp -pPR * "${ddest}" || die
# 	echo 'TEXPATH="/opt/tinytex/bin/x86_64-linux"' > "${T}"/98tinytex || die
# 	doenvd "${T}"/98tinytex
# }


src_install() {
        emake
}
