# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

DESCRIPTION="XnConvert: The Best Bulk Image Converter"
HOMEPAGE="https://www.xnview.com/en/xnconvert/"
SRC_URI="https://download.xnview.com/XnConvert-linux-x64.deb"

LICENSE="freedist XnView"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip test"

RDEPEND=""

S="${WORKDIR}"

QA_PREBUILT="*"

src_prepare() {
	default
	sed \
		-e "/Exec=xnconvert %U/c Exec=/opt/XnConvert/xnconvert.sh" \
		-i "${S}"/usr/share/applications/XnConvert.desktop || die
	rm -rf "${S}"/usr/bin
}

src_install() {
	doins -r opt
	doins -r usr
	fperms -R 755 /opt/XnConvert
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}