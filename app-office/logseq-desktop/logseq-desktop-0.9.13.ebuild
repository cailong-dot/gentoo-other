# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# MY_PN="${PN/-bin/}"

DESCRIPTION="A privacy-first, open-source platform for knowledge sharing and management."
HOMEPAGE="https://github.com/logseq/logseq"

SRC_URI="https://ghproxy.com/https://github.com/logseq/logseq/releases/download/${PV}/Logseq-linux-x64-${PV}.AppImage"
KEYWORDS="~amd64"

LICENSE="Apache-2.0"
SLOT="0"
RESTRICT="strip"

RDEPEND="sys-fs/fuse:0"

S="${WORKDIR}"

QA_PREBUILT="*"

src_install() {
	newbin "${DISTDIR}/Logseq-linux-x64-0.9.13.AppImage" Logseq
}
