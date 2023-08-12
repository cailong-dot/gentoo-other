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

src_install() {
	# domenu usr/share/applications/onlyoffice-desktopeditors.desktop
	# for size in {16,24,32,48,64,128,256}; do
	# 	newicon -s "${size}" opt/onlyoffice/desktopeditors/asc-de-"${size}".png onlyoffice-desktopeditors.png
	# done

	# dobin usr/bin/desktopeditors usr/bin/onlyoffice-desktopeditors
	doins -r opt
	# fperms +x /opt/onlyoffice/desktopeditors/{DesktopEditors,editors_helper,converter/x2t}
}