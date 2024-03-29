# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
# inherit toolchain-funcs
DESCRIPTION="A lightweight, portable LaTeX distribution based on TeX Live."
HOMEPAGE="https://yihui.org/tinytex"
SRC_URI="
    https://mirror.ghproxy.com/https://github.com/cailong-dot/gentoo-other/releases/download/%E8%87%AA%E7%94%A8/texlive-mini-20240312.tar.gz
    https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet/install-tl-unx.tar.gz
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

src_compile() {
    # emake
    # "${WORKDIR}/${rust_stage0}"/install.sh --disable-ldconfig \
	# 		--without=rust-docs-json-preview,rust-docs --destdir="
    ./install-base.sh
}

# src_install() {
# 	TLREPO=${CTAN_REPO:-http://mirror.ctan.org/systems/texlive/tlnet}
# 	TLINST="install-tl-unx.tar.gz"
# 	TLURL=$TLREPO/$TLINST
# 	PRNAME="tinytex.profile"
# 	PRURL="https://yihui.org/gh/tinytex/tools"
# 	if [ $(uname) = 'Darwin' ]; then
# 	alias sedi="sed -i ''"
# 	[ -e $TLINST ] || curl -LO $TLURL
# 	[ -e $PRNAME ] || curl -LO $PRURL/$PRNAME
# 	else
# 	alias sedi="sed -i"
# 	[ -e $TLINST ] || wget $TLURL
# 	[ -e $PRNAME ] || wget $PRURL/$PRNAME
# 	# ask `tlmgr path add` to add binaries to ~/bin instead of the default
# 	# /usr/local/bin unless this script is invoked with the argument '--admin'
# 	# (e.g., users want to make LaTeX binaries available system-wide), in which
# 	# case we personalize texmf variables
# 	if [ "$1" = '--admin' ]; then
# 		echo 'TEXMFCONFIG $HOME/.TinyTeX/texmf-config' >> $PRNAME
# 		echo 'TEXMFVAR $HOME/.TinyTeX/texmf-var' >> $PRNAME
# 	else
# 		dodir -p $HOME/bin
# 		echo "tlpdbopt_sys_bin $HOME/bin" >> $PRNAME
# 	fi
# 	fi
# }
