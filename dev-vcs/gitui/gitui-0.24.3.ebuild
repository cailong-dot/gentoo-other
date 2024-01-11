# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

AG_PV="${PV}"

CRATES="
	addr2line@0.19.0
	adler@1.0.2
	aho-corasick@1.0.2
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.5.0
	anstyle@1.0.2
	anstyle-parse@0.2.1
	anstyle-query@1.0.0
	anstyle-wincon@2.1.0
	anyhow@1.0.75
	autocfg@1.1.0
	backtrace@0.3.67
	base64@0.13.1
	bincode@1.3.3
	bit-set@0.5.3
	bit-vec@0.6.3
	bitflags@1.3.2
	bugreport@0.5.0
	bumpalo@3.12.0
	bwrap@1.3.0
	bytesize@1.3.0
	cassowary@0.3.0
	cc@1.0.79
	cfg-if@1.0.0
	chrono@0.4.30
	clap@4.4.2
	clap_builder@4.4.2
	clap_lex@0.5.1
	codespan-reporting@0.11.1
	colorchoice@1.0.0
	core-foundation-sys@0.8.3
	crc32fast@1.3.2
	crossbeam-channel@0.5.8
	crossbeam-deque@0.8.2
	crossbeam-epoch@0.9.13
	crossbeam-utils@0.8.14
	crossterm@0.26.1
	crossterm_winapi@0.9.0
	cxx@1.0.90
	cxx-build@1.0.90
	cxxbridge-flags@1.0.90
	cxxbridge-macro@1.0.90
	dashmap@5.4.0
	diff@0.1.13
	dirs@5.0.1
	dirs-sys@0.4.1
	easy-cast@0.5.2
	either@1.8.1
	env_logger@0.10.0
	errno@0.2.8
	errno-dragonfly@0.1.2
	fancy-regex@0.11.0
	fastrand@1.9.0
	filetime@0.2.20
	filetreelist@0.5.0
	flate2@1.0.25
	fnv@1.0.7
	form_urlencoded@1.2.0
	fsevent-sys@4.1.0
	futures@0.3.26
	futures-channel@0.3.26
	futures-core@0.3.26
	futures-executor@0.3.26
	futures-io@0.3.26
	futures-sink@0.3.26
	futures-task@0.3.26
	futures-util@0.3.26
	fuzzy-matcher@0.3.7
	getrandom@0.2.8
	gh-emoji@1.0.7
	gimli@0.27.3
	git-version@0.3.5
	git-version-macro@0.3.5
	git2@0.17.2
	hashbrown@0.12.3
	hermit-abi@0.3.2
	humantime@2.1.0
	iana-time-zone@0.1.53
	iana-time-zone-haiku@0.1.1
	idna@0.4.0
	indexmap@1.9.3
	inotify@0.9.6
	inotify-sys@0.1.5
	instant@0.1.12
	invalidstring@0.1.2
	io-lifetimes@1.0.5
	is-terminal@0.4.3
	itertools@0.11.0
	itoa@1.0.8
	jobserver@0.1.25
	js-sys@0.3.61
	kqueue@1.0.7
	kqueue-sys@1.0.3
	lazy_static@1.4.0
	libc@0.2.139
	libgit2-sys@0.15.2+1.6.4
	libssh2-sys@0.3.0
	libz-sys@1.1.8
	link-cplusplus@1.0.8
	linux-raw-sys@0.1.4
	lock_api@0.4.10
	log@0.4.20
	memchr@2.5.0
	memoffset@0.7.1
	miniz_oxide@0.6.2
	mio@0.8.5
	notify@5.2.0
	notify-debouncer-mini@0.2.1
	num-traits@0.2.15
	num_cpus@1.16.0
	object@0.30.3
	once_cell@1.18.0
	onig@6.4.0
	onig_sys@69.8.1
	openssl-probe@0.1.5
	openssl-src@300.1.3+3.1.2
	openssl-sys@0.9.93
	option-ext@0.2.0
	parking_lot@0.12.1
	parking_lot_core@0.9.7
	percent-encoding@2.3.0
	phf@0.11.1
	phf_shared@0.11.1
	pin-project-lite@0.2.9
	pin-utils@0.1.0
	pkg-config@0.3.26
	pretty_assertions@1.4.0
	proc-macro-error@1.0.4
	proc-macro-error-attr@1.0.4
	proc-macro-hack@0.5.20+deprecated
	proc-macro2@1.0.63
	quote@1.0.29
	ratatui@0.21.0
	rayon@1.7.0
	rayon-core@1.11.0
	redox_syscall@0.2.16
	redox_users@0.4.3
	regex@1.9.1
	regex-automata@0.3.4
	regex-syntax@0.7.4
	ron@0.8.0
	rustc-demangle@0.1.21
	rustix@0.36.8
	ryu@1.0.14
	same-file@1.0.6
	scopeguard@1.2.0
	scopetime@0.1.2
	scratch@1.0.3
	serde@1.0.156
	serde_derive@1.0.156
	serde_json@1.0.93
	serial_test@1.0.0
	serial_test_derive@1.0.0
	shell-escape@0.1.5
	shellexpand@3.1.0
	signal-hook@0.3.15
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.1
	simplelog@0.12.1
	siphasher@0.3.10
	slab@0.4.8
	smallvec@1.11.0
	strsim@0.10.0
	struct-patch@0.2.3
	struct-patch-derive@0.2.3
	syn@1.0.107
	syntect@5.1.0
	sys-info@0.9.1
	tempfile@3.4.0
	termcolor@1.2.0
	thiserror@1.0.39
	thiserror-impl@1.0.39
	thread_local@1.1.7
	time@0.3.22
	time-core@0.1.1
	time-macros@0.2.9
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	unicode-bidi@0.3.10
	unicode-ident@1.0.6
	unicode-normalization@0.1.22
	unicode-segmentation@1.10.1
	unicode-truncate@0.2.0
	unicode-width@0.1.10
	url@2.4.1
	utf8parse@0.2.1
	vcpkg@0.2.15
	version_check@0.9.4
	walkdir@2.3.3
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.84
	wasm-bindgen-backend@0.2.84
	wasm-bindgen-macro@0.2.84
	wasm-bindgen-macro-support@0.2.84
	wasm-bindgen-shared@0.2.84
	which@4.4.0
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.42.0
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-targets@0.42.1
	windows-targets@0.48.1
	windows_aarch64_gnullvm@0.42.1
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_msvc@0.42.1
	windows_aarch64_msvc@0.48.0
	windows_i686_gnu@0.42.1
	windows_i686_gnu@0.48.0
	windows_i686_msvc@0.42.1
	windows_i686_msvc@0.48.0
	windows_x86_64_gnu@0.42.1
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnullvm@0.42.1
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_msvc@0.42.1
	windows_x86_64_msvc@0.48.0
	yansi@0.5.1
	asyncgit@${AG_PV}
