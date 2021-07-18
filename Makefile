VERSION  = 1.1

MANPREFIX = /usr/share/man

RUNFILE  = destlink
CONFFILE = destlink.conf

all:

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/etc/kanrisha.d/available/destlink
	cp -f $(RUNFILE) $(DESTDIR)$(PREFIX)/etc/kanrisha.d/available/destlink/run
	cp -f $(CONFFILE) $(DESTDIR)$(PREFIX)/etc/kanrisha.d/available/destlink
	chmod +x $(DESTDIR)$(PREFIX)/etc/kanrisha.d/available/destlink/run
	sed "s/1.0/$(VERSION)/g" < $(NAME).8 > $(DESTDIR)$(MANPREFIX)/man8/$(NAME).8
	sed "s/1.0/$(VERSION)/g" < $(NAME).conf.5 > $(DESTDIR)$(MANPREFIX)/man5/$(NAME).conf.5

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/etc/kanrisha.d/available/destlink/run $(DESTDIR)$(PREFIX)/etc/kanrisha.d/available/destlink/$(CONFFILE)
	rm -f $(DESTDIR)$(MANPREFIX)/man8/$(NAME).8
	rm -f $(DESTDIR)$(MANPREFIX)/man5/$(NAME).conf.5

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
