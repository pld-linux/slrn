Summary:     The world's best newsreader (in Red Hat's opinion anyway)
Summary(de): Der weltbeste Newsreader (Red Hats Meinung)
Summary(fr): Le meilleur lecteur de news du monde (Selon Red Hat tout du moins)
Summary(pl): £atwy w obs³udze czytnik artyku³ów news
Summary(tr): Red Hat'in görüþüne göre dünyanýn en iyi haber grubu okuyucusu
Name:        slrn
Version:     0.9.5.4
Release:     1
Copyright:   GPL
Group:       Applications/News
Source0:     ftp://space.mit.edu/pub/davis/slrn/%{name}%{version}.tar.gz
Source1:     slrn.wmconfig
Patch:       %{name}-config.patch
Buildroot:   /tmp/%{name}-%{version}-root

%description
Slrn is an easy to use but powerful full-screen NNTP based newsreader.
It relies extensively on the S-Lang programmer's library for many of
its features.  Slrn works particularly well over slow network
connections.

%description -l de
Slm ist ein einfach zu bedienender und dennoch äußerst leistungsfähiger 
Voll-Bildschirm-Newsreader auf NNTP-Basis. Viele seiner Funktionen 
bezieht er aus der S-Lang-Programmierer-Library. Seine besondere Stärke 
ist die Arbeit über langsame Netzwerke. 

%description -l fr
slrn et un lecteur de news NNTP plein écran facile à utiliser mais puissant.
Il s'appuie beaucoup sur la bibliothèque S-Lang pour ses caractéristiques.
slrn fonctionne particulièrement bien avec des connexions réseau lentes.

%description -l pl
Slrn jest wygodnym w obs³udze i ergonomicznym czytnikiem artyku³ów news.
£adny wygl±d zapewnia mu wykorzystanie biblioteki S-Lang. Slrn znakomicie 
sprawdza siê zw³aszcza na zapchanych i wolnych ³±czach.

%description -l tr
Slrn, kullanýmý kolay, çok yetenekli, tam ekran bir haber okuyucudur.
Yavaþ að baðlantýlarýnda gayet iyi çalýþýr.

%package pull
Summary:     Offline news reading support for slrn
Summary(pl): Program ¶ci±gaj±cy artyku³y z serwera news.
Group:       Applications/News
Requires:    %{name} = %{version}

%description pull
This package provides slrnpull, which allows set up of a small news
spool for offline news reading.

%description -l pl pull
Slrnpull umo¿liwia ¶ci±gniêcie artyku³ów news a nastêpnie korzystanie z
nich bez konieczno¶ci utrzymywania sta³ego po³±czenia z serwerem news.

%prep
%setup -q -n slrn
%patch -p1

%build
CFLAGS=$RPM_OPT_FLAGS slrn_cv_domain=no ./configure --prefix=/usr
make
make slrnpull

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT/{etc/X11/wmconfig,usr/{bin,lib/slrn,man/man1}}
install -d $RPM_BUILD_ROOT/var/spool/slrnpull/out.going

install doc/slrn.rc $RPM_BUILD_ROOT/usr/lib/slrn
install doc/slrn.1 $RPM_BUILD_ROOT/usr/man/man1/slrn.1
install src/objs/slrn $RPM_BUILD_ROOT/usr/bin/slrn
install src/objs/slrnpull $RPM_BUILD_ROOT/usr/bin/slrnpull
install $RPM_SOURCE_DIR/slrn.wmconfig $RPM_BUILD_ROOT/etc/X11/wmconfig/slrn

install slrnpull/slrnpull.conf $RPM_BUILD_ROOT/var/spool/slrnpull

strip $RPM_BUILD_ROOT/usr/bin/* || :

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644, root, root, 755)
%config (missingok) /etc/X11/wmconfig/slrn
%doc doc/{README.GroupLens,README.macros,FAQ,SCORE_FAQ,*.txt,score.sl}
%attr(755, root, root) /usr/bin/slrn
%dir /usr/lib/slrn
%verify (not md5 size mtime) /usr/lib/slrn/slrn.rc
%attr(644, root,  man) /usr/man/man1/slrn.1

%files pull
%defattr(644, root, root, 755)
%doc slrnpull/{FAQ,QUICK_INSTALL,README,score,slrn.rc,slrnpull.sh}
%attr (755, root, root) /usr/bin/slrnpull
%attr (775, news, news) %dir /var/spool/slrnpull
%attr (775, news, news) %dir /var/spool/slrnpull/out.going
%attr (775, news, news) %config(noreplace) %verify(not size md5 mtime) /var/spool/slrnpull/slrnpull.conf

%changelog
* Thu Sep 10 1998 Tomasz K³oczko <kloczek@rudy.mif.pg.gda.pl>
  [0.9.5.3-1]
- removed doc/INSTALL from %doc.

* Thu Sep 3 1998 Marcin Korzonek <mkorz@shadow.eu.org>
  [0.9.5.2-1]
- added pl translation,
- allow building from non root account,
- added slrnpull package.

* Mon Apr 27 1998 Prospector System <bugs@redhat.com>
- translations modified for de, fr, tr

* Wed Oct 22 1997 Donnie Barnes <djb@redhat.com>
- added wmconfig entry

* Tue Oct 21 1997 Donnie Barnes <djb@redhat.com>
- updated from 0.9.3.2 to 0.9.4.3

* Fri Jul 18 1997 Erik Troan <ewt@redhat.com>
- built against glibc