"

inherit cargo

DESCRIPTION="Blazing fast terminal-ui for git"
HOMEPAGE="
	https://crates.io/crates/gitui
	https://github.com/extrawurst/gitui
"
SRC_URI="
	${CARGO_CRATE_URIS}
	https://github.com/extrawurst/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD-2 BSD CDDL ISC MIT Unicode-DFS-2016
	|| ( Artistic-2 CC0-1.0 )
"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"
IUSE="ghemoji trace-libgit"

RDEPEND="
	>=dev-libs/libgit2-1.2.0:=
	trace-libgit? ( dev-libs/libgit2[trace(+)] )

	dev-libs/openssl
"
DEPEND="${RDEPEND}"

RESTRICT="mirror"

src_configure() {
	local myfeatures=(
		$(usev ghemoji)
		$(usev trace-libgit)
		regex-fancy
	)

	cargo_src_configure --no-default-features
}

src_install() {
	local DOCS=({README,KEY_CONFIG,THEMES}.md)

	cargo_src_install

	insinto "/usr/share/${P}/examples"
	doins vim_style_key_config.ron

	einstalldocs
}

pkg_postinst() {
	einfo "Example of vim keybindings config stored in '/usr/share/${P}/examples'"
	einfo 'to use it put example config in `$XDG_CONFIG_HOME/gitui/key_bindings.ron`'
}
