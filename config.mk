#mk version of liboauth2
VERSION="0.3.1"

# Paths
PREFIX?=/usr/local
DESTDIR=
INSTALL=cp

CFLAGS=-std=c99 -pedantic  -Wall -Wextra -Os -I.

CFLAGS+= -DVERSION=$(VERSION)
LDFLAGS+= -lcurl

# Windows
# LIBPRE=
# LIBEXT=lib
# ARFLAGS=
