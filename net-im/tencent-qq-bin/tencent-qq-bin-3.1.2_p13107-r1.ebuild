# Copyright 2019-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV=${PV/_p/-}

DESCRIPTION="The new version of the official linux-qq"
HOMEPAGE="https://im.qq.com/linuxqq/index.shtml"
LICENSE="Tencent"
RESTRICT="strip"

_I="ad5b5393"

SRC_URI="https://dldir1.qq.com/qqfile/qq/QQNT/$_I/linuxqq_${MY_PV}_x86_64.AppImage"

SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"

RESTRICT="strip"

RDEPEND="sys-fs/fuse:0"

S="${WORKDIR}"

QA_PREBUILT="*"

src_install() {
	newbin "${DISTDIR}/linuxqq_3.1.2-13107_x86_64.AppImage" QQ
}