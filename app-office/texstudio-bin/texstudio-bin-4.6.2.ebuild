# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# MY_PV="${PV/_/}"
DESCRIPTION="Free cross-platform LaTeX editor (fork from texmakerX)"
HOMEPAGE="https://www.texstudio.org https://github.com/texstudio-org/texstudio"
# SRC_URI="https://github.com/texstudio-org/texstudio/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="https://mirrors.tuna.tsinghua.edu.cn/github-release/texstudio-org/texstudio/LatestRelease/texstudio-${PV}-x86_64.AppImage"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 x86"

RESTRICT="strip"

RDEPEND="sys-fs/fuse:0"

S="${WORKDIR}"

QA_PREBUILT="*"

src_install() {
	newbin "${DISTDIR}/texstudio-${PV}-x86_64.AppImage" Texstudio
}

