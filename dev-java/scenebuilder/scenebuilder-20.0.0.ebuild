# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

DESCRIPTION="Drag & Drop,Rapid Application Development."
HOMEPAGE="https://gluonhq.com/products/scene-builder/"
SRC_URI="https://download2.gluonhq.com/scenebuilder/20.0.0/install/linux/SceneBuilder-20.0.0.deb"

LICENSE="BSD"
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
	# doins -r usr
	# fperms -R 755 /opt/XnView
	# fperms -R 755 /usr/bin/xnview
}

# pkg_postinst() {
# 	xdg_icon_cache_update
# 	xdg_desktop_database_update
# 	xdg_mimeinfo_database_update
# }

# pkg_postrm() {
# 	xdg_icon_cache_update
# 	xdg_desktop_database_update
# 	xdg_mimeinfo_database_update
# }