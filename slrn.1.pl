.\" 1999 PTM Przemek Borys
.\" Personal
.TH SLRN 1
.UC L
.SH NAZWA
slrn - £atwy w u¿yciu czytnik news oparty o NNTP
.SH NOTKA DOKUMENTACYJNA
Ta dokumentacja jest trochê przedawniona. Zachêcamy do obejrzenia
slrn/changes.txt i slrn/doc/slrn.rc z dystrybucji slrn. S± tam bardziej
aktualne dane. Zobacz te¿
http://space.mit.edu/%7Edavis/slrn.html .
.SH SK£ADNIA
.B slrn
[
.B \-n 
] [
.B \-h 
nazwa-serwera-nntp ] [
.B \-f
plik-newsrc ] [
.B \-create
] [
.B \-C
] [
.B \-help
]
.SH OPIS
.I slrn
jest ³atwym w u¿yciu, lecz potê¿nym czytnikiem news, opartym o NNTP. Opiera
siê on w du¿ym zakresie na bibliotece programowania
.I S-Lang
\fR, daj±c w wyniku dostêp do wielu jej w³a¶ciwo¶ci.
.PP
Je¶li w linii komend nie podano ¿adnego serwera poprzez opcjê
.B \-h
\fR, u¿yty zostanie serwer, okre¶lony przez zmienn± ¶rodowiskow± NNTPSERVER.
Opcja
.B \-f
okresla, którego pliku newsrc nale¿y u¿yæ. Je¶li ¿aden nie zostanie podany,
domy¶lnie zostanie u¿yty
.BR \.jnewsrc .
Warto¶æ ta mo¿e byæ na serwerze ustawiona poprzez plik konfiguracyjny
.BR \.slrnrc .
.PP
Opcja
.B \-create
powinna byæ u¿ywana podczas pierwszego po³±czenia
.I slrn
z konkretnym serwerem. Powoduje to, ¿e
.I slrn
odczytuje ca³± listê dostêpnych na serwerze grup i umieszcza je w pliku
newsrc. Je¶li po³±czenie NNTP nie jest najszybsze, proces ten mo¿e zaj±æ
kilka minut. Na szczê¶cie dzieje siê to tylko podczasu u¿ywania flagi
.BR \-create .
.PP
Je¶li w linii komend podane jest
.BR \-C ,
robione jest za³o¿enie, ¿e terminal obs³uguje kolory. Kolory mog± byæ
podawane przy u¿yciu pliku inicjalizacyjnego
.1R .slrnrc .
Je¶li obecna jest opcja
.BR \-n ,
nie bêdzie dokonywane sprawdzanie nowych grup dyskusyjnych. Mo¿e to
zaowocowaæ szybszym uruchamianiem.

.SH PODSTAWOWA OBS£UGA
U¿ywanie
.I slrn
jest do¶æ proste. Zazwyczaj proste wpisanie
.I slrn
spowoduje po³±czenie z serwerem news. Po uruchomieniu,
.I slrn
sprawdza czy nie pojawi³y siê nowe grupy i automatycznie siê do nich
pod³±cza. Po tym etapie, 
.I slrn
przechodzi do trybu ``pe³noekranowego'', gdzie u¿ytkownik mo¿e siê wypisaæ z
jednej, lub wiêkszej ilo¶ci grup.
.I slrn
Wy¶wietla listê grup w nastêpuj±cy sposób:

.nf
->  3      sci.research.postdoc                 689-705
    1      comp.databases.olap                  1-1
    4      rec.antiques.radio+phono             1-4
    1      comp.emulators.ms-windows.win        339-349
  113      comp.unix.questions                  74401-74513
   11      gnu.ghostscript.bug                  4874-4884
  100      alt.music.pink-floyd                 7941-8040
   11      rec.sport.baseball.analysis          239-249
    3      rec.sport.baseball.data              267-269
   13      sci.physics.electromag               1159-1171
   65      comp.sys.ibm.pc.hardware.systems     4754-4818
    5      sci.physics.particle                 1069-1073
    2      comp.sources.x                       2362-2363
    2      comp.unix.user-friendly              2603-2604
.fi

¦rodkowa kolumna pokazuje nazwê grupy dyskusyjnej, a lewa ilo¶æ
nieprzeczytanych artyku³ów. Po prawej mamy zakresy artyku³ów, obecnych na
serwerze. Zwróæ uwagê na obecno¶æ
.B \-\>
w pierwszej kolumnie, w linii `sci.research.postdoc'. Symbol ten jest
u¿ywany przez
.I slrn
jako wska¼nik, pokazuj±cy obecnie wybran± liniê. Mo¿e byæ poruszany w górê i
w dó³ przy u¿yciu strza³ek. Naci¶niêcie RETURN, lub spacji spowoduje
w tym momencie wybranie grupy `sci.research.postdoc'. Pojawi siê wtedy nowy
ekran, który wygl±da nastêpuj±co:

