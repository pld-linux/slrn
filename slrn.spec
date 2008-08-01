#
# Conditional build:
%bcond_without	canlock		# - build without Cancel-Lock support
%bcond_without	ssl		# - build without SSL support (snews://)
%bcond_without	uudeview	# - build without uudeview support
#
Summary:	The world's best newsreader
Summary(da.UTF-8):	Verdens bedste nyhedslæser
Summary(de.UTF-8):	Der weltbeste Newsreader
Summary(es.UTF-8):	El mejor lector de news del mundo
Summary(fr.UTF-8):	Le meilleur lecteur de news du monde
Summary(pl.UTF-8):	Łatwy w obsłudze czytnik artykułów news
Summary(pt_BR.UTF-8):	O melhor leitor de notícias do mundo
Summary(tr.UTF-8):	Görüşüne göre dünyanın en iyi haber grubu okuyucusu
Name:		slrn
Version:	0.9.9
Release:	0.pre122.2
License:	GPL v2+
Group:		Applications/News
Source0:	http://slrn.org/downloads/%{name}-pre%{version}-122.tar.bz2
# Source0-md5:	81ea5b78523acae5734f8d6d19a06f23
Source1:	%{name}.1.pl
Source2:	%{name}.desktop
Source3:	%{name}.png
Source4:	%{name}-pull.logrotate
Patch0:		%{name}-keymap.patch
Patch1:		%{name}-user-agent.patch
Patch2:		%{name}-sort_visible_headers.patch
Patch3:		%{name}-home_etc.patch
Patch4:		%{name}-pl.po-update.patch
Patch5:		%{name}-lib64.patch
URL:		http://www.slrn.org/
BuildRequires:	autoconf >= 2.50
%{?with_canlock:BuildRequires:	canlock-devel >= 2a}
BuildRequires:	gettext-devel
%{?with_ssl:BuildRequires:	openssl-devel >= 0.9.7d}
BuildRequires:	slang-devel >= 2.0.0
%{?with_uudeview:BuildRequires:	uudeview-devel}
Obsoletes:	slrn-pl
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
Slrn is an easy to use but powerful full-screen NNTP based newsreader.
It relies extensively on the S-Lang programmer's library for many of
its features. Slrn works particularly well over slow network
connections.

%description -l da.UTF-8
Slrn er en bekvæm og kraftig nyhedslæser. Programmet skylder S-Lang
biblioteket sin funktionalitet. Slrn er godt især ved brug igennem
langsomme netværk forbindelser.

%description -l de.UTF-8
Slrn ist ein einfach zu bedienender und dennoch äußerst
leistungsfähiger Voll-Bildschirm-Newsreader auf NNTP-Basis. Viele
seiner Funktionen bezieht er aus der S-Lang-Programmierer-Library.
Seine besondere Stärke ist die Arbeit über langsame Netzwerke.

%description -l es.UTF-8
Slrn es un lector de news basado en NNTP fácil de usar, pero potente
con pantalla llena. Utiliza la biblioteca de programadores S-Lang para
varias de sus características. Slrn trabaja en especial con conexiones
lentas de red.

%description -l fr.UTF-8
Slrn et un lecteur de news NNTP plein écran facile à utiliser mais
puissant. Il s'appuie beaucoup sur la bibliothèque S-Lang pour ses
caractéristiques. Slrn fonctionne particulièrement bien avec des
connexions réseau lentes.

%description -l pl.UTF-8
Slrn jest wygodnym w obsłudze i ergonomicznym czytnikiem artykułów
news. Swą funkcjonalność program zawdzięcza bibliotece S-Lang. Slrn
znakomicie sprawdza się zwłaszcza na zapchanych i wolnych łączach.

%description -l pt_BR.UTF-8
Slrn é um leitor de notícias baseado em NNTP fácil de usar mas
poderoso com tela cheia. Ele utiliza a biblioteca de programadores
S-Lang para várias das suas características. Slrn trabalha
particularmente bem com conexões lentas de rede.

%description -l tr.UTF-8
Slrn, kullanımı kolay, çok yetenekli, tam ekran bir haber okuyucudur.
Yavaş ağ bağlantılarında gayet iyi çalışır.

%package pull
Summary:	Offline news reading support for slrn
Summary(da.UTF-8):	Programmet udstyrer slrn med offline-egenskaber
Summary(es.UTF-8):	Soporte para lectura de noticias "offline" para slm
Summary(pl.UTF-8):	Program ściągający artykuły z serwera news
Summary(pt_BR.UTF-8):	Suporte para leitura de notícias "offline" para o slrn
Group:		Applications/News
Requires:	%{name}
Obsoletes:	slrn-pl-pull

%description pull
This package provides slrnpull, which allows set up of a small news
spool for offline news reading.

