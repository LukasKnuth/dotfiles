# asdf based Erlang build options (kerl)
# Most of these are for compatibility with M1 Macs.
set -gx KERL_BUILD_DOCS yes
set -gx KERL_DOC_TARGETS chunks
set -gx KERL_INSTALL_HTMLDOCS no
set -gx KERL_INSTALL_MANPAGES no
set -gx KERL_CONFIGURE_OPTIONS "--without-javac --without-jinterface --without-odbc --enable-ex"
