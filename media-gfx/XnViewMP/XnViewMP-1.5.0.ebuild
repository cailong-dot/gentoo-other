# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

DESCRIPTION="XnView MP: Image management"
HOMEPAGE="https://www.xnview.com/en/xnviewmp/"
SRC_URI="https://download.xnview.com/XnViewMP-linux-x64.deb"

LICENSE="freedist XnView"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip test"

RDEPEND=""

S="${WORKDIR}"

QA_PREBUILT="*"

# src_prepare() {
# 	default
# 	sed \
# 		-e "8 s/^/#/" \
# 		-i "${S}"/usr/share/applications/XnConvert.desktop || die
# 	# sed \
# 	# 	-e "/Exec=xnconvert %U/c Exec=/opt/XnConvert/xnconvert.sh" \
# 	# 	-i "${S}"/usr/share/applications/XnConvert.desktop || die
# 	# rm -rf "${S}"/usr/bin
# }

src_install() {
	doins -r opt
	doins -r usr
	fperms -R 755 /opt/XnView
	fperms -R 755 /usr/bin/xnview
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