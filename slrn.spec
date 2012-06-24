Summary:	The world's best newsreader (in Red Hat's opinion anyway)
Summary(de):	Der weltbeste Newsreader (Red Hats Meinung)
Summary(fr):	Le meilleur lecteur de news du monde (Selon Red Hat tout du moins)
Summary(pl):	�atwy w obs�udze czytnik artyku��w news
Summary(tr):	Red Hat'in g�r���ne g�re d�nyan�n en iyi haber grubu okuyucusu
Name:		slrn
Version:	0.9.6.2
Release:	3
Copyright:	GPL
Group:		Applications/News
Group(pl):	Aplikacje/News
URL:		http://www.slrn.org
Source:		ftp://space.mit.edu/pub/davis/slrn/%{name}-%{version}.tar.bz2
Patch0:		slrn-keymap.patch
BuildRequires:	slang-devel
BuildRoot:	/tmp/%{name}-%{version}-root

%define		_libdir		%{_datadir}

%description
Slrn is an easy to use but powerful full-screen NNTP based newsreader.
It relies extensively on the S-Lang programmer's library for many of
its features.  Slrn works particularly well over slow network
connections.

%description -l de
Slm ist ein einfach zu bedienender und dennoch �u�erst leistungsf�higer 
Voll-Bildschirm-Newsreader auf NNTP-Basis. Viele seiner Funktionen 
bezieht er aus der S-Lang-Programmierer-Library. Seine besondere St�rke 
ist die Arbeit �ber langsame Netzwerke. 

%description -l fr
slrn et un lecteur de news NNTP plein �cran facile � utiliser mais puissant.
Il s'appuie beaucoup sur la biblioth�que S-Lang pour ses caract�ristiques.
slrn fonctionne particuli�rement bien avec des connexions r�seau lentes.

%description -l pl
Slrn jest wygodnym w obs�udze i ergonomicznym czytnikiem artyku��w news.
�adny wygl�d zapewnia mu wykorzystanie biblioteki S-Lang. Slrn znakomicie 
sprawdza si� zw�aszcza na zapchanych i wolnych ��czach.

%description -l tr
Slrn, kullan�m� kolay, �ok yetenekli, tam ekran bir haber okuyucudur.
Yava� a� ba�lant�lar�nda gayet iyi �al���r.

%package pull
Summary:	Offline news reading support for slrn
Summary(pl):	Program �ci�gaj�cy artyku�y z serwera news
Group:		Applications/News
Group(pl):	Aplikacje/News
Requires:	%{name} = %{version}

%description pull
This package provides slrnpull, which allows set up of a small news
spool for offline news reading.

%description -l pl pull
Slrnpull umo�liwia �ci�gni�cie artyku��w, a nast�pnie czytanie ich
bez konieczno�ci utrzymywania sta�ego po��czenia z serwerem news.

%prep
%setup  -q
%patch0 -p1

%build
slrn_cv_domain=no
LDFLAGS="-s"
export slrn_cv_domain LDFLAGS

%configure

make
make slrnpull

%install
rm -rf $RPM_BUILD_ROOT

make install DESTDIR=$RPM_BUILD_ROOT

install -d $RPM_BUILD_ROOT/var/spool/slrnpull/out.going
install slrnpull/slrnpull.conf $RPM_BUILD_ROOT/var/spool/slrnpull
install doc/slrn.rc $RPM_BUILD_ROOT%{_libdir}/slrn

gzip -9nf $RPM_BUILD_ROOT%{_mandir}/man1/* \
	doc/{README.GroupLens,README.macros,FAQ,SCORE_FAQ,{help,score,slrnfuns}.txt} \
	slrnpull/{FAQ,QUICK_INSTALL,README}

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc doc/{*.gz,score.sl}
%attr(755,root,root) %{_bindir}/slrn
%dir %{_libdir}/slrn
%verify (not md5 size mtime) %{_libdir}/slrn/slrn.rc
%{_libdir}/slrn/color.sl
%{_libdir}/slrn/ispell.sl
%{_libdir}/slrn/nn.sl
%{_libdir}/slrn/posthook.sl
%{_libdir}/slrn/search.sl
%{_libdir}/slrn/tin-art.sl
%{_libdir}/slrn/tin-group.sl
%{_libdir}/slrn/ttyprint.sl
%{_libdir}/slrn/util.sl
%{_libdir}/slrn/xcomment.sl
%{_mandir}/man1/*

%files pull
%defattr(644,root,root,755)
%doc slrnpull/{*.gz,score,slrn.rc,slrnpull.sh}
%attr (755,root,root) %{_bindir}/slrnpull
%attr (775,news,news) %dir /var/spool/slrnpull
%attr (775,news,news) %dir /var/spool/slrnpull/out.going
%attr (775,news,news) %config(noreplace) %verify(not size md5 mtime) /var/spool/slrnpull/slrnpull.conf
