# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
6.20.0.5510
EAPI=8
inherit xdg-utils font

KEYWORDS="~amd64"

DESCRIPTION="Free Download Manager allows you to adjust traffic usage, organize downloads, control file priorities for torrents, efficiently download large files and resume broken downloads."
HOMEPAGE="https://www.freedownloadmanager.org/"
# SRC_URI="https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb"
SRC_URI="https://mirrors.sdu.edu.cn/spark-store-repository/amd64-store/network/freedownloadmanager/freedownloadmanager_6.19.1.5263_amd64.deb"

SLOT="0"
RESTRICT="strip"
LICENSE="GPL-2"
IUSE=""

RDEPEND="
	dev-libs/openssl
	x11-misc/xdg-utils
	media-video/ffmpeg
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	net-libs/libtorrent
"

DEPEND="
"

S="${WORKDIR}"

src_prepare() {
	unpack ./control.tar.xz
	unpack ./data.tar.xz

	eapply_user

}

src_install() {
	local FDMROOT=/opt/freedownloadmanager
	doins -r opt
	doins -r usr
	make_desktop_entry "fdm" "Free Download Manager" "" "Network"
	make_wrapper fdm ${FDMROOT}/fdm ${FDMROOT} ${FDMROOT}/lib /opt/bin
}

pkg_postinst() {
	xdg_icon_cache_update
	chmod +x /opt/freedownloadmanager/fdm
}

pkg_postrm() {
	xdg_icon_cache_update
}
