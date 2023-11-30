# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit desktop

SR="RC1"
RNAME="2023-12"

SRC_BASE="https://mirrors.neusoft.edu.cn/eclipse/technology/epp/downloads/release/${RNAME}/${SR}/eclipse-java-${RNAME}-${SR}-linux-gtk"

DESCRIPTION="Eclipse SDK"
HOMEPAGE="http://www.eclipse.org"
SRC_URI="https://mirrors.neusoft.edu.cn/eclipse/technology/epp/downloads/release/${RNAME}/${SR}/eclipse-java-${RNAME}-${SR}-linux-gtk-x86_64.tar.gz"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~x86 amd64"
IUSE=""

RDEPEND="
	>=virtual/jdk-1.8
	x11-libs/gtk+:2"

S=${WORKDIR}/eclipse

src_install() {
	local dest=/opt/${PN}

	insinto ${dest}
	doins -r features icon.xpm plugins artifacts.xml p2 eclipse.ini configuration dropins

	exeinto ${dest}
	doexe eclipse

	docinto html
	dodoc -r readme/*

	cp "${FILESDIR}"/eclipserc-bin-${SLOT} "${T}" || die
	cp "${FILESDIR}"/eclipse-bin-${SLOT} "${T}" || die
	sed "s@%SLOT%@${SLOT}@" -i "${T}"/eclipse{,rc}-bin-${SLOT} || die

	insinto /etc
	newins "${T}"/eclipserc-bin-${SLOT} eclipserc-bin-${SLOT}

	newbin "${T}"/eclipse-bin-${SLOT} eclipse-bin-${SLOT}
	make_desktop_entry "eclipse-bin-${SLOT}" "Eclipse ${PV} (bin)" "${dest}/icon.xpm"
}
