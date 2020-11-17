include config.mk

VERSION  = 0.1

RUNFILE  = destlink
CONFFILE = destlink.conf

all:

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/etc/kanrisha.d/available/destlink
	cp -f $(RUNFILE) $(DESTDIR)$(PREFIX)/etc/kanrisha.d/available/destlink/run
	cp -f $(CONFFILE) $(DESTDIR)$(PREFIX)/etc/kanrisha.d/available/destlink

uninstall:
    rm -f $(DESTDIR)$(PREFIX)/etc/kanrisha.d/available/destlink/run $(DESTDIR)$(PREFIX)/etc/kanrisha.d/available/destlink/$(CONFFILE)

dist: clean
	mkdir -p $(RUNFILE)-$(VERSION)
	cp LICENSE Makefile README $(RUNFILE) $(CONFFILE) $(RUNFILE)-$(VERSION)
	tar -cf $(RUNFILE)-$(VERSION).tar $(RUNFILE)-$(VERSION)
	gzip $(RUNFILE)-$(VERSION).tar
	rm -rf $(RUNFILE)-$(VERSION)

clean:
    rm -f $(RUNFILE)-$(VERSION).tar.gz

.PHONY:
    all install uninstall dist clean