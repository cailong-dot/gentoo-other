# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit xdg

MY_PN="Rainlendar-Lite"
MY_P=${MY_PN}-${PV}
DESCRIPTION="Feature rich calendar application that is easy to use and doesn't take much space on your desktop."
HOMEPAGE="https://www.rainlendar.net"
SRC_URI="https://www.rainlendar.net/download/${PV}/${MY_P}-amd64.tar.bz2"


LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S=${WORKDIR}/rainlendar2

RESTRICT="mirror strip"

QA_TEXTRELS="opt/rainlendar2/plugins/iCalendarPlugin.so"

src_install() {
	insinto /opt/rainlendar2
	doins -r locale resources scripts skins rainlendar2.htb lfx.so
	# the executable searches in . for the dirs above
	exeinto /opt/rainlendar2
	doexe rainlendar2
	dosym /opt/rainlendar2/rainlendar2 /usr/bin/rainlendar2
	# dodoc Changes.txt
}