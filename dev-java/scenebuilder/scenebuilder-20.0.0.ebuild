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

src_install() {
	doins -r opt
}