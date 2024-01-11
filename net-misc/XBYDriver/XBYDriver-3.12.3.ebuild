# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="小白羊网盘 - Powered by 阿里云盘。"
HOMEPAGE="https://github.com/gaozhangmin/aliyunpan"
SRC_URI="https://mirror.ghproxy.com/https://github.com/gaozhangmin/aliyunpan/releases/download/v${PV}/XBYDriver-${PV}-linux-x86_64.AppImage"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

SLOT="0"
RESTRICT="strip"

RDEPEND="sys-fs/fuse:0"

S="${WORKDIR}"

QA_PREBUILT="*"

src_install() {
	newbin "${DISTDIR}/XBYDriver-${PV}-linux-x86_64.AppImage" XBYDriver
}