MANDIR=/usr/share/man
SBINDIR=/usr/sbin
LIBEXECDIR=/usr/libexec/ca-tools

all: bin

bin:
	chmod 755 update-ccadb update-certdata add-local-trust

clean: clean_bin

clean_bin:
	chmod 0644 update-ccadb update-certdata add-local-trust

install: all install_bin install_man install_libexec

install_bin:
	install -vdm755 $(DESTDIR)$(SBINDIR)
	install -vm755  update-ccadb $(DESTDIR)$(SBINDIR)
	install -vm755  update-certdata $(DESTDIR)$(SBINDIR)
	install -vm755  add-local-trust $(DESTDIR)$(SBINDIR)

install_man:
	install -vdm755 $(DESTDIR)$(MANDIR)/man8
	install -vm644 update-ccadb.8 $(DESTDIR)$(MANDIR)/man8
	install -vm644 update-certdata.8 $(DESTDIR)$(MANDIR)/man8
	install -vm644 add-local-trust.8 $(DESTDIR)$(MANDIR)/man8

install_libexec:
	install -vdm755 $(DESTDIR)$(LIBEXECDIR)
	install -vm644 mozilla-ca-root.pem $(DESTDIR)$(LIBEXECDIR)
	install -vm755 copy-trust-modifications $(DESTDIR)$(LIBEXECDIR)

uninstall:
	rm -f $(DESTDIR)$(SBINDIR)/update-ccadb
	rm -f $(DESTDIR)$(SBINDIR)/update-certdata
	rm -f $(DESTDIR)$(SBINDIR)/add-local-trust
	rm -f $(DESTDIR)$(MANDIR)/man8/update-ccadb.8
	rm -f $(DESTDIR)$(MANDIR)/man8/update-certdata.8
	rm -f $(DESTDIR)$(MANDIR)/man8/add-local-trust.8
	rm -f $(DESTDIR)$(LIBEXECDIR)/mozilla-ca-root.pem
	rm -f $(DESTDIR)$(LIBEXECDIR)/copy-trust-modifications

.PHONY: all bin clean clean_bin install install_bin install_man install_libexec uninstall

