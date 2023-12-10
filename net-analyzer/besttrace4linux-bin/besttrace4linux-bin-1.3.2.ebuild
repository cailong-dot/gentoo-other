# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit fcaps

DESCRIPTION="附带链路可视化的 traceroute 工具"
HOMEPAGE="https://www.ipip.net"
SRC_URI="https://mirror.ghproxy.com/https://github.com/cailong-dot/gentoo-other/releases/download/besttrace-linux/besttrace4linux.zip -> ${P}.zip"
S=${WORKDIR}

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

BDEPEND="app-arch/unzip"

FILECAPS=( cap_net_raw=ep /usr/bin/besttrace )

src_install() {
	use amd64 && dobin besttrace
	use x86 && newbin besttrace32 besttrace
	use arm && newbin besttracearm besttrace
}
