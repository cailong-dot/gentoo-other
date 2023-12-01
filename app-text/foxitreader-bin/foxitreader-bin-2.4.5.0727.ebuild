# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

DESCRIPTION="A free PDF document viewer, featuring small size, quick startup, and fast page rendering"
HOMEPAGE="https://www.foxitsoftware.cn/downloads/"
SRC_URI="https://cdn07.foxitsoftware.cn/pub/foxit/reader/desktop/linux/2.x/2.4/en_us/FoxitReader.enu.setup.${PV}.x64.run.tar.gz"

LICENSE="${PN}"
SLOT="0"
KEYWORDS="amd64 -*"
IUSE=""
MY_LANGS="de fr ja zh_CN zh_TW"
for MY_LANG in ${MY_LANGS} ; do
	IUSE="${IUSE} linguas_${MY_LANG}"
done

RDEPEND="
	dev-libs/atk
		dev-libs/glib:2
		media-libs/freetype:2
		net-print/cups
		x11-libs/cairo
		x11-libs/gtk+:2
		x11-libs/pango
"

S=${WORKDIR}/foxit-release

QA_PRESTRIPPED="/opt/FoxitReader"

src_install() {
	insinto /opt/${PN}/po
	local my_lang
	for my_lang in ${MY_LANGS} ; do
		if use linguas_${my_lang} ; then
			doins -r po/${my_linguas} || die
		fi
	done

	insinto /opt/${PN}
	doins fum.fhd fpdfcjk.bin || die

	insopts -m755
	doins FoxitReader || die

	make_wrapper ${PN} ./FoxitReader /opt/${PN}
	doicon "${FILESDIR}"/${PN}.png || die
	make_desktop_entry ${PN} ${PN} ${PN} "Application;Office;Viewer;" "MimeType=application/pdf;"

	dodoc Readme.txt || die
}

pkg_postinst() {
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
}
