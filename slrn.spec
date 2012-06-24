#
# _with_ssl		build slrn with SSL support (snews://)
#
Summary:	The world's best newsreader
Summary(da):	Verdens bedste nyhedsl�ser
Summary(de):	Der weltbeste Newsreader
Summary(es):	El mejor lector de news del mundo
Summary(fr):	Le meilleur lecteur de news du monde
Summary(pl):	�atwy w obs�udze czytnik artyku��w news
Summary(pt_BR):	O melhor leitor de not�cias do mundo
Summary(tr):	Red Hat'in g�r���ne g�re d�nyan�n en iyi haber grubu okuyucusu
Name:		slrn
Version:	0.9.7.4
Release:	3
License:	GPL
Group:		Applications/News
Source0:	http://dl.sourceforge.net/slrn/%{name}-%{version}.tar.bz2
# Source0-md5:	da944c58f301cf07a41f996d91de8431
Source1:	%{name}.1.pl
Source2:	%{name}.desktop
Source3:	%{name}.png
Source4:	%{name}-pull.logrotate
Patch0:		%{name}-ipv6.patch
Patch1:		%{name}-keymap.patch
Patch2:		%{name}-config.patch
Patch3:		%{name}-user-agent.patch
Patch4:		%{name}-amfix.patch
Patch5:		%{name}-sort_visible_headers.patch
Patch6:		%{name}-locate_by_msgid.patch
Patch7:		%{name}-ac253.patch
Patch8:		http://slrn.sourceforge.net/patches/slrn-0.9.7.4-popup_win.diff
Patch9:		http://slrn.sourceforge.net/patches/slrn-0.9.7.4-mem_leak.diff
Patch10:	http://slrn.sourceforge.net/patches/slrn-0.9.7.4-po.diff
Patch11:	http://slrn.sourceforge.net/patches/slrn-0.9.7.4-link_subjects.diff
Icon:		slrn.xpm
URL:		http://www.slrn.org/
BuildRequires:	autoconf
BuildRequires:	automake
BuildRequires:	gettext-devel
BuildRequires:	slang-devel
%{?_with_ssl:BuildRequires:	openssl-devel >= 0.9.7}
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
Slrn is an easy to use but powerful full-screen NNTP based newsreader.
It relies extensively on the S-Lang programmer's library for many of
its features. Slrn works particularly well over slow network
connections.

%description -l da
Slrn er en bekv�m og kraftig nyhedsl�ser. Programmet skylder S-Lang
biblioteket sin funktionalitet. Slrn er godt is�r ved brug igennem
langsomme netv�rk forbindelser.

%description -l de
Slrn ist ein einfach zu bedienender und dennoch �u�erst
leistungsf�higer Voll-Bildschirm-Newsreader auf NNTP-Basis. Viele
seiner Funktionen bezieht er aus der S-Lang-Programmierer-Library.
Seine besondere St�rke ist die Arbeit �ber langsame Netzwerke.

%description -l es
Slrn es un lector de news basado en NNTP f�cil de usar, pero potente
con pantalla llena. Utiliza la biblioteca de programadores S-Lang para
varias de sus caracter�sticas. Slrn trabaja en especial con conexiones
lentas de red.

%description -l fr
Slrn et un lecteur de news NNTP plein �cran facile � utiliser mais
puissant. Il s'appuie beaucoup sur la biblioth�que S-Lang pour ses
caract�ristiques. Slrn fonctionne particuli�rement bien avec des
connexions r�seau lentes.

%description -l pl
Slrn jest wygodnym w obs�udze i ergonomicznym czytnikiem artyku��w
news. Sw� funkcjonalno�� program zawdzi�cza bibliotece S-Lang. Slrn
znakomicie sprawdza si� zw�aszcza na zapchanych i wolnych ��czach.

%description -l pt_BR
Slrn � um leitor de not�cias baseado em NNTP f�cil de usar mas
poderoso com tela cheia. Ele utiliza a biblioteca de programadores
S-Lang para v�rias das suas caracter�sticas. Slrn trabalha
particularmente bem com conex�es lentas de rede.

%description -l tr
Slrn, kullan�m� kolay, �ok yetenekli, tam ekran bir haber okuyucudur.
Yava� a� ba�lant�lar�nda gayet iyi �al���r.

