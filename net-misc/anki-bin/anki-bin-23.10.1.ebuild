# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..11} )
inherit desktop xdg

MY_PN=${PN%-bin}
DESCRIPTION="A spaced-repetition memory training program (flash cards)"
HOMEPAGE="https://apps.ankiweb.net/"
SRC_URI="https://mirror.ghproxy.com/https://github.com/ankitects/anki/releases/download/23.10.1/anki-23.10.1-linux-qt6.tar.zst"

LICENSE="AGPL-3+ Apache-2.0 BSD CC-BY-3.0 GPL-3+ MIT"
SLOT="1"
KEYWORDS="~amd64"

RDEPEND="
	app-misc/ca-certificates
	!app-misc/anki
"
BDEPEND="
	app-arch/unzip
	app-arch/zstd
	app-arch/tar"
QA_PREBUILT="*"
S="${WORKDIR}"

# src_unpack() {
# 	zstd -d ${A}
# }

src_prepare() {
	unpack ${A}
	# unpack ./data.tar.xz

	eapply_user

}

src_install() {
	# domenu "${FILESDIR}/anki.desktop"
	# doicon "${S}/anki.png"
	mkdir -p "${D}/opt/anki" || die
	cp -r "${S}"/* "${D}/opt/anki/" || die
	dosym ../anki/anki /opt/bin/anki
}

pkg_postinst() {
	update-desktop-database
}