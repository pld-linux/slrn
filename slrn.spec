Summary:	The world's best newsreader (in Red Hat's opinion anyway)
Summary(de):	Der weltbeste Newsreader (Red Hats Meinung)
Summary(fr):	Le meilleur lecteur de news du monde (Selon Red Hat tout du moins)
Summary(pl):	£atwy w obs³udze czytnik artyku³ów news
Summary(tr):	Red Hat'in görüþüne göre dünyanýn en iyi haber grubu okuyucusu
Name:		slrn
Version:	0.9.7.2
Release:	2
License:	GPL
Group:		Applications/News
Group(de):	Applikationen/News
Group(pl):	Aplikacje/News
Source0:	ftp://slrn.sourceforge.net/pub/slrn/%{name}-%{version}.tar.bz2
Source1:	%{name}.1.pl
Source2:	%{name}.desktop
Source3:	%{name}.png
Patch0:		%{name}-ipv6.patch
Patch1:		%{name}-keymap.patch
Patch2:		%{name}-config.patch
Patch3:		%{name}-user-agent.patch
Patch4:		%{name}-etc.patch
Patch5:		%{name}-empty.patch
#Patch5:	%{name}-home_etc.patch
Icon:		slrn.xpm
URL:		http://www.slrn.org/
BuildRequires:	slang-devel
BuildRequires:	autoconf
BuildRequires:	automake
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%define		_libdir		%{_datadir}

%description
Slrn is an easy to use but powerful full-screen NNTP based newsreader.
It relies extensively on the S-Lang programmer's library for many of
its features. Slrn works particularly well over slow network
connections.

%description -l de
Slm ist ein einfach zu bedienender und dennoch äußerst
leistungsfähiger Voll-Bildschirm-Newsreader auf NNTP-Basis. Viele
seiner Funktionen bezieht er aus der S-Lang-Programmierer-Library.
Seine besondere Stärke ist die Arbeit über langsame Netzwerke.

%description -l fr
slrn et un lecteur de news NNTP plein écran facile à utiliser mais
puissant. Il s'appuie beaucoup sur la bibliothèque S-Lang pour ses
caractéristiques. slrn fonctionne particulièrement bien avec des
connexions réseau lentes.

%description -l pl
Slrn jest wygodnym w obs³udze i ergonomicznym czytnikiem artyku³ów
news. £adny wygl±d zapewnia mu wykorzystanie biblioteki S-Lang. Slrn
znakomicie sprawdza siê zw³aszcza na zapchanych i wolnych ³±czach.

%description -l tr
Slrn, kullanýmý kolay, çok yetenekli, tam ekran bir haber okuyucudur.
Yavaþ að baðlantýlarýnda gayet iyi çalýþýr.

%package pull
Summary:	Offline news reading support for slrn
Summary(pl):	Program ¶ci±gaj±cy artyku³y z serwera news
Group:		Applications/News
Group(de):	Applikationen/News
Group(pl):	Aplikacje/News
Requires:	%{name} = %{version}

%description pull
This package provides slrnpull, which allows set up of a small news
spool for offline news reading.

%description pull -l pl
Slrnpull umo¿liwia ¶ci±gniêcie artyku³ów, a nastêpnie czytanie ich bez
konieczno¶ci utrzymywania sta³ego po³±czenia z serwerem news.

%prep
%setup -q
%patch0 -p1
%patch1 -p1
%patch2 -p1
%patch3 -p1
%patch4 -p1
%patch5 -p1

%build
(
	cd autoconf
	aclocal -I .
	autoconf
)
cp -f autoconf/configure .

INEWS="/usr/bin/inews"; SENDMAIL="/usr/lib/sendmail"
export INEWS SENDMAIL

%configure \
	--enable-ipv6 \
	--enable-inews \
	--enable-spool \
	--with-slrnpull

%{__make}

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT%{_var}/spool/slrnpull/out.going \
	$RPM_BUILD_ROOT{%{_sysconfdir},%{_mandir}/pl/man1} \
	$RPM_BUILD_ROOT{%{_applnkdir}/Network/News,%{_pixmapsdir}}

%{__make} install DESTDIR=$RPM_BUILD_ROOT

install %{SOURCE1} $RPM_BUILD_ROOT%{_mandir}/pl/man1/slrn.1
install %{SOURCE2} $RPM_BUILD_ROOT%{_applnkdir}/Network/News
install %{SOURCE3} $RPM_BUILD_ROOT%{_pixmapsdir}

install doc/slrnpull/slrnpull.conf $RPM_BUILD_ROOT%{_var}/spool/slrnpull
install doc/slrn.rc $RPM_BUILD_ROOT%{_sysconfdir}

gzip -9nf doc/{FAQ,FIRST_STEPS,README.*,SCORE_FAQ,THANKS,{help,manual,score,slrnfuns}.txt} \
	doc/slrnpull/{FAQ,README,SETUP} README COPYRIGHT changes.txt

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc *.gz doc/{*.gz,score.sl}
%attr(755,root,root) %{_bindir}/slrn
%dir %{_libdir}/slrn
%{_libdir}/slrn/*.sl
%{_mandir}/man1/*
%lang(pl) %{_mandir}/pl/man1/*
%{_applnkdir}/Network/News/*
%{_pixmapsdir}/*
%config(noreplace,missingok) %verify(not md5 size mtime) %{_sysconfdir}/slrn.rc

%files pull
%defattr(644,root,root,755)
%doc doc/slrnpull/{*.gz,score,slrn.rc,slrnpull.sh}
%attr(2754,root,news) %{_bindir}/slrnpull
%defattr(664,news,news,755)
%dir %{_var}/spool/slrnpull
%attr(3775,news,news) %dir %{_var}/spool/slrnpull/out.going
%config(noreplace) %verify(not md5 size mtime) %{_var}/spool/slrnpull/slrnpull.conf