%description pull -l da.UTF-8
Programmet henter indlæg ned til et lokalt newsspool for at brugeren
kan læse og svare på dem uden at være online.

%description pull -l es.UTF-8
Soporte para lectura de noticias "offline" para slm

%description pull -l pl.UTF-8
Slrnpull umożliwia ściągnięcie artykułów, a następnie czytanie ich bez
konieczności utrzymywania stałego połączenia z serwerem news.

%description pull -l pt_BR.UTF-8
Este pacote provê o slrnpull, que permite a configuração de um pequeno
spool de notícias, para leitura "offline".

%prep
%setup -q -n %{name}
%patch0 -p1
%patch1 -p1
%patch2 -p1
%patch3 -p1
%patch4 -p1
%ifarch %{x8664}
%patch5 -p1
%endif

ln -s autoconf/configure.ac .

%build
%{__autoconf} -B autoconf
%configure \
	INEWS="/usr/bin/inews" \
	SENDMAIL="/usr/lib/sendmail" \
	--enable-inews \
	--enable-mid-cache \
	--enable-setgid-code \
	--enable-spool \
	%{?with_canlock:--with-canlock} \
	--with-slrnpull=/var/spool/slrnpull \
	%{?with_ssl:--with-ssl} \
	%{?with_uudeview:--with-uu}

%{__make}

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT%{_var}/spool/slrnpull/{data,logs,news,out.going/rejects} \
	$RPM_BUILD_ROOT{%{_sysconfdir},%{_mandir}/pl/man1} \
	$RPM_BUILD_ROOT{%{_desktopdir},%{_pixmapsdir}} \
	$RPM_BUILD_ROOT/etc/logrotate.d

%{__make} install \
	DESTDIR=$RPM_BUILD_ROOT

install %{SOURCE1} $RPM_BUILD_ROOT%{_mandir}/pl/man1/slrn.1
install %{SOURCE2} $RPM_BUILD_ROOT%{_desktopdir}
install %{SOURCE3} $RPM_BUILD_ROOT%{_pixmapsdir}
install %{SOURCE4} $RPM_BUILD_ROOT/etc/logrotate.d/slrn-pull
> $RPM_BUILD_ROOT%{_var}/spool/slrnpull/data/active
> $RPM_BUILD_ROOT%{_var}/spool/slrnpull/log
> $RPM_BUILD_ROOT%{_var}/spool/slrnpull/score
install contrib/{cleanscore,slrnrc-conv} $RPM_BUILD_ROOT%{_bindir}

install doc/slrnpull/slrnpull.conf $RPM_BUILD_ROOT%{_var}/spool/slrnpull
install doc/slrn.rc $RPM_BUILD_ROOT%{_sysconfdir}

%find_lang %{name}

%clean
rm -rf $RPM_BUILD_ROOT

%files -f %{name}.lang
%defattr(644,root,root,755)
%doc COPYRIGHT README changes.txt contrib/{README,NEWS}.* doc/*.html
%doc doc/{FAQ,FIRST_STEPS,README.*,THANKS,{help,manual,score,slrnfuns}.txt,*.sl}
%attr(755,root,root) %{_bindir}/cleanscore
%attr(755,root,root) %{_bindir}/slrn
%attr(755,root,root) %{_bindir}/slrnrc-conv
%dir %{_datadir}/slrn
%{_datadir}/slrn/slang
%{_mandir}/man1/slrn.1*
%lang(pl) %{_mandir}/pl/man1/slrn.1*
%{_desktopdir}/slrn.desktop
%{_pixmapsdir}/slrn.png
%config(noreplace,missingok) %verify(not md5 mtime size) %{_sysconfdir}/slrn.rc

%files pull
%defattr(644,root,root,755)
%doc doc/slrnpull/{README*,SETUP,score,slrn.rc,slrnpull.sh}
%attr(640,root,root) %config(noreplace) %verify(not md5 mtime size) /etc/logrotate.d/slrn-pull
%attr(2754,root,news) %{_bindir}/slrnpull
%{_mandir}/man1/slrnpull.1*
%defattr(664,news,news,755)
%dir %{_var}/spool/slrnpull
%dir %{_var}/spool/slrnpull/logs
%attr(2775,news,news) %dir %{_var}/spool/slrnpull/data
%verify(not md5 mtime size user) %{_var}/spool/slrnpull/data/active
%attr(2775,news,news) %dir %{_var}/spool/slrnpull/news
%attr(3775,news,news) %dir %{_var}/spool/slrnpull/out.going
%attr(3775,news,news) %dir %{_var}/spool/slrnpull/out.going/rejects
%attr(660,news,news) %ghost %{_var}/spool/slrnpull/log
%config(noreplace) %verify(not md5 mtime size) %{_var}/spool/slrnpull/score
%config(noreplace) %verify(not md5 mtime size) %{_var}/spool/slrnpull/slrnpull.conf