%package pull
Summary:	Offline news reading support for slrn
Summary(da):	Programmet udstyrer slrn med offline-egenskaber
Summary(es):	Soporte para lectura de noticias "offline" para slm
Summary(pl):	Program �ci�gaj�cy artyku�y z serwera news
Summary(pt_BR):	Suporte para leitura de not�cias "offline" para o slrn
Group:		Applications/News
Requires:	%{name}
Obsoletes:	slrn-pl-pull

%description pull
This package provides slrnpull, which allows set up of a small news
spool for offline news reading.

%description pull -l da
Programmet henter indl�g ned til et lokalt newsspool for at brugeren
kan l�se og svare p� dem uden at v�re online.

%description pull -l es
Soporte para lectura de noticias "offline" para slm

%description pull -l pl
Slrnpull umo�liwia �ci�gni�cie artyku��w, a nast�pnie czytanie ich bez
konieczno�ci utrzymywania sta�ego po��czenia z serwerem news.

%description pull -l pt_BR
Este pacote prov� o slrnpull, que permite a configura��o de um pequeno
spool de not�cias, para leitura "offline".

%prep
%setup -q
%patch0 -p1
%patch1 -p1
%patch2 -p1
%patch3 -p1
%patch4 -p1
%patch5 -p1
%patch6 -p1
%patch7 -p1
%patch8 -p1
%patch9 -p1
%patch10 -p1
%patch11 -p1

%build
rm -f autoconf/missing
%{__aclocal} -I autoconf
# ac2.53 || ac2.52
%{__autoheader} -I src/ || autoheader
%{__autoconf}
%{__automake}
INEWS="%{_bindir}/inews"; SENDMAIL="/usr/lib/sendmail"
export INEWS SENDMAIL

%configure \
	--enable-mid-cache \
	--enable-ipv6 \
	--enable-inews \
	--enable-spool \
	--with-slrnpull \
	--enable-setgid-code \
	%{?_with_ssl:--with-ssl}

%{__make}

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT%{_var}/spool/slrnpull/{data,logs,news,out.going/rejects} \
	$RPM_BUILD_ROOT{%{_sysconfdir},%{_mandir}/pl/man1} \
	$RPM_BUILD_ROOT{%{_applnkdir}/Network/News,%{_pixmapsdir}} \
	$RPM_BUILD_ROOT/etc/logrotate.d

%{__make} install DESTDIR=$RPM_BUILD_ROOT

install %{SOURCE1} $RPM_BUILD_ROOT%{_mandir}/pl/man1/slrn.1
install %{SOURCE2} $RPM_BUILD_ROOT%{_applnkdir}/Network/News
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
%doc README COPYRIGHT changes.txt contrib/{README,NEWS}.* doc/*.html
%doc doc/{FAQ,FIRST_STEPS,README.*,SCORE_FAQ,THANKS,{help,manual,score,slrnfuns}.txt,*.sl}
%attr(755,root,root) %{_bindir}/slrn
%attr(755,root,root) %{_bindir}/slrnrc-conv
%attr(755,root,root) %{_bindir}/cleanscore
%dir %{_datadir}/slrn
%{_datadir}/slrn/macros
%{_mandir}/man1/slrn.1*
%lang(pl) %{_mandir}/pl/man1/*
%{_applnkdir}/Network/News/*
%{_pixmapsdir}/*
%config(noreplace,missingok) %verify(not md5 size mtime) %{_sysconfdir}/slrn.rc

%files pull
%defattr(644,root,root,755)
%doc doc/slrnpull/{FAQ,README,SETUP,score,slrn.rc,slrnpull.sh}
%attr(640,root,news) /etc/logrotate.d/slrn-pull
%attr(2754,root,news) %{_bindir}/slrnpull
%{_mandir}/man1/slrnpull.1*
%defattr(664,news,news,755)
%dir %{_var}/spool/slrnpull
%dir %{_var}/spool/slrnpull/logs
%attr(2775,news,news) %dir %{_var}/spool/slrnpull/data
%verify(not md5 size user mtime) %{_var}/spool/slrnpull/data/active
%attr(2775,news,news) %dir %{_var}/spool/slrnpull/news
%attr(3775,news,news) %dir %{_var}/spool/slrnpull/out.going
%attr(3775,news,news) %dir %{_var}/spool/slrnpull/out.going/rejects
%attr(660,news,news) %ghost %{_var}/spool/slrnpull/log
%config(noreplace) %verify(not md5 size mtime) %{_var}/spool/slrnpull/score
%config(noreplace) %verify(not md5 size mtime) %{_var}/spool/slrnpull/slrnpull.conf
