# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop wrapper xdg

MY_PN="eclipse"
MY_PV="2023-09"
SRC_URI="https://mirrors.tuna.tsinghua.edu.cn/eclipse/technology/epp/downloads/release/${MY_PV}/R/eclipse-jee-${MY_PV}-R-linux-gtk-x86_64.tar.gz"

DESCRIPTION="Eclipse IDE for Enterprise Java and Web Developers"
HOMEPAGE="https://www.eclipse.org/"

S="${WORKDIR}/${MY_PN}"

LICENSE="EPL-2.0"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"
RESTRICT="mirror"

RDEPEND="
	x11-libs/gtk+:3
"

QA_FLAGS_IGNORED=".*"

src_install() {
	insinto "/opt/${PN}"
	doins -r "${S}/."

	exeinto "/opt/${PN}"
	doexe "${S}/${MY_PN}"
	# make_wrapper ${PN%-*} "/opt/${PN}/${MY_PN} -vm /opt/openjdk*/bin/java" "" "/opt/${PN}" "/opt/bin"

	# doicon -s 48 plugins/org.eclipse.platform_4.28.0.v20230605-0440/eclipse48.png
	make_desktop_entry eclipse-jee "Eclipse IDE JEE ${MY_PV}" eclipse48 "Development;" \
		|| die "Failed making desktop entry!"
}