.nf
->-   703   (P) Lecturer in Comp.        dumontet@nuri.inria.fr (dumo
  -   704   Research & Developnment      dumontet@nuri.inria.fr (dumo
  -   705   Re: Example of proposal      shinbrot@bart.chem-eng.nwu.e
.fi

Ka¿da linia sk³ada siê tu z czterech pó³ i ewentualnie z kursora
.BR \-\> .
Pierwsze pole okresla czy artyku³ by³ przeczytany, czy nie. Kreska (
.B \-
) w pierwszym polu oznacza, ¿e artyku³ nie zosta³ przeczytany.
Poniewa¿ kreska pojawia siê w pierwszym polu dla wszystkich trzech
wypisanych wy¿ej linii, wnioskiem jest, ¿e ¿aden z tych artyku³ów nie zosta³
jeszcze zaznaczony jako przeczytany. Je¶li w polu tym wyst±pi³aby litera
.BR d ,
oznacza³oby to, ¿e artyku³ zosta³ przeczytany. Obecnie wybrany artyku³ mo¿e
zmieniaæ stan
.I read
na
.I unread
i odwrotnie. Zaznaczenia jako nieprzeczytany dokonuje siê, przyciskaj±c klawisz
.BR u .
Klawisz
.B d
z kolei s³u¿y do zaznaczania artyku³u znakiem przeczytanego.
Klawisz 
.B c
u¿ywany jest do zaznaczania jako przeczytane wszystkich artyku³ów (Jest to
najlepszy sposób u¿ywania czytnika: przejrzyj artyku³y, szukaj±c czego¶
interesuj±cego, a tu¿ przed przej¶ciem do nastêpnej grupy naci¶nij `c').
.PP
Kolejne pole zawiera numer artyku³u na serwerze. Trzecie i czwarte pole
zawieraj± temat artyku³u i jego autora.
.PP
Naci¶niêcie spacji, lub RETURN utworzy nastêpne okno i wy¶wietli zawarto¶æ
wybranego artyku³u. Okno sk³adaæ siê bêdzie teraz z dwóch okien - jednego
du¿ego i jednego ma³ego. Du¿e okno, okre¶lane jako okno
.I artyku³u
bêdzie zawieraæ obecnie wybrany artyku³. Ma³e okno, okre¶lane jako okno
.I podsumowania
bêdzie zawieraæ listê artyku³ów, podobn± do tej poprzedniej. Do przewijania
artyku³u w dó³ mo¿na u¿ywaæ spacji, a do przewijania w górê mo¿na u¿ywaæ
klawiszy DELETE lub `B'. Strza³ki góra/dó³ poruszaj± kursorem
.B \-\>
w oknie
.IR podsumowania .
Aby usun±æ 
.I okno artyku³u,
naci¶nij klawisz
.BR h .
Spowoduje to powiêkszenie okna
.I podsumowania
na pe³ny ekran.
.PP
Do wys³ania odpowiedzi na wiadomo¶æ (followup), u¿ywa siê klawisza
.BR f .
Aby wróciæ do listy grup, naci¶nij klawisz
.BR Q .
.SH DOMY¦LNE WI¡ZANIA KLAWISZY
Wi±zana te s± zawsze dostêpne:
.TP
.B ?
Pomoc
.TP
.B PageUp Ctrl-U
Ekran w górê
.TP
.B PageDn Ctrl-D
Ekran w dó³
.TP
.B Ctrl-Z
Zawie¶ program
.PP
Na poziomie grup dyskusyjnych mo¿na u¿ywaæ tych klawiszy:
.TP 8
.B SPACJA
Wybierz artyku³y z bie¿±cej grupy.
.TP
.B Strza³ka w górê P
Przejd¼ do poprzedniej grupy
.TP
.B Strza³ka w dó³
Przejd¼ do nastêpnej grupy
.TP
.B q
Zakoñcz program
.TP
.B p
Wy¶lij artyku³
.TP
.B l
W³±cz/wy³±cz wy¶wietlanie grup, które nie zawieraj± artyku³ów
nieprzeczytanych.
.TP
.B L
W³±cz wy¶wietlanie grup, do których nie jeste¶ zapisany (mo¿na siê tak
zapisaæ)
.TP
.B u
Wypisz siê z bie¿±cej grupy
.TP
.B s
Zapisz siê na bie¿±c± grupê
.TP
.B c
Zaznacz wszystkie artyku³y bie¿±cej grupy jako przeczytane.
.TP
.B a
Zapisz siê do podanej grupy
.TP
.B /
Szukaj grupy, do której jeste¶ zapisany
.TP
.B G
Od¶wie¿ grupy z serwera news
.TP
.B X
Zachowaj .newsrc
.TP
.B ESC >
Przejd¼ do ostatniej grupy
.TP
.B ESC <
Przejd¼ do pierwszej grupy
.PP   
Nastêpuj±ce wi±zania s± dostêpne po wybraniu grupy:
.TP 8
.B SPACJA
Wybierz lub przewijaj do przodu obecnie wybrany artyku³
.TP
.B DELETE, b
Przewijaj obecnie wybrany artyku³ do ty³u
.TP
.B d
Zaznacz obecnie wybrany artyku³ jako przeczytany i przejd¼ do nastêpnego
artyku³u nieprzeczytanego.
.TP
.B u
Zaznacz obecnie wybrany artyku³ jako nieprzeczytany
.TP
.B #
Zaznacz numerycznie artyku³ dla wielokrotnego zachowania (zobacz komendê
Numerically tag the article for multiple save (see
.B o
\fR)
.TP
.B g
Przejd¼ do nastêpnego digest
.TP
.B h
Ukryj okno artyku³u przez powiêkszenie okna podsumowania do pe³nego ekranu
.TP
.B Ctrl-^
Zmniejsz rozmiar okna nag³ówkowego o jedn± liniê.
.TP
.B ^
Zwiêksz rozmiar okna nag³ówkowego o jedn± liniê.
.TP
.B f
Wy¶lij odpowied¼ (follow-up) do obecnie wybranego artyku³u.
.TP
.B F
Forwarduj obecnie wybrany artyku³ do kogo¶
.TP
.B r
Odpowiedz bezpo¶rednio do autora wybranego artyku³u
.TP
.B o
Zapisz wybrany artyku³ lub w±tek do pliku w formacie unixowej skrzynki
pocztowej przez doklejenie go do podanego pliku, a nastêpnie opcjonalne
zdekodowanie przez uudecode lub unshar. Je¶li obecne s± zaznaczone numerycznie
artyku³y (zobacz
.B #
),  to opcjonalnie zachowaj i zdekoduj zaznaczone artyku³y. Wbudowany
uudekoder mo¿e dekodowaæ pliki, zawieraj±ce wiele wieloczê¶ciowych
zakodowanych artyku³ów. Musz± one jednak byæ zaznaczone w odpowiedniej 
kolejno¶ci. Do odznaczenia artyku³ów mo¿na u¿yæ klawisza
.B ESC #
\fR.
.TP
.B q
Wyjd¼ z tego okna i przejd¼ do listy grup
.TP
.B T
W³±cz wy¶wietlanie cytatów
.TP
.B K
W³±cz scoring
.TP
.B TAB
Pomiñ cytaty w artykule
.TP
.B t
Prze³±czaj nag³ówki artyku³u miêdzy stanem "schowanym" i "widocznym".
Domy¶lnie niewa¿ne nag³ówki s± ukrywane.
.TP
.B Strza³ka w górê
Przejd¼ do poprzedniego artyku³u
.TP
.B Strza³ka w dó³
Przejd¼ do nastêpnego artyku³u
.TP
.B ESC Strza³ka w dó³, RETURN
Przewiñ artyku³ w dó³ o jedn± liniê
.TP
.B <
Przeskocz na pocz±tek artyku³u
.TP
.B ESC Strza³ka w górê
Przewiñ artyku³ w górê o jedn± liniê
.TP
.B ESC >
Przejd¼ do ostatniego artyku³u
.TP
.B ESC <
Przejd¼ do pierwszego artyku³u
.TP
.B Strza³ka w prawo
Przewiñ artyku³ w prawo
.TP
.B Strza³ka w lewo
Przewiñ artyku³ w lewo
.TP
.B n
Przejd¼ do nastêpnego nieprzeczytanego artyku³u
.TP
.B o
Dopisz artyku³ do pliku; opcjonalnie zdekoduj przy pomocy uudecode lub shar
.TP
.B p
Przejd¼ do poprzednio nieprzeczytanego artyku³u
.TP
.B PageUp, PageDn
Przewiñ ekran w górê lub w dó³ listê nag³ówków.
.TP
.B /
Szukaj w artykule w kierunku postêpowym.
.TP
.B ?
Szukaj w artykule w kierunku wstecznym.
.TP
.B a
Szukaj autora w kierunku postêpowym.
.TP
.B A
Szukaj autora w kierunku wstecznym.
.TP
.B s
Szukaj tematu w kierunku postêpowym.
.TP
.B S
Szukaj tematu w kierunku wstecznym.
.TP
.B H
Ukryj artyku³ (spowoduj, by jego okno znik³o)
.TP
.B N
Przeskocz do nastêpnej grupy dyskusyjnej
.TP
.B j
Przejd¼ do artyku³u
.TP
.B P
Wy¶lij artyku³ (zobacz te¿
.B f
\fR, s³u¿±cy do wysy³ania odpowiedzi (follow-up))
.TP
.B ¦REDNIK
Ustaw na obecnym artykule znacznik.
.TP
.B PRZECINEK
Powróæ do poprzednio ustawionego znacznika, ustawiaj±c wpierw znacznik.
.TP
.B *
Zaznacz artyku³ jako 'wa¿ny' (chroni przed zaznaczeniem artyku³u jako
skasowany)
.TP
.B |
Prze¶lij artyku³ do zewnêtrznej komendy (poprzez ³±cze)
.TP
.B ESC Ctrl-C
Anuluj bie¿±cy artyku³.
.TP
.B ESC Ctrl-S
Zast±p bie¿±cy artyku³ przez edycjê oryginalengo tekstu.
.TP
.B c
Zaznacz wszystkie artyku³y jako przeczytane
.TP
.B ESC C
Zaznacz artyku³y znajduj±ce siê do tego miejsca jako przeczytane.
.TP
.B ESC U
Zaznacz artyku³y, znajduj±ce siê do tego miejsca jako nieprzeczytane.
.TP
.B Ctrl-R, Ctrl-L
Od¶wie¿ zawarto¶æ ekranu.
.TP
.B ESC R
W³±cz/wy³±cz dekodowanie ROT13.
.TP
.B ESC S
W³±cz/wy³±cz w±tkowanie nag³ówków.
.TP
.B ESC T
W³±cz zwijanie w±tkowania nag³ówków
.TP
.B ESC A
Prze³±czaj miêdzy metodami wy¶wietlania nag³ówków
.TP
.B ESC p
Znajd¼ nag³ówek rodzicielski
.TP
.B ESC Ctrl-P
Znajd¼ nag³ówek potomka
.TP
.B ?
Poka¿ pomoc
.TP
.B Ctrl-Z
Zawie¶ czytnik.
.TP
.B E
Edytuj parametry score (punktowania), u¿ywaj±c tego artyku³u jako wzorca.
.SH ZMIENNE ¦RODOWISKOWE
.I slrn
u¿ywa nastêpuj±cej listy zmiennych ¶rodowiskowych:
.TP 12  
.B NNTPSERVER
serwer NNTP, z którym ma siê po³±czaæ, je¶li nie podano ¿adnego podczas
uruchamiania
.IR slrn .
.TP
.B EDITOR
.TP
.B SLANG_EDITOR
Edytor, którego u¿ywaæ podczas tworzenia wiadomo¶ci. '%s' i '%d' mog± s³u¿yæ
do przekazywania nazwy pliku i liczby linii. Na przyk³ad, je¶li twoim
edytorem jest `jed', to mo¿esz u¿yæ w swoim pliku startowym pow³oki czego¶ w 
rodzaju:
.B                      setenv SLANG_EDITOR \'jed %s \-g %d\'
\fR. Je¶li u¿ywasz basha, mo¿esz zamiast tego u¿yæ komendy:
.B                      export SLANG_EDITOR=\'jed %s \-g %d\' 
.B SLANG_EDITOR
jest preferowan± zmienn± ¶rodowiskow±, gdy¿ wszystkie aplikacje
.IR S-Lang ,
które korzystaj± z edytora, poszukuj± tej zmiennej i rozumiej± jej sk³adniê.
.TP
.B REPLYTO
Adres, wstawiany do pola `Reply-To'.
.TP
.B ORGANIZATION
£añcuch, u¿ywany w polu `Organization'.
.SH PLIK INICJALIZACYJNY slrn
Jesli w katalogu domowym u¿ytkownika istnieje plik o nazwie
.BR .slrnrc ,
to
.I slrn 
u¿yje go jako pliku inicjalizacyjnego. Plik ten mo¿e zawieraæ listê
prywatnych wi±zañ klawiszy, lub listê mapowañ serwer--newsrc.
.PP
.PP
WI¡ZANIE KLAWISZY
.PP
Aby przywi±zaæ do jakiej¶ funkcji klawisz, u¿yj sk³adni:
.PP
.B              setkey  mapaklawisza  funkcja  sekwencja-klawiszowa
.PP
Funkcja
.I setkey
wymaga trzech argumentów. Pierwszy okre¶la
.I mapêklawisza
(keymap), u¿ywan± do wi±zania. Prawid³owe mapy to
.I group
i
.I article.
Argument
.I funkcja
okre¶la funkcjê, któr± nale¿y wywo³aæ po naci¶nieñciu klawiszy z ostatniego
argumentu. Na przyk³ad,
.PP
                       setkey  group  quit "x"
.PP
oznacza, ¿e je¶li w poziomie
.I group
naci¶niêty zostanie klawisz
.IR x ,
to wywo³ana zostanie funkcja
.IR quit (zakoñczenia).
Zauwa¿, ¿e choæ normalnie nie jest to konieczne, ostatni argument powinien
byæ ujmowany w cudzys³owy, gdy¿ mo¿e zawieraæ spacje.
.PP
Sekwencja klawiszowa mo¿e sk³adaæ siê z wielu znaków. Na przyk³ad, na wielu
terminalach strza³ka w prawo przesy³a trzy znaki ESC, `[' i `C'. Aby
przywi±zaæ strza³kê w prawo do funkcji `select_group' (wybierz grupê), u¿yj:
.PP
                        setkey group select_group "\\e[C"
.PP
Czasami przed przywi±zaniem klawisza trzeba anulowaæ istniej±ce wi±zanie.
Np. nie mo¿na zrobiæ:
.PP
                        setkey group quit "\\e"
.PP
w celu przywi±zania klawisza ESC do funkcji quit, bez uprzedniej anulacji.
Jest tak dlatego, ¿e znaku ESC u¿ywaj± wi±zania domy¶lne. Aby wykorzystaæ
ten klawisz, u¿yj funkcji
.IR unsetkey :

                         unsetkey group "\\e"
                         setkey group quit "\\e"

W tym wypadku funkcja
.I unsetkey
usunê³± wszystkie wi±zania znaku ESC. Nastepnie nast±pi³o wi±zanie go z
funkcj± `quit'. Zauwa¿ proszê, ¿e anulowanie klawisza ESC anuluje równie¿
wszystkie sekwencje, które z nim wystêpowa³y. Czyli wiêkszo¶æ klawiszy
funkcyjnych.
.PP
Zobacz ni¿ej przyk³adowy plik inicjalizacyjny. Jest tam lista funkcji i ich
znaczeñ.
.PP
U¯YWANIE WIELU SERWERÓW
.PP
Najprostszym sposobem u¿ywania wielu serwerów jest skorzystanie z komendy
.I server
w pliku
.BR \.slrnrc .
Komenda ta wi±¿e nazwê serwera z plikiem 
.BR newsrc :
.PP
.B                 server nntp-server  newsrc-file

Na przyk³ad, za³ó¿my, ¿e u¿ywasz trzech serwerów o nazwach hostów
`red.news.edu', `blue.news.edu' i `green.news.edu'. Wtedy linie: 
.PP
.B server red.news.edu \.jnewsrc-red

.B server blue.news.edu  \.jnewsrc-blue

.B server green.news.edu \.jnewsrc-green
.PP
okre¶laj±, ¿e plik
.B .jnewsrc-red
jest u¿ywany z serwerem
.B red.news.edu
itd.
.PP
DEFINIOWANIE KOLORÓW
.PP
Obs³uga kolorów jest w³±czana prze³±cznikiem `-C' w linii komend. Kolory
mog± byæ definiowane przy u¿yciu s³owa kluczowego `color' w pliku
konfiguracyjnym `.slrnrc'. Sk³adnia jest nastêpuj±ca:

    color NAZWA-OBIEKTU KOLOR_PIERWSZEGO-PLANU KOLOR-T£A
    
NAZWA-OBIEKTU mo¿e byæ jednym z nastêpuj±cych elementów:

.nf
    menu           --  Linia na górze wy¶wietlacza (pasek menu)
    menu_press     --  Aktywny element menu
    status         --  Linia statusu, do³±czona do okien
    cursor         --  Wska¼nik pozycji -->
    error          --  Komunikaty o b³êdach
    group          --  Nazwy grup dyskusyjnych (tryb group)
    description    --  Opisy grup dyskucyjnych (tryb group)
    article        --  Cia³o artyku³u (nie nag³ówki)
    headers        --  Linie, które tworz± nag³ówek artyku³u
    author         --  Nazwisko autora
    subject        --  Temat
    signature      --  Sygnaturka autora
    quotes         --  Materia³ cytowany
    high_score     --  Artyku³y o du¿ej punktacji (score)
    tree           --  Drzewo artyku³ów
    tilde          --  Tyldy (tryb tilde)
    thread_number  --  Numery w±tków
    normal         --  wszystko pozosta³e
.fi

Nazwy kolorów pierwszego planu/t³a mog± byæ nastêpuj±ce:
  
.nf
    black                gray
    red                  brightred
    green                brightgreen
    brown                yellow
    blue                 brightblue
    magenta              brightmagenta
    cyan                 brightcyan
    lightgray            white
    default
.fi

Wiêkszo¶æ terminali nie obs³uguje kolorów drugiej grupy dla t³a.

.PP
.B UKRYWANIE CYTOWANYCH ARTYKU£ÓW
.PP
Czêsto artyku³y zawieraj± cytaty poprzednich artyku³ów.
.I slrn
jest w stanie nie wy¶wietlaæ linii artyku³u, które odpowiadaj± okre¶lonemu
wyra¿eniu regularnemu. Wra¿enie regularne mo¿e byæ podane przez wstawienie
do pliku
.B \.slrnrc
linii o postaci

     ignore_quotes  WYRA¯ENIE-REGULARNE
     
\fR. Domy¶lnym wyra¿eniem regularnym jest

     "^ ?[:>=]"
     
co odpowiada dowolnej linii, rozpoczynaj±cej siê od potencjalnej spacji, za
któr± nastêpuje dwukropek, znak wiêkszo¶ci, lub znak równo¶ci.

Aby w³±czyæ lub wy³±czyæ wy¶wietlanie takich linii, w trybie `article'
naci¶nij `T'.
.PP
.SH PUNKTOWANIE ARTYKU£ÓW
.PP
(Dla szczegó³owego opisu elastyczno¶ci slrn'owego pliku punktacyjnego
zajrzyj do plików
.B KILL_FAQ
i
.BR score.txt ,
obecnych w dystrybucji slrn)
.PP
W niektórych czytnikach, jedna z w³a¶ciwo¶ci punktacyjnych slrn mog³aby byæ
okre¶lana jako tzw. "
.B killfile
".  Jednak w przeciwieñstwie do pewnych innych czytników, slrn daje dobre
narzêdzia nie tylko wycinania artyku³ów, lecz równie¿ specjalnego ich
zaznaczania.
.PP
Dostêpne s± cztery poziomy punktowania:
.TP
.B -9999
Punktowany artyku³ jest kasowany (jak w killfile) i nie bêdzie siê pojawia³
w oknie nag³ówków
.TP
.B -1 do -9998
Punktowany artyku³ pojawia siê ze znacznikiem "
.B D
" jak we fladze "Deleted"
.TP
.B 0 
normalny artyku³
.TP
.B 1 do 9999
Punktowany artyku³ pojawi siê z flag± "
.B !
", oznaczaj±c± wa¿no¶æ
.PP
.B KONFIGUROWANIE PLIKU PUNKTACJI
.PP
System punktowania jest wy³±czony do czasu, gdy ustawisz
.B scorefile
na ¶cie¿kê pliku, którego slrn powienien u¿ywac do przechowywania parametrów
punktowania.
.PP
Po ustawieniu,
plik punktacyjny
mo¿e byæ osi±gany przez komendê
.B E
w oknie nag³ówków. Mo¿e te¿ byæ edytowany rêcznie. W wypadku dostêpu przez
komendê
.B E
, dopisuje zawieraj±cy trochê parametrów wzorzec, oparty o bie¿±cy artyku³.
Nastêpnie jeste¶ umieszczany w swoim edytorze. Aby w³±czyæ punktowanie,
skasuj symbol
.B %
z pierwszej kolumny linii nag³ówkowej, któr± chcesz punktowaæ.
.PP
Innym sposobem konfigurowania pliku punktacyjnego jest jego rêczna edycja.
Oto przyk³adowy plik punktacyjny:

.nf
  [news.software.readers]
     Score: 9999
     % Wszystkie artyku³y s± dobre
     Subject: slrn

     Score: 9999
     % To jest kto¶, kogo chcê s³yszeæ
     From: davis@space\.mit\.edu

     Score = -9999
     Subject: \<f?agent\>

  [comp.os.linux.*]
     Score: -10
     Expires: 1/1/1996
     Subject: swap

     Score: 20
     Subject: SunOS

     Score: 50
     From: Linus


     % Usuñ wszystkie artyku³y crosspostowane na grupê adcocacy
     Score: -9999
     Xref: advocacy
     ~From: Linus

     % Od osoby tej nie chcê nic s³yszeæ, chyba ¿e napisze co¶ o
     % `gizmos', lecz tylko w comp.os.linux.development.*

     Score: -9999
     From: someone@who\.knows\.where
     ~Subject: gizmo
     ~Newsgroup: development
 
     % Lubiê ich ¶ledziæ

     [alt.fan.warlord]
     Score:: 20
     Subject: larry
     Subject: curly
.fi

.PP
Plik ten sk³ada siê z dwóch sekcji. Pierwsza sekcja definiuje zestaw testów,
stosowanych do grup news.software.readers.  Nastêpna sekcja tyczy siê grup
comp.os.linux.
.PP
Pierwsza sekcja zwiera trzy testy. Pierwszy test daje punktacjê 9999
wszelkim tematom, zawieraj±cym ³añcuch `slrn'. Nastêpny test dotyczy siê
`From'. Mówi, ¿e ka¿dy artyku³ od `davis@space.mit.edu' ma uzyskaæ punktacjê
9999. Trzeci daje punktacjê -9999 ka¿demu artyku³owi, którego temat zawiera
s³owo `agent'. Poniewa¿ testy s± aplikowane w kolejno¶ci, to je¶li artyku³
zawiera zarówno `slrn', jak i `agent', to dostanie punktacjê 9999. 9999 jest
specjaln± warto¶ci± punktacyjn±.
.PP
Druga sekcja jest bardziej z³o¿ona. Tyczy siê grup dyskusyjnych
comp.os.linux i sk³ada siê z 5 testów. Pierwsze trzy s± proste: -10 punktów
dla tematu, zawieraj±cego `swap', 20 je¶li zawiera SunOs i 50, je¶li jest to
artyku³ od kogo¶, o nazwisku `Linus'. Znaczy to, ¿e je¶li
Bill@Somewhere napisze artyku³ o tytule `Swap, Swap, Swap', to artyku³
dostanie -10 punktów. Jednak je¶li Linus napisze artyku³ o tym samym tytule,
to uzyska -10 + 50 = 40 punktów. Zauwa¿, ¿e pierwszy test ulegnie
przedawnieniu na pocz±tku 1996.
.PP
Czwarty test usuwa wszystkie artyku³y, które by³y crosspostowane na grupê
advocacy, chyba ¿e by³y wys³ane przez Linusa. Zauwa¿, ¿e je¶li s³owo
kluczowe rozpoczyna siê od znaku `~', to dzia³anie wyra¿enia regularnego
jest odwracane.
.PP
Czwarty test filtruje wiadomo¶ci od someone@who.knows.where,
chyba ¿e pisze o `gizmos' na grupach comp.os.development.
Znów zwróæ uwagê na znak `~'.
.PP
Ostatni test zaznacza jako wa¿ne wiadomo¶ci od Moe lub Curly w grupie
alt.fan.warlord.  Demonstruje to u¿ycie warunku "OR" w pliku punktacji.

.PP
.SH KOPIA GRZECZNO¦CIOWA
.PP
Je¶li chcesz wys³aæ kopiê grzeczno¶ciow± swojego artyku³u odpowiedzi do
oryginalnego nadawcy, to mo¿esz tak zrobiæ, dodaj±c do artyku³u nag³ówek
"Cc:". Oto przyk³ad, jak wys³aæ kopiê grzeczno¶ciow± odpowiedzi do 
Johna Davisa (autora slrn) na og³oszenie nowej wersji slrn:
.PP
 Newsgroups: news.software.readers
 Subject: Re: slrn 0.8.0 Released!
 References: <46c6b8$e2@news.mit.edu>
 Organization: a clean well lit place
 Reply-To: hg@n2wx.ampr.org
 Followup-To:
 Cc: davis@space.mit.edu


 On 22 Oct 1995 01:26:45 GMT, John Davis <davis@space.mit.edu> wrote:
 ...
.PP
John odbierze kopiê odpowiedzi poczt±, gdzie wiadomosæ zostanie poprzedzona
lini± tekstu, mówi±c±, ¿e [This message has also been posted.] (ta wiadomo¶æ
zosta³a  równie¿ wys³ana na grupê dyskusyjn±)
(Tekst wewn±trz nawiasów mo¿e byæ konfigurowany w pliku .slrnrc, z pomoc±
parametru
.B cc_followup_string
\fR.)

.PP
.B RÓ¯NE USTAWIENIA
.PP
Plik inicjalizacyjny .slrnrc obs³uguje te¿ nastêpuj±ce komendy:

.nf
   signature             <nazwa pliku z sygnaturk±>
   organization          <nazwa organizacji>
   replyto               <adres email, u¿ywany jako reply-to>
   quote_string          <³añcuch u¿ywany do cytowania artyku³u>
   editor_command        <³añcuch u¿ywany do wywo³ania edytora>   
   scorefile             <nazwa pliku punktacyjnego>

   
Na przyk³ad, 

   signature         .news-signature
   organization      "Society of Famous Outlaws"
   signature         "Billy the Kid"
   quote_string      ">"
   editor_command    "jed %s -g %d -tmp"
   scorefile         "News/Score"
.fi

.PP   
   
.SH PLIKI
.B $HOME/.slrnrc
- plik inicjalizacyjny
.I slrn
.PP
.B $HOME/.jnewsrc
- domy¶lny plik newsrc
.I slrn.
.SH PRZYK£AD PLIKU INICJALIZACYJNEGO

.nf
 % Oto przyk³adowy plik startowy czytnika slrn. Znak procenta oznacza
 % komentarz
 
 % mapowanie SERVER na NEWSRC
 %server hsdndev.harvard.edu .jnewrc-hsdndev
 %server news.uni-stuttgart.de .jnewsrc-stuttgart
 
 % nastêpna linia jest dla serwerów, wymagaj±cych has³a
 %nnrpaccess HOSTNAME USERNAME PASSWORD
 
 
 %hostname "YOUR.HOSTNAME"
 %set username "jdoe"
 %set realname "John Doe"
 %set replyto  "jd@somthing.com"
 
 % Nazwa u¿ywanego pliku sygnaturki
 %set signature ".signature"
 
 % Znak cytowania, u¿ywany podczas odpowiadania
 quote_string ">"
 
 % je¶li niezerowe, sygnatur anie bêdzie w³±czana do cytowanego tekstu
 % odpowiedzi
 set followup_strip_signature 0

 % to wyra¿enie regularne definiuje linie, uwa¿ane za linie cytowania.
 % Mówi, ¿e wszystkie linie, zaczynaj±ce siê od 0-2 spacji i znaku
 % >, <, :, |, lub = s± liniami cytowanymi.
 ignore_quotes "^ ? ?[><:=|]"
 
 % To ustawia ³añcuch followup. Rozpoznawane s± tu nastêpuj±ce specyfikatory
 % formatu: %d:data, %r:nazwa rzeczywista, %f:email, %s:temat,
 %             %m:msgid, %n:grupy dyskusyjne, %%: procent 
 followup "On %d, %r <%f> wrote:"
 
 %W³asne nag³ówki do dodania podczas odpowiedzi
 %set custom_headers "X-Whatever: bla\nX-Misc: bla bla"
 
 % U¿ywana przegl±darka WWW. Klawisz 'U' w trybie artyku³owym przeszukuje
 % artyku³ w poszukiwaniu URL i wywo³uje Xbrowser (je¶li pracuje w X),
 % lub w przeciwnym wypadku non_Xbrowser
 set Xbrowser "netscape %s &"
 set non_Xbrowser "lynx %s"

 % Je¶li obecny jest autobaud, wielko¶æ wyj¶cia bêdzie synchronizowana
 % z wielko¶ci± baud
 %autobaud
 
 % je¶li niezerowe, przy wej¶ciu w tryb artyku³owy wy¶wietl najpierw
 % (pierwszy?) artyku³
 % if non-zero, display first article when entering article-mode.
 set show_article 0
 
 % je¶li niezerowe, poka¿ opis grupy dyskusyjnej
 set show_descriptions 1

 % kolumna, przy której rozpoczynaj± siê opisy
 set group_dsc_start_column 40

 % Je¶li niezerowe, nie s± robione kopie zapasowe newsrc
 set no_backups 0
 
 % Je¶li zero, nie rób beepów. Je¶li 1, wysy³aj beep. Je¶li 2, wysy³aj tylko
 % wizualny dzwonek. Je¶li 3, wysy³aj obydwa.
 set beep 1
 
 % Jesli niezerowe, slrn automatycznie bêdzie siê zapisywa³ do nowych grup.
 % domy¶lnie 0.
 set unsubscribe_new_groups 0
 
 % Je¶li niezerowe, wszystkie tytu³y tematów zostan± wy¶wietlone, nawet gdy
 % wiele mo¿e byæ zduplikowanych.. Warto¶æ 0 powoduje, ¿e ekran wygl±da
 % spokojniej. 
 set show_thread_subject 0
 
 % W³±cz obs³ugê myszy w xterm: 1 w³±cza, 0 wy³acza
 set mouse 0
 
 % Ustawienie którego¶ z nich na 0 umo¿liwi ci przechodzenie bezpo¶rednio do
 % nastêpnego artyku³u/grupy, bez potwierdzanai
 set query_next_group 1
 set query_next_article 1
 
 % je¶li zero, nie zobaczysz znaku zachêty "next group:". Nie jest to to
 % samo co zmienna 'query_next_group'.
 set prompt_next_group 1
 
 % Ustaw to na 0 dla wy³±czenia potwierdzeñ przy odpowiadaniu,
 % wychodzeniu, ...
 set confirm_actions 1
 
 % Je¶li 0, nie wy¶wietlaj nazwiska autora. Je¶li 1, wy¶wietlaj temat, a
 % potem nazwisko. Je¶li 2, wy¶wietlaj nazwisko, potem temat.
 set author_display 2
 
 % 0: zachowuj wszystkie grupy podczas pisania do newsrc
 % 1: nie zachowuj ¿adnych grup, do których nie jeste¶ zapisany
 % 2: nie zachowuj ¿adnych nieprzeczytanych-niezapisanych grup
 set write_newsrc_flags 1
 
 % Je¶li wiêksze ni¿ 0, do nadawcy bêdzie generowanya automatycznie nag³ówek
 % Cc: (podczas followupów). Je¶li -1, najpierw bêdzie pytanie.
 set cc_followup 0
 cc_followup_string "[This message has also been posted.]"
 
 % Komenda sendmail umo¿liwia podstawienie innego mailera. Upewnij siê, ¿e
 % obs³uguje taki sam interfejs jak sendmail!
 %set sendmail_command "/usr/lib/sendmail -oi -t -oem -odb"
 
 
 % nazwa pliku punktacyjnego (wzglêdem katalogu domowego)
 scorefile "News/Score"
 
 % Nazwa katalogu gdzie umieszczane s± zdekodowane pliki (wzglêdem katalogu
 % domowego)
 set decode_directory "News"
 % katalog gdzie zachowywane s± inne pliki
 set save_directory "News"
   
 % komenda, u¿ywana do wywo³ywania edytora. W poni¿szym przyk³adzie %s
 % okre¶la nazwê pliku, a %d okre¶la pocz±tkowy numer linii
 %editor_command "jed %s -g %d -tmp"
 
 % Jesli niezerowe, pliki u¿ywane do nadawania, odpowiadania bêd±
 % sk³adowane jako pliki tymczasowe w katalogu okre¶lonym przez zmienn±
 % ¶rodowiskow± TMPDIR, lub w /tmp
 set use_tmpdir 0
 
 % 0: nie sortuj. 1: w±tkuj. 2: sortuj wed³ug tematu
 % 3: w³±tkuj wynik sortowania tematów
 % 4: sortuj punktacyjnie. 5: w±tkuj wynik 4.
 set sorting_method 3
 set display_score 0
 
 % Je¶li niezerowe, w±tki bêd± nierozwiniête po wej¶ciu do grupy
 set uncollapse_threads 0
 
 % Je¶li niezerowe, slrn spróbuje odczytaæ podczas startu plik active. Mo¿e
 % to prowadziæ do szybszego startu JE¦LI twoje po³±czenie sieciowe jest
 % do¶æ szybkie. W przeciwnym wypadku NIE U¯YWAJ TEGO. Je¶li mo¿esz, polecam
 % ustawienie 1
 set read_active 0
 
 % Je¶li niezerowe, a read_active jest zerem, slrn spróbuje u¿yæ komendy
 % XGTITLE podczas listowania niezapisanych grup
 set use_xgtitle 0
 
 % Co zawijaæ podczas zawijania artyku³u:
 %  0 lub 4 ==> zawiñ cia³o
 %  1 lub 5 ==> zawiñ nag³ówki, cia³o
 %  2 lub 6 ==> zawiñ cytowany tekst, cia³o
 %  3 lub 7 ==> zawiñ nag³ówki, cytowany tekst, cia³o
 % Wy¿sze liczby wskazuj± ¿e ka¿dy artyku³ bêdzie zawijany automatycznie
 set wrap_flags 4
 
 % Maksymalna liczba artyku³ów, odczytywana do zapytania slrn. Domy¶lnie 100.
 % Aby wy³±czyæ pytanie, wstaw 0
 set query_read_group_cutoff 100
 
 % Liczba linii, odczytywanych od serwera miêdzy procentowymi od¶wie¿eniami
 % licznika. Liczba ta bêdzie zale¿eæ od szybko¶ci po³±czenia z twoim
 % serwerem
 set lines_per_update 100
 
 %---------------------------------------------------------------------------
 % obs³uga mime
 %---------------------------------------------------------------------------
 set use_mime 1
 set mime_charset "iso-8859-1"
 % jesli niezerowe, wo³aj metamail dla formatów mime, których slrn nie
 % potrafi obs³u¿yæ.
 set use_metamail 1
 
 % Je¶li niezerowe, w lewym marginesie okna nag³ówka bêd± wy¶wietlane liczby
 % nag³ówków. Liczby te mog± byæ u¿ywane jako ``wybieracze w±tków''.
 set use_header_numbers 1
 
 % Je¶li niezerowe, pytaj o ponowne po³±czenie, je¶li padnie NNTP. Je¶li
 % zero, próba jest dokonywana bez pytania.
 set query_reconnect 1
 
 % Znak u¿ywany do ukrywania spojlerów:
 set spoiler_char '*'
 
 
 %---------------------------------------------------------------------------
 %  Lokalna konfiguracja sk³adowania
 %---------------------------------------------------------------------------
 % set spool_inn_root "/export/opt/inn"
 % set spool_root "/export/news"
 % set spool_nov_root "/export/news"
 %
 %% -- nastêpuj±ce nazwy plików s± wzglêdne do spool_root
 %
 % set spool_nov_file ".overview"
 % set spool_active_file "data/active"
 % set spool_activetimes_file "data/active.times"
 % set spool_newsgroups_file "data/newsgroups"
 
 
 %---------------------------------------------------------------------------
 %  Obs³uga GroupLens
 %---------------------------------------------------------------------------
 %set use_grouplens 1
 %color grouplens_display blue white
 %set grouplens_host		"grouplens.cs.umn.edu"
 %set grouplens_port		9000
 %set grouplens_pseudoname	"YOUR_PSEUDONAME"
 %grouplens_add "rec.cooking.recipes"
 %grouplens_add "comp.os.linux.misc"

 %------------
 % Kolory
 %------------
 color header_number green white
 color normal black white
 color error red white
 color status yellow blue
 color normal black white
 color error red white
 color status yellow blue
 color group blue white
 color article blue white
 color cursor brightgreen white
 color author magenta white
 color subject black white
 color headers brightcyan white
 color menu yellow blue
 color menu_press yellow blue
 color tree red white
 color quotes red white
 color thread_number blue white
 color high_score red white
 color signature red white
 color description blue white
 color tilde green white
 
 %-----------------------------------------------------
 % Czarnobia³e atrybuty dla terminali monochromatycznych
 %-----------------------------------------------------
 mono normal		none
 mono header_number	none
 mono error		blink bold
 mono status		reverse
 mono group		bold
 mono article		none
 mono cursor		bold reverse
 mono author		none
 mono subject		none
 mono headers		bold
 mono menu		reverse
 mono menu_press		none
 mono tree		bold
 mono quotes		underline
 mono thread_number	bold
 mono high_score		bold
 mono signature		none
 mono description	none

 %------------------------  Mapaklawiszowa group------------------------
 
 setkey group	add_group	"A"    %  dodaj now± grupê
 setkey group	bob		"\e<"  %  pocz±tek bufora
 setkey group	bob		"^K\eOA"
 setkey group	bob		"^K\e[A"
 setkey group	catch_up	"C"    %  zaznacz grupê jako przeczytan±
 setkey group	down		"\eOB" %  nastêpna grupa
 setkey group	down		"\e[B"
 setkey group	down		"^N"
 setkey group	eob		"\e>"  %  koniec bufora
 setkey group	eob		"^K\eOB"
 setkey group	eob		"^K\e[B"
 setkey group	group_search_forward	"/"
 setkey group	help		"?"
 setkey group	pagedown	"^D"   %  nastêpna strona grup
 setkey group	pagedown	"\e[6~"
 setkey group	pagedown	"^V"
 setkey group	pageup		"\eV"  %  poprzednia strona grup
 setkey group	pageup		"^U"
 setkey group	pageup		"\e[5~"
 setkey group	post		"P"
 setkey group	quit		"Q"
 setkey group	redraw		"^L"
 setkey group	redraw		"^R"
 setkey group	refresh_groups	"G"
 setkey group	save_newsrc	"X"
 setkey group	select_group	"\r"   %  odczytaj artyku³y z grupy
 setkey group	select_group	" "
 setkey group	subscribe	"S"    %  zapisz siê do grupy
 setkey group	suspend		"^Z"
 setkey group	toggle_group_display	"\033A"
 setkey group	toggle_score	"K"
 setkey group	toggle_hidden	"l"
 setkey group	toggle_list_all	"L"
 setkey group	unsubscribe	"U"    %  wypisz siê z grupy
 setkey group	up		"\eOA" %  poprzednia linia
 setkey group	up		"\e[A"
 setkey group	up		"^P"
 
 %---------------- Mapaklawiszowa article -------------------------------
 
 setkey article	goto_article	"j"
 setkey article	pipe_article	"|"
 setkey article	skip_quotes	"\t"
 
 setkey article	pageup		"^U"
 setkey article	pageup		"\e[5~"
 setkey article	pageup		"\eV"
 
 setkey article	pagedn		"\e[6~"
 setkey article	pagedn		"^D"
 setkey article	pagedn		"^V"
 
 setkey article post "P"
 setkey article toggle_show_author "\ea"
 setkey article get_parent_header "\ep"
 setkey article	catchup_all	"c"
 setkey article	catchup_all	"\ec"
 setkey article	uncatchup_all	"\eu"
 setkey article	catchup		"\eC"
 setkey article	uncatchup	"\eU"
 setkey article	scroll_dn	" "	% przewiñ do nastêpnej strony artyku³u lub wybierz artyku³
 setkey article	scroll_up	"^?"	% przewiñ do nastêpnej stronyartyku³u
 setkey article	scroll_up	"b"	% (scroll_up lub article_pageup)
 setkey article article_lineup	"\e\e[A"	% Przewiñ artyku³ liniê w górê
 setkey article article_lineup	"\e\eOA"
 setkey article article_linedn	"\e\e[B"	% Przewiñ artyku³ liniê w dó³
 setkey article article_linedn	"\e\eOB"
 setkey article	article_linedn	"\r"
 setkey article  article_search	"/"	% Szukaj wprzód w artykule
 setkey article  author_search_forward	"a"	% Szukaj wprzód autora
 setkey article  author_search_backward	"A"	% Szukaj wstecz autora
 setkey article  cancel		"\e^C"	% Anuluj artyku³
 setkey article  delete		"d"	% Zaznacz artyku³ za przeczytany i przejd¼ do nastêpnego nieczytanego
 setkey article  down		"^N"	% Przejd¼ do nastêpnego artyku³u
 setkey article  down		"\e[B"
 setkey article  down		"\eOB"
 setkey article  mark_spot	";"	% Zaznacz artyku³
 setkey article  exchange_mark	","	% Zaznacz artyku³ i przejd¼ do poprzedniego zazanaczenia
 setkey article  followup	"f"	% Followup
 setkey article  forward		"F"	% Forward
 setkey article  help		"?"	% Poka¿ pomoc
 setkey article  hide_article	"H"	% Uktyj okno artyku³u.
 setkey article  art_eob	">"	% id¼ na koniec artyku³u
 setkey article  left		"\eOD"
 setkey article  left		"\e[D"
 setkey article  next		"n"	% nastêpny nieczytany artyku³
 setkey article  skip_to_next_group	"N"	% nastêpna grupa
 setkey article  prev		"p"	% poprzedni nieczytany artyku³
 setkey article  quit		"q"	% Wyjd¼ do trybu wyboru grupy.
 setkey article  redraw		"^L"	% Od¶wie¿ wy¶wietlacz
 setkey article  redraw		"^R"
 setkey article  reply		"r"	% odpowiedz do autora artyku³u
 setkey article  art_bob	"<"	% Id¼ na pocz±tek artyku³u
 setkey article  right		"\e[C"
 setkey article  right		"\eOC"
 setkey article  save		"O"	% Do³±cz do pliku w formacie unix mail
 setkey article  subject_search_forward	"s"	% Szukaj wprzód/wstecz artyku³u o podanym temacie
 setkey article  subject_search_backward	"S"
 setkey article  suspend		"^Z"	% Zawie¶ czytnik
 setkey article	toggle_rot13	"\eR"
 setkey article	toggle_sort	"\eS"
 setkey article  toggle_headers	"t"	% W³±cz/wy³acz wy¶wietlanie nag³ówków
 setkey article  toggle_quotes	"T"
 setkey article  undelete    	"u"	% Zaznacz artyku³ jako nieprzeczytany
 setkey article  up		"^P"	% Przejd¼ do poprzedniego artyku³u
 setkey article  up		"\eOA"
 setkey article  up		"\e[A"
 setkey article	header_bob	"\e<"	% Przejd¼ do pierwszego artyku³u listy
 setkey article	header_eob	"\e>"	% Przejd¼ do ostatniego artyku³u listy
 setkey article	shrink_window	"^^"	% Ctrl-6 or Ctrl-^	% Skurcz okno nag³ówków
 setkey article	enlarge_window	"^"	% Shift-6 or just ^	% Powiêksz okno nag³ówków
 
 %setkey article  skip_to_prev_group ""     % Bez domy¶lnych wi±zañ
 %setkey article  fast_quit          ""     % bez domy¶lnych wi±zañ
 
 % Oto specjalna przeróbka dla terminali HP by uzyskaæ strza³ki.
 % S± jeszcze jakie¶ terminale gdzie nie  ma strza³ek w ANSI?
 #if$TERM hpterm
   setkey group up "\eA"       % "^(ku)"
   setkey group down "\eB"     % "^(kd)"
   setkey article down "\eB"
   setkey article up "\eA"
   setkey article left "\eD"
   setkey article right "\eC"
 #endif
.fi

.SH ZOBACZ TAK¯E
environ(5)

Pytania o
.I slrn
mo¿na zadawaæ na grupie dyskusyjnej
.I news.software.readers
gdzie mo¿na uzyskaæ odpowiedzi od autora programu. Dodatkowo, puszczane s±
tam og³oszenia nowych wersji
.IR slrn .

Ostatnia wersja
.I slrn
jest dostêpna przez anonimowy ftp z
.B space.mit.edu
z pub/davis/slrn.

.SH AUTOR
John E. Davis <davis@space.mit.edu>

.SH PODZIÊKOWANIA

(Lista jest niekompletna)

Howard Goldstein <hg@n2wx.ampr.org> - od¶wie¿anie tego podrêcznika.

Andrew Greer <Andrew.Greer@vuw.ac.nz> - port VMS.

Jay Maynard <jmaynard@admin5.hsc.uth.tmc.edu> - port OS/2.

Michael Elkins <elkins@aero.org> - kod MIME.

Lloyd Zusman <ljz@ingress.com> - udoskonalenia kosmetyczne.

J.B. Nicholson-Owens <jbn@mystery-train.cu-online.com> - intensywne
testowanie.

Mark Olesen <olesen@weber.me.queensu.ca> - wskazówki i pomoc w wersji AIX.
