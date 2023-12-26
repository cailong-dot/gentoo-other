# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2


EAPI=8

inherit java-vm-2 toolchain-funcs
DESCRIPTION="A free, supported, and 100% open-source distribution of OpenJDK, verified by TCK for Java SE."
HOMEPAGE="https://bell-sw.com"

LICENSE="GPL-2"
RESTRICT="mirror"
SLOT="21"
SRC_URI="https://download.bell-sw.com/java/${PV}+12/bellsoft-jdk${PV}+12-linux-amd64.tar.gz"
# 
KEYWORDS="~amd64"
IUSE="source"

QA_PREBUILT="*"

S="${WORKDIR}/jdk-${PV}"

src_unpack() {
	default
}

src_install() {
	local dest="/opt/${P}"
	local ddest="${ED}/${dest#/}"

	if ! use source ; then
		rm -v lib/src.zip || die
	fi

	rm -v lib/security/cacerts || die
	dosym -r /etc/ssl/certs/java/cacerts "${dest}"/lib/security/cacerts

	dodir "${dest}"
	cp -pPR * "${ddest}" || die

	# provide stable symlink
	dosym "${P}" "/opt/${PN}-${SLOT}"

	java-vm_install-env "${FILESDIR}"/${PN}.env.sh
	java-vm_set-pax-markings "${ddest}"
	java-vm_revdep-mask
	java-vm_sandbox-predict /dev/random /proc/self/coredump_filter
}

pkg_postinst() {
	java-vm-2_pkg_postinst
}