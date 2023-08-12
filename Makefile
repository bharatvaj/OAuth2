include config.mk

LIBPRE:=lib
LIBEXT:=a
ARFLAGS:=cr


LIBNAME=$(LIBPRE)oauth2.$(LIBEXT)

%.o: %.c %.h
	$(CC) $(CFLAGS) -c $< -o $@

all: $(LIBNAME) test

$(LIBNAME): oauth2.o curl_request.o
	$(AR) $(ARFLAGS) $@ $^

LDFLAGS+=-L. -loauth2
test: test.o $(LIBNAME)
	$(CC) $< $(CFLAGS) $(LDFLAGS) -o $@

clean:
	rm -vf *.a *.lib *.o test

install: $(LIBNAME)
	$(INSTALL) $< $(DESTDIR)/$(PREFIX)/lib
	$(INSTALL) oauth2.h $(DESTDIR)/$(PREFIX)/include

uninstall:
	$(RM) $(DESTDIR)/$(PREFIX)/lib/$(LIBNAME)
	$(RM) $(DESTDIR)/$(PREFIX)/include/oauth2.h

.PHONY: all test clean install uninstall
