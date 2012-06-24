.\" 1999 PTM Przemek Borys
.\" Personal
.TH SLRN 1
.UC L
.SH NAZWA
slrn - �atwy w u�yciu czytnik news oparty o NNTP
.SH NOTKA DOKUMENTACYJNA
Ta dokumentacja jest troch� przedawniona. Zach�camy do obejrzenia
slrn/changes.txt i slrn/doc/slrn.rc z dystrybucji slrn. S� tam bardziej
aktualne dane. Zobacz te�
http://space.mit.edu/%7Edavis/slrn.html .
.SH SK�ADNIA
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
jest �atwym w u�yciu, lecz pot�nym czytnikiem news, opartym o NNTP. Opiera
si� on w du�ym zakresie na bibliotece programowania
.I S-Lang
\fR, daj�c w wyniku dost�p do wielu jej w�a�ciwo�ci.
.PP
Je�li w linii komend nie podano �adnego serwera poprzez opcj�
.B \-h
\fR, u�yty zostanie serwer, okre�lony przez zmienn� �rodowiskow� NNTPSERVER.
Opcja
.B \-f
okresla, kt�rego pliku newsrc nale�y u�y�. Je�li �aden nie zostanie podany,
domy�lnie zostanie u�yty
.BR \.jnewsrc .
Warto�� ta mo�e by� na serwerze ustawiona poprzez plik konfiguracyjny
.BR \.slrnrc .
.PP
Opcja
.B \-create
powinna by� u�ywana podczas pierwszego po��czenia
.I slrn
z konkretnym serwerem. Powoduje to, �e
.I slrn
odczytuje ca�� list� dost�pnych na serwerze grup i umieszcza je w pliku
newsrc. Je�li po��czenie NNTP nie jest najszybsze, proces ten mo�e zaj��
kilka minut. Na szcz�cie dzieje si� to tylko podczasu u�ywania flagi
.BR \-create .
.PP
Je�li w linii komend podane jest
.BR \-C ,
robione jest za�o�enie, �e terminal obs�uguje kolory. Kolory mog� by�
podawane przy u�yciu pliku inicjalizacyjnego
.1R .slrnrc .
Je�li obecna jest opcja
.BR \-n ,
nie b�dzie dokonywane sprawdzanie nowych grup dyskusyjnych. Mo�e to
zaowocowa� szybszym uruchamianiem.

.SH PODSTAWOWA OBS�UGA
U�ywanie
.I slrn
jest do�� proste. Zazwyczaj proste wpisanie
.I slrn
spowoduje po��czenie z serwerem news. Po uruchomieniu,
.I slrn
sprawdza czy nie pojawi�y si� nowe grupy i automatycznie si� do nich
pod��cza. Po tym etapie, 
.I slrn
przechodzi do trybu ``pe�noekranowego'', gdzie u�ytkownik mo�e si� wypisa� z
jednej, lub wi�kszej ilo�ci grup.
.I slrn
Wy�wietla list� grup w nast�puj�cy spos�b:

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

�rodkowa kolumna pokazuje nazw� grupy dyskusyjnej, a lewa ilo��
nieprzeczytanych artyku��w. Po prawej mamy zakresy artyku��w, obecnych na
serwerze. Zwr�� uwag� na obecno��
.B \-\>
w pierwszej kolumnie, w linii `sci.research.postdoc'. Symbol ten jest
u�ywany przez
.I slrn
jako wska�nik, pokazuj�cy obecnie wybran� lini�. Mo�e by� poruszany w g�r� i
w d� przy u�yciu strza�ek. Naci�ni�cie RETURN, lub spacji spowoduje
w tym momencie wybranie grupy `sci.research.postdoc'. Pojawi si� wtedy nowy
ekran, kt�ry wygl�da nast�puj�co:

.nf
->-   703   (P) Lecturer in Comp.        dumontet@nuri.inria.fr (dumo
  -   704   Research & Developnment      dumontet@nuri.inria.fr (dumo
  -   705   Re: Example of proposal      shinbrot@bart.chem-eng.nwu.e
.fi

Ka�da linia sk�ada si� tu z czterech p� i ewentualnie z kursora
.BR \-\> .
Pierwsze pole okresla czy artyku� by� przeczytany, czy nie. Kreska (
.B \-
) w pierwszym polu oznacza, �e artyku� nie zosta� przeczytany.
Poniewa� kreska pojawia si� w pierwszym polu dla wszystkich trzech
wypisanych wy�ej linii, wnioskiem jest, �e �aden z tych artyku��w nie zosta�
jeszcze zaznaczony jako przeczytany. Je�li w polu tym wyst�pi�aby litera
.BR d ,
oznacza�oby to, �e artyku� zosta� przeczytany. Obecnie wybrany artyku� mo�e
zmienia� stan
.I read
na
.I unread
i odwrotnie. Zaznaczenia jako nieprzeczytany dokonuje si�, przyciskaj�c klawisz
.BR u .
Klawisz
.B d
z kolei s�u�y do zaznaczania artyku�u znakiem przeczytanego.
Klawisz 
.B c
u�ywany jest do zaznaczania jako przeczytane wszystkich artyku��w (Jest to
najlepszy spos�b u�ywania czytnika: przejrzyj artyku�y, szukaj�c czego�
interesuj�cego, a tu� przed przej�ciem do nast�pnej grupy naci�nij `c').
.PP
Kolejne pole zawiera numer artyku�u na serwerze. Trzecie i czwarte pole
zawieraj� temat artyku�u i jego autora.
.PP
Naci�ni�cie spacji, lub RETURN utworzy nast�pne okno i wy�wietli zawarto��
wybranego artyku�u. Okno sk�ada� si� b�dzie teraz z dw�ch okien - jednego
du�ego i jednego ma�ego. Du�e okno, okre�lane jako okno
.I artyku�u
b�dzie zawiera� obecnie wybrany artyku�. Ma�e okno, okre�lane jako okno
.I podsumowania
b�dzie zawiera� list� artyku��w, podobn� do tej poprzedniej. Do przewijania
artyku�u w d� mo�na u�ywa� spacji, a do przewijania w g�r� mo�na u�ywa�
klawiszy DELETE lub `B'. Strza�ki g�ra/d� poruszaj� kursorem
.B \-\>
w oknie
.IR podsumowania .
Aby usun�� 
.I okno artyku�u,
naci�nij klawisz
.BR h .
Spowoduje to powi�kszenie okna
.I podsumowania
na pe�ny ekran.
.PP
Do wys�ania odpowiedzi na wiadomo�� (followup), u�ywa si� klawisza
.BR f .
Aby wr�ci� do listy grup, naci�nij klawisz
.BR Q .
.SH DOMY�LNE WI�ZANIA KLAWISZY
Wi�zana te s� zawsze dost�pne:
.TP
.B ?
Pomoc
.TP
.B PageUp Ctrl-U
Ekran w g�r�
.TP
.B PageDn Ctrl-D
Ekran w d�
.TP
.B Ctrl-Z
Zawie� program
.PP
Na poziomie grup dyskusyjnych mo�na u�ywa� tych klawiszy:
.TP 8
.B SPACJA
Wybierz artyku�y z bie��cej grupy.
.TP
.B Strza�ka w g�r� P
Przejd� do poprzedniej grupy
.TP
.B Strza�ka w d�
Przejd� do nast�pnej grupy
.TP
.B q
Zako�cz program
.TP
.B p
Wy�lij artyku�
.TP
.B l
W��cz/wy��cz wy�wietlanie grup, kt�re nie zawieraj� artyku��w
nieprzeczytanych.
.TP
.B L
W��cz wy�wietlanie grup, do kt�rych nie jeste� zapisany (mo�na si� tak
zapisa�)
.TP
.B u
Wypisz si� z bie��cej grupy
.TP
.B s
Zapisz si� na bie��c� grup�
.TP
.B c
Zaznacz wszystkie artyku�y bie��cej grupy jako przeczytane.
.TP
.B a
Zapisz si� do podanej grupy
.TP
.B /
Szukaj grupy, do kt�rej jeste� zapisany
.TP
.B G
Od�wie� grupy z serwera news
.TP
.B X
Zachowaj .newsrc
.TP
.B ESC >
Przejd� do ostatniej grupy
.TP
.B ESC <
Przejd� do pierwszej grupy
.PP   
Nast�puj�ce wi�zania s� dost�pne po wybraniu grupy:
.TP 8
.B SPACJA
Wybierz lub przewijaj do przodu obecnie wybrany artyku�
.TP
.B DELETE, b
Przewijaj obecnie wybrany artyku� do ty�u
.TP
.B d
Zaznacz obecnie wybrany artyku� jako przeczytany i przejd� do nast�pnego
artyku�u nieprzeczytanego.
.TP
.B u
Zaznacz obecnie wybrany artyku� jako nieprzeczytany
.TP
.B #
Zaznacz numerycznie artyku� dla wielokrotnego zachowania (zobacz komend�
Numerically tag the article for multiple save (see
.B o
\fR)
.TP
.B g
Przejd� do nast�pnego digest
.TP
.B h
Ukryj okno artyku�u przez powi�kszenie okna podsumowania do pe�nego ekranu
.TP
.B Ctrl-^
Zmniejsz rozmiar okna nag��wkowego o jedn� lini�.
.TP
.B ^
Zwi�ksz rozmiar okna nag��wkowego o jedn� lini�.
.TP
.B f
Wy�lij odpowied� (follow-up) do obecnie wybranego artyku�u.
.TP
.B F
Forwarduj obecnie wybrany artyku� do kogo�
.TP
.B r
Odpowiedz bezpo�rednio do autora wybranego artyku�u
.TP
.B o
Zapisz wybrany artyku� lub w�tek do pliku w formacie unixowej skrzynki
pocztowej przez doklejenie go do podanego pliku, a nast�pnie opcjonalne
zdekodowanie przez uudecode lub unshar. Je�li obecne s� zaznaczone numerycznie
artyku�y (zobacz
.B #
),  to opcjonalnie zachowaj i zdekoduj zaznaczone artyku�y. Wbudowany
uudekoder mo�e dekodowa� pliki, zawieraj�ce wiele wielocz�ciowych
zakodowanych artyku��w. Musz� one jednak by� zaznaczone w odpowiedniej 
kolejno�ci. Do odznaczenia artyku��w mo�na u�y� klawisza
.B ESC #
\fR.
.TP
.B q
Wyjd� z tego okna i przejd� do listy grup
.TP
.B T
W��cz wy�wietlanie cytat�w
.TP
.B K
W��cz scoring
.TP
.B TAB
Pomi� cytaty w artykule
.TP
.B t
Prze��czaj nag��wki artyku�u mi�dzy stanem "schowanym" i "widocznym".
Domy�lnie niewa�ne nag��wki s� ukrywane.
.TP
.B Strza�ka w g�r�
Przejd� do poprzedniego artyku�u
.TP
.B Strza�ka w d�
Przejd� do nast�pnego artyku�u
.TP
.B ESC Strza�ka w d�, RETURN
Przewi� artyku� w d� o jedn� lini�
.TP
.B <
Przeskocz na pocz�tek artyku�u
.TP
.B ESC Strza�ka w g�r�
Przewi� artyku� w g�r� o jedn� lini�
.TP
.B ESC >
Przejd� do ostatniego artyku�u
.TP
.B ESC <
Przejd� do pierwszego artyku�u
.TP
.B Strza�ka w prawo
Przewi� artyku� w prawo
.TP
.B Strza�ka w lewo
Przewi� artyku� w lewo
.TP
.B n
Przejd� do nast�pnego nieprzeczytanego artyku�u
.TP
.B o
Dopisz artyku� do pliku; opcjonalnie zdekoduj przy pomocy uudecode lub shar
.TP
.B p
Przejd� do poprzednio nieprzeczytanego artyku�u
.TP
.B PageUp, PageDn
Przewi� ekran w g�r� lub w d� list� nag��wk�w.
.TP
.B /
Szukaj w artykule w kierunku post�powym.
.TP
.B ?
Szukaj w artykule w kierunku wstecznym.
.TP
.B a
Szukaj autora w kierunku post�powym.
.TP
.B A
Szukaj autora w kierunku wstecznym.
.TP
.B s
Szukaj tematu w kierunku post�powym.
.TP
.B S
Szukaj tematu w kierunku wstecznym.
.TP
.B H
Ukryj artyku� (spowoduj, by jego okno znik�o)
.TP
.B N
Przeskocz do nast�pnej grupy dyskusyjnej
.TP
.B j
Przejd� do artyku�u
.TP
.B P
Wy�lij artyku� (zobacz te�
.B f
\fR, s�u��cy do wysy�ania odpowiedzi (follow-up))
.TP
.B �REDNIK
Ustaw na obecnym artykule znacznik.
.TP
.B PRZECINEK
Powr�� do poprzednio ustawionego znacznika, ustawiaj�c wpierw znacznik.
.TP
.B *
Zaznacz artyku� jako 'wa�ny' (chroni przed zaznaczeniem artyku�u jako
skasowany)
.TP
.B |
Prze�lij artyku� do zewn�trznej komendy (poprzez ��cze)
.TP
.B ESC Ctrl-C
Anuluj bie��cy artyku�.
.TP
.B ESC Ctrl-S
Zast�p bie��cy artyku� przez edycj� oryginalengo tekstu.
.TP
.B c
Zaznacz wszystkie artyku�y jako przeczytane
.TP
.B ESC C
Zaznacz artyku�y znajduj�ce si� do tego miejsca jako przeczytane.
.TP
.B ESC U
Zaznacz artyku�y, znajduj�ce si� do tego miejsca jako nieprzeczytane.
.TP
.B Ctrl-R, Ctrl-L
Od�wie� zawarto�� ekranu.
.TP
.B ESC R
W��cz/wy��cz dekodowanie ROT13.
.TP
.B ESC S
W��cz/wy��cz w�tkowanie nag��wk�w.
.TP
.B ESC T
W��cz zwijanie w�tkowania nag��wk�w
.TP
.B ESC A
Prze��czaj mi�dzy metodami wy�wietlania nag��wk�w
.TP
.B ESC p
Znajd� nag��wek rodzicielski
.TP
.B ESC Ctrl-P
Znajd� nag��wek potomka
.TP
.B ?
Poka� pomoc
.TP
.B Ctrl-Z
Zawie� czytnik.
.TP
.B E
Edytuj parametry score (punktowania), u�ywaj�c tego artyku�u jako wzorca.
.SH ZMIENNE �RODOWISKOWE
.I slrn
u�ywa nast�puj�cej listy zmiennych �rodowiskowych:
.TP 12  
.B NNTPSERVER
serwer NNTP, z kt�rym ma si� po��cza�, je�li nie podano �adnego podczas
uruchamiania
.IR slrn .
.TP
.B EDITOR
.TP
.B SLANG_EDITOR
Edytor, kt�rego u�ywa� podczas tworzenia wiadomo�ci. '%s' i '%d' mog� s�u�y�
do przekazywania nazwy pliku i liczby linii. Na przyk�ad, je�li twoim
edytorem jest `jed', to mo�esz u�y� w swoim pliku startowym pow�oki czego� w 
rodzaju:
.B                      setenv SLANG_EDITOR \'jed %s \-g %d\'
\fR. Je�li u�ywasz basha, mo�esz zamiast tego u�y� komendy:
.B                      export SLANG_EDITOR=\'jed %s \-g %d\' 
.B SLANG_EDITOR
jest preferowan� zmienn� �rodowiskow�, gdy� wszystkie aplikacje
.IR S-Lang ,
kt�re korzystaj� z edytora, poszukuj� tej zmiennej i rozumiej� jej sk�adni�.
.TP
.B REPLYTO
Adres, wstawiany do pola `Reply-To'.
.TP
.B ORGANIZATION
�a�cuch, u�ywany w polu `Organization'.
.SH PLIK INICJALIZACYJNY slrn
Jesli w katalogu domowym u�ytkownika istnieje plik o nazwie
.BR .slrnrc ,
to
.I slrn 
u�yje go jako pliku inicjalizacyjnego. Plik ten mo�e zawiera� list�
prywatnych wi�za� klawiszy, lub list� mapowa� serwer--newsrc.
.PP
.PP
WI�ZANIE KLAWISZY
.PP
Aby przywi�za� do jakiej� funkcji klawisz, u�yj sk�adni:
.PP
.B              setkey  mapaklawisza  funkcja  sekwencja-klawiszowa
.PP
Funkcja
.I setkey
wymaga trzech argument�w. Pierwszy okre�la
.I map�klawisza
(keymap), u�ywan� do wi�zania. Prawid�owe mapy to
.I group
i
.I article.
Argument
.I funkcja
okre�la funkcj�, kt�r� nale�y wywo�a� po naci�nie�ciu klawiszy z ostatniego
argumentu. Na przyk�ad,
.PP
                       setkey  group  quit "x"
.PP
oznacza, �e je�li w poziomie
.I group
naci�ni�ty zostanie klawisz
.IR x ,
to wywo�ana zostanie funkcja
.IR quit (zako�czenia).
Zauwa�, �e cho� normalnie nie jest to konieczne, ostatni argument powinien
by� ujmowany w cudzys�owy, gdy� mo�e zawiera� spacje.
.PP
Sekwencja klawiszowa mo�e sk�ada� si� z wielu znak�w. Na przyk�ad, na wielu
terminalach strza�ka w prawo przesy�a trzy znaki ESC, `[' i `C'. Aby
przywi�za� strza�k� w prawo do funkcji `select_group' (wybierz grup�), u�yj:
.PP
                        setkey group select_group "\\e[C"
.PP
Czasami przed przywi�zaniem klawisza trzeba anulowa� istniej�ce wi�zanie.
Np. nie mo�na zrobi�:
.PP
                        setkey group quit "\\e"
.PP
w celu przywi�zania klawisza ESC do funkcji quit, bez uprzedniej anulacji.
Jest tak dlatego, �e znaku ESC u�ywaj� wi�zania domy�lne. Aby wykorzysta�
ten klawisz, u�yj funkcji
.IR unsetkey :

                         unsetkey group "\\e"
                         setkey group quit "\\e"

W tym wypadku funkcja
.I unsetkey
usun곱 wszystkie wi�zania znaku ESC. Nastepnie nast�pi�o wi�zanie go z
funkcj� `quit'. Zauwa� prosz�, �e anulowanie klawisza ESC anuluje r�wnie�
wszystkie sekwencje, kt�re z nim wyst�powa�y. Czyli wi�kszo�� klawiszy
funkcyjnych.
.PP
Zobacz ni�ej przyk�adowy plik inicjalizacyjny. Jest tam lista funkcji i ich
znacze�.
.PP
U�YWANIE WIELU SERWER�W
.PP
Najprostszym sposobem u�ywania wielu serwer�w jest skorzystanie z komendy
.I server
w pliku
.BR \.slrnrc .
Komenda ta wi��e nazw� serwera z plikiem 
.BR newsrc :
.PP
.B                 server nntp-server  newsrc-file

Na przyk�ad, za��my, �e u�ywasz trzech serwer�w o nazwach host�w
`red.news.edu', `blue.news.edu' i `green.news.edu'. Wtedy linie: 
.PP
.B server red.news.edu \.jnewsrc-red

.B server blue.news.edu  \.jnewsrc-blue

.B server green.news.edu \.jnewsrc-green
.PP
okre�laj�, �e plik
.B .jnewsrc-red
jest u�ywany z serwerem
.B red.news.edu
itd.
.PP
DEFINIOWANIE KOLOR�W
.PP
Obs�uga kolor�w jest w��czana prze��cznikiem `-C' w linii komend. Kolory
mog� by� definiowane przy u�yciu s�owa kluczowego `color' w pliku
konfiguracyjnym `.slrnrc'. Sk�adnia jest nast�puj�ca:

    color NAZWA-OBIEKTU KOLOR_PIERWSZEGO-PLANU KOLOR-T�A
    
NAZWA-OBIEKTU mo�e by� jednym z nast�puj�cych element�w:

.nf
    menu           --  Linia na g�rze wy�wietlacza (pasek menu)
    menu_press     --  Aktywny element menu
    status         --  Linia statusu, do��czona do okien
    cursor         --  Wska�nik pozycji -->
    error          --  Komunikaty o b��dach
    group          --  Nazwy grup dyskusyjnych (tryb group)
    description    --  Opisy grup dyskucyjnych (tryb group)
    article        --  Cia�o artyku�u (nie nag��wki)
    headers        --  Linie, kt�re tworz� nag��wek artyku�u
    author         --  Nazwisko autora
    subject        --  Temat
    signature      --  Sygnaturka autora
    quotes         --  Materia� cytowany
    high_score     --  Artyku�y o du�ej punktacji (score)
    tree           --  Drzewo artyku��w
    tilde          --  Tyldy (tryb tilde)
    thread_number  --  Numery w�tk�w
    normal         --  wszystko pozosta�e
.fi

Nazwy kolor�w pierwszego planu/t�a mog� by� nast�puj�ce:
  
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

Wi�kszo�� terminali nie obs�uguje kolor�w drugiej grupy dla t�a.

.PP
.B UKRYWANIE CYTOWANYCH ARTYKU��W
.PP
Cz�sto artyku�y zawieraj� cytaty poprzednich artyku��w.
.I slrn
jest w stanie nie wy�wietla� linii artyku�u, kt�re odpowiadaj� okre�lonemu
wyra�eniu regularnemu. Wra�enie regularne mo�e by� podane przez wstawienie
do pliku
.B \.slrnrc
linii o postaci

     ignore_quotes  WYRA�ENIE-REGULARNE
     
\fR. Domy�lnym wyra�eniem regularnym jest

     "^ ?[:>=]"
     
co odpowiada dowolnej linii, rozpoczynaj�cej si� od potencjalnej spacji, za
kt�r� nast�puje dwukropek, znak wi�kszo�ci, lub znak r�wno�ci.

Aby w��czy� lub wy��czy� wy�wietlanie takich linii, w trybie `article'
naci�nij `T'.
.PP
.SH PUNKTOWANIE ARTYKU��W
.PP
(Dla szczeg�owego opisu elastyczno�ci slrn'owego pliku punktacyjnego
zajrzyj do plik�w
.B KILL_FAQ
i
.BR score.txt ,
obecnych w dystrybucji slrn)
.PP
W niekt�rych czytnikach, jedna z w�a�ciwo�ci punktacyjnych slrn mog�aby by�
okre�lana jako tzw. "
.B killfile
".  Jednak w przeciwie�stwie do pewnych innych czytnik�w, slrn daje dobre
narz�dzia nie tylko wycinania artyku��w, lecz r�wnie� specjalnego ich
zaznaczania.
.PP
Dost�pne s� cztery poziomy punktowania:
.TP
.B -9999
Punktowany artyku� jest kasowany (jak w killfile) i nie b�dzie si� pojawia�
w oknie nag��wk�w
.TP
.B -1 do -9998
Punktowany artyku� pojawia si� ze znacznikiem "
.B D
" jak we fladze "Deleted"
.TP
.B 0 
normalny artyku�
.TP
.B 1 do 9999
Punktowany artyku� pojawi si� z flag� "
.B !
", oznaczaj�c� wa�no��
.PP
.B KONFIGUROWANIE PLIKU PUNKTACJI
.PP
System punktowania jest wy��czony do czasu, gdy ustawisz
.B scorefile
na �cie�k� pliku, kt�rego slrn powienien u�ywac do przechowywania parametr�w
punktowania.
.PP
Po ustawieniu,
plik punktacyjny
mo�e by� osi�gany przez komend�
.B E
w oknie nag��wk�w. Mo�e te� by� edytowany r�cznie. W wypadku dost�pu przez
komend�
.B E
, dopisuje zawieraj�cy troch� parametr�w wzorzec, oparty o bie��cy artyku�.
Nast�pnie jeste� umieszczany w swoim edytorze. Aby w��czy� punktowanie,
skasuj symbol
.B %
z pierwszej kolumny linii nag��wkowej, kt�r� chcesz punktowa�.
.PP
Innym sposobem konfigurowania pliku punktacyjnego jest jego r�czna edycja.
Oto przyk�adowy plik punktacyjny:

.nf
  [news.software.readers]
     Score: 9999
     % Wszystkie artyku�y s� dobre
     Subject: slrn

     Score: 9999
     % To jest kto�, kogo chc� s�ysze�
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


     % Usu� wszystkie artyku�y crosspostowane na grup� adcocacy
     Score: -9999
     Xref: advocacy
     ~From: Linus

     % Od osoby tej nie chc� nic s�ysze�, chyba �e napisze co� o
     % `gizmos', lecz tylko w comp.os.linux.development.*

     Score: -9999
     From: someone@who\.knows\.where
     ~Subject: gizmo
     ~Newsgroup: development
 
     % Lubi� ich �ledzi�

     [alt.fan.warlord]
     Score:: 20
     Subject: larry
     Subject: curly
.fi

.PP
Plik ten sk�ada si� z dw�ch sekcji. Pierwsza sekcja definiuje zestaw test�w,
stosowanych do grup news.software.readers.  Nast�pna sekcja tyczy si� grup
comp.os.linux.
.PP
Pierwsza sekcja zwiera trzy testy. Pierwszy test daje punktacj� 9999
wszelkim tematom, zawieraj�cym �a�cuch `slrn'. Nast�pny test dotyczy si�
`From'. M�wi, �e ka�dy artyku� od `davis@space.mit.edu' ma uzyska� punktacj�
9999. Trzeci daje punktacj� -9999 ka�demu artyku�owi, kt�rego temat zawiera
s�owo `agent'. Poniewa� testy s� aplikowane w kolejno�ci, to je�li artyku�
zawiera zar�wno `slrn', jak i `agent', to dostanie punktacj� 9999. 9999 jest
specjaln� warto�ci� punktacyjn�.
.PP
Druga sekcja jest bardziej z�o�ona. Tyczy si� grup dyskusyjnych
comp.os.linux i sk�ada si� z 5 test�w. Pierwsze trzy s� proste: -10 punkt�w
dla tematu, zawieraj�cego `swap', 20 je�li zawiera SunOs i 50, je�li jest to
artyku� od kogo�, o nazwisku `Linus'. Znaczy to, �e je�li
Bill@Somewhere napisze artyku� o tytule `Swap, Swap, Swap', to artyku�
dostanie -10 punkt�w. Jednak je�li Linus napisze artyku� o tym samym tytule,
to uzyska -10 + 50 = 40 punkt�w. Zauwa�, �e pierwszy test ulegnie
przedawnieniu na pocz�tku 1996.
.PP
Czwarty test usuwa wszystkie artyku�y, kt�re by�y crosspostowane na grup�
advocacy, chyba �e by�y wys�ane przez Linusa. Zauwa�, �e je�li s�owo
kluczowe rozpoczyna si� od znaku `~', to dzia�anie wyra�enia regularnego
jest odwracane.
.PP
Czwarty test filtruje wiadomo�ci od someone@who.knows.where,
chyba �e pisze o `gizmos' na grupach comp.os.development.
Zn�w zwr�� uwag� na znak `~'.
.PP
Ostatni test zaznacza jako wa�ne wiadomo�ci od Moe lub Curly w grupie
alt.fan.warlord.  Demonstruje to u�ycie warunku "OR" w pliku punktacji.

.PP
.SH KOPIA GRZECZNO�CIOWA
.PP
Je�li chcesz wys�a� kopi� grzeczno�ciow� swojego artyku�u odpowiedzi do
oryginalnego nadawcy, to mo�esz tak zrobi�, dodaj�c do artyku�u nag��wek
"Cc:". Oto przyk�ad, jak wys�a� kopi� grzeczno�ciow� odpowiedzi do 
Johna Davisa (autora slrn) na og�oszenie nowej wersji slrn:
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
John odbierze kopi� odpowiedzi poczt�, gdzie wiadomos� zostanie poprzedzona
lini� tekstu, m�wi�c�, �e [This message has also been posted.] (ta wiadomo��
zosta�a  r�wnie� wys�ana na grup� dyskusyjn�)
(Tekst wewn�trz nawias�w mo�e by� konfigurowany w pliku .slrnrc, z pomoc�
parametru
.B cc_followup_string
\fR.)

.PP
.B RӯNE USTAWIENIA
.PP
Plik inicjalizacyjny .slrnrc obs�uguje te� nast�puj�ce komendy:

.nf
   signature             <nazwa pliku z sygnaturk�>
   organization          <nazwa organizacji>
   replyto               <adres email, u�ywany jako reply-to>
   quote_string          <�a�cuch u�ywany do cytowania artyku�u>
   editor_command        <�a�cuch u�ywany do wywo�ania edytora>   
   scorefile             <nazwa pliku punktacyjnego>

   
Na przyk�ad, 

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
- domy�lny plik newsrc
.I slrn.
.SH PRZYK�AD PLIKU INICJALIZACYJNEGO

.nf
 % Oto przyk�adowy plik startowy czytnika slrn. Znak procenta oznacza
 % komentarz
 
 % mapowanie SERVER na NEWSRC
 %server hsdndev.harvard.edu .jnewrc-hsdndev
 %server news.uni-stuttgart.de .jnewsrc-stuttgart
 
 % nast�pna linia jest dla serwer�w, wymagaj�cych has�a
 %nnrpaccess HOSTNAME USERNAME PASSWORD
 
 
 %hostname "YOUR.HOSTNAME"
 %set username "jdoe"
 %set realname "John Doe"
 %set replyto  "jd@somthing.com"
 
 % Nazwa u�ywanego pliku sygnaturki
 %set signature ".signature"
 
 % Znak cytowania, u�ywany podczas odpowiadania
 quote_string ">"
 
 % je�li niezerowe, sygnatur anie b�dzie w��czana do cytowanego tekstu
 % odpowiedzi
 set followup_strip_signature 0

 % to wyra�enie regularne definiuje linie, uwa�ane za linie cytowania.
 % M�wi, �e wszystkie linie, zaczynaj�ce si� od 0-2 spacji i znaku
 % >, <, :, |, lub = s� liniami cytowanymi.
 ignore_quotes "^ ? ?[><:=|]"
 
 % To ustawia �a�cuch followup. Rozpoznawane s� tu nast�puj�ce specyfikatory
 % formatu: %d:data, %r:nazwa rzeczywista, %f:email, %s:temat,
 %             %m:msgid, %n:grupy dyskusyjne, %%: procent 
 followup "On %d, %r <%f> wrote:"
 
 %W�asne nag��wki do dodania podczas odpowiedzi
 %set custom_headers "X-Whatever: bla\nX-Misc: bla bla"
 
 % U�ywana przegl�darka WWW. Klawisz 'U' w trybie artyku�owym przeszukuje
 % artyku� w poszukiwaniu URL i wywo�uje Xbrowser (je�li pracuje w X),
 % lub w przeciwnym wypadku non_Xbrowser
 set Xbrowser "netscape %s &"
 set non_Xbrowser "lynx %s"

 % Je�li obecny jest autobaud, wielko�� wyj�cia b�dzie synchronizowana
 % z wielko�ci� baud
 %autobaud
 
 % je�li niezerowe, przy wej�ciu w tryb artyku�owy wy�wietl najpierw
 % (pierwszy?) artyku�
 % if non-zero, display first article when entering article-mode.
 set show_article 0
 
 % je�li niezerowe, poka� opis grupy dyskusyjnej
 set show_descriptions 1

 % kolumna, przy kt�rej rozpoczynaj� si� opisy
 set group_dsc_start_column 40

 % Je�li niezerowe, nie s� robione kopie zapasowe newsrc
 set no_backups 0
 
 % Je�li zero, nie r�b beep�w. Je�li 1, wysy�aj beep. Je�li 2, wysy�aj tylko
 % wizualny dzwonek. Je�li 3, wysy�aj obydwa.
 set beep 1
 
 % Jesli niezerowe, slrn automatycznie b�dzie si� zapisywa� do nowych grup.
 % domy�lnie 0.
 set unsubscribe_new_groups 0
 
 % Je�li niezerowe, wszystkie tytu�y temat�w zostan� wy�wietlone, nawet gdy
 % wiele mo�e by� zduplikowanych.. Warto�� 0 powoduje, �e ekran wygl�da
 % spokojniej. 
 set show_thread_subject 0
 
 % W��cz obs�ug� myszy w xterm: 1 w��cza, 0 wy�acza
 set mouse 0
 
 % Ustawienie kt�rego� z nich na 0 umo�liwi ci przechodzenie bezpo�rednio do
 % nast�pnego artyku�u/grupy, bez potwierdzanai
 set query_next_group 1
 set query_next_article 1
 
 % je�li zero, nie zobaczysz znaku zach�ty "next group:". Nie jest to to
 % samo co zmienna 'query_next_group'.
 set prompt_next_group 1
 
 % Ustaw to na 0 dla wy��czenia potwierdze� przy odpowiadaniu,
 % wychodzeniu, ...
 set confirm_actions 1
 
 % Je�li 0, nie wy�wietlaj nazwiska autora. Je�li 1, wy�wietlaj temat, a
 % potem nazwisko. Je�li 2, wy�wietlaj nazwisko, potem temat.
 set author_display 2
 
 % 0: zachowuj wszystkie grupy podczas pisania do newsrc
 % 1: nie zachowuj �adnych grup, do kt�rych nie jeste� zapisany
 % 2: nie zachowuj �adnych nieprzeczytanych-niezapisanych grup
 set write_newsrc_flags 1
 
 % Je�li wi�ksze ni� 0, do nadawcy b�dzie generowanya automatycznie nag��wek
 % Cc: (podczas followup�w). Je�li -1, najpierw b�dzie pytanie.
 set cc_followup 0
 cc_followup_string "[This message has also been posted.]"
 
 % Komenda sendmail umo�liwia podstawienie innego mailera. Upewnij si�, �e
 % obs�uguje taki sam interfejs jak sendmail!
 %set sendmail_command "/usr/lib/sendmail -oi -t -oem -odb"
 
 
 % nazwa pliku punktacyjnego (wzgl�dem katalogu domowego)
 scorefile "News/Score"
 
 % Nazwa katalogu gdzie umieszczane s� zdekodowane pliki (wzgl�dem katalogu
 % domowego)
 set decode_directory "News"
 % katalog gdzie zachowywane s� inne pliki
 set save_directory "News"
   
 % komenda, u�ywana do wywo�ywania edytora. W poni�szym przyk�adzie %s
 % okre�la nazw� pliku, a %d okre�la pocz�tkowy numer linii
 %editor_command "jed %s -g %d -tmp"
 
 % Jesli niezerowe, pliki u�ywane do nadawania, odpowiadania b�d�
 % sk�adowane jako pliki tymczasowe w katalogu okre�lonym przez zmienn�
 % �rodowiskow� TMPDIR, lub w /tmp
 set use_tmpdir 0
 
 % 0: nie sortuj. 1: w�tkuj. 2: sortuj wed�ug tematu
 % 3: w��tkuj wynik sortowania temat�w
 % 4: sortuj punktacyjnie. 5: w�tkuj wynik 4.
 set sorting_method 3
 set display_score 0
 
 % Je�li niezerowe, w�tki b�d� nierozwini�te po wej�ciu do grupy
 set uncollapse_threads 0
 
 % Je�li niezerowe, slrn spr�buje odczyta� podczas startu plik active. Mo�e
 % to prowadzi� do szybszego startu JE�LI twoje po��czenie sieciowe jest
 % do�� szybkie. W przeciwnym wypadku NIE U�YWAJ TEGO. Je�li mo�esz, polecam
 % ustawienie 1
 set read_active 0
 
 % Je�li niezerowe, a read_active jest zerem, slrn spr�buje u�y� komendy
 % XGTITLE podczas listowania niezapisanych grup
 set use_xgtitle 0
 
 % Co zawija� podczas zawijania artyku�u:
 %  0 lub 4 ==> zawi� cia�o
 %  1 lub 5 ==> zawi� nag��wki, cia�o
 %  2 lub 6 ==> zawi� cytowany tekst, cia�o
 %  3 lub 7 ==> zawi� nag��wki, cytowany tekst, cia�o
 % Wy�sze liczby wskazuj� �e ka�dy artyku� b�dzie zawijany automatycznie
 set wrap_flags 4
 
 % Maksymalna liczba artyku��w, odczytywana do zapytania slrn. Domy�lnie 100.
 % Aby wy��czy� pytanie, wstaw 0
 set query_read_group_cutoff 100
 
 % Liczba linii, odczytywanych od serwera mi�dzy procentowymi od�wie�eniami
 % licznika. Liczba ta b�dzie zale�e� od szybko�ci po��czenia z twoim
 % serwerem
 set lines_per_update 100
 
 %---------------------------------------------------------------------------
 % obs�uga mime
 %---------------------------------------------------------------------------
 set use_mime 1
 set mime_charset "iso-8859-1"
 % jesli niezerowe, wo�aj metamail dla format�w mime, kt�rych slrn nie
 % potrafi obs�u�y�.
 set use_metamail 1
 
 % Je�li niezerowe, w lewym marginesie okna nag��wka b�d� wy�wietlane liczby
 % nag��wk�w. Liczby te mog� by� u�ywane jako ``wybieracze w�tk�w''.
 set use_header_numbers 1
 
 % Je�li niezerowe, pytaj o ponowne po��czenie, je�li padnie NNTP. Je�li
 % zero, pr�ba jest dokonywana bez pytania.
 set query_reconnect 1
 
 % Znak u�ywany do ukrywania spojler�w:
 set spoiler_char '*'
 
 
 %---------------------------------------------------------------------------
 %  Lokalna konfiguracja sk�adowania
 %---------------------------------------------------------------------------
 % set spool_inn_root "/export/opt/inn"
 % set spool_root "/export/news"
 % set spool_nov_root "/export/news"
 %
 %% -- nast�puj�ce nazwy plik�w s� wzgl�dne do spool_root
 %
 % set spool_nov_file ".overview"
 % set spool_active_file "data/active"
 % set spool_activetimes_file "data/active.times"
 % set spool_newsgroups_file "data/newsgroups"
 
 
 %---------------------------------------------------------------------------
 %  Obs�uga GroupLens
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
 % Czarnobia�e atrybuty dla terminali monochromatycznych
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
 
 setkey group	add_group	"A"    %  dodaj now� grup�
 setkey group	bob		"\e<"  %  pocz�tek bufora
 setkey group	bob		"^K\eOA"
 setkey group	bob		"^K\e[A"
 setkey group	catch_up	"C"    %  zaznacz grup� jako przeczytan�
 setkey group	down		"\eOB" %  nast�pna grupa
 setkey group	down		"\e[B"
 setkey group	down		"^N"
 setkey group	eob		"\e>"  %  koniec bufora
 setkey group	eob		"^K\eOB"
 setkey group	eob		"^K\e[B"
 setkey group	group_search_forward	"/"
 setkey group	help		"?"
 setkey group	pagedown	"^D"   %  nast�pna strona grup
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
 setkey group	select_group	"\r"   %  odczytaj artyku�y z grupy
 setkey group	select_group	" "
 setkey group	subscribe	"S"    %  zapisz si� do grupy
 setkey group	suspend		"^Z"
 setkey group	toggle_group_display	"\033A"
 setkey group	toggle_score	"K"
 setkey group	toggle_hidden	"l"
 setkey group	toggle_list_all	"L"
 setkey group	unsubscribe	"U"    %  wypisz si� z grupy
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
 setkey article	scroll_dn	" "	% przewi� do nast�pnej strony artyku�u lub wybierz artyku�
 setkey article	scroll_up	"^?"	% przewi� do nast�pnej stronyartyku�u
 setkey article	scroll_up	"b"	% (scroll_up lub article_pageup)
 setkey article article_lineup	"\e\e[A"	% Przewi� artyku� lini� w g�r�
 setkey article article_lineup	"\e\eOA"
 setkey article article_linedn	"\e\e[B"	% Przewi� artyku� lini� w d�
 setkey article article_linedn	"\e\eOB"
 setkey article	article_linedn	"\r"
 setkey article  article_search	"/"	% Szukaj wprz�d w artykule
 setkey article  author_search_forward	"a"	% Szukaj wprz�d autora
 setkey article  author_search_backward	"A"	% Szukaj wstecz autora
 setkey article  cancel		"\e^C"	% Anuluj artyku�
 setkey article  delete		"d"	% Zaznacz artyku� za przeczytany i przejd� do nast�pnego nieczytanego
 setkey article  down		"^N"	% Przejd� do nast�pnego artyku�u
 setkey article  down		"\e[B"
 setkey article  down		"\eOB"
 setkey article  mark_spot	";"	% Zaznacz artyku�
 setkey article  exchange_mark	","	% Zaznacz artyku� i przejd� do poprzedniego zazanaczenia
 setkey article  followup	"f"	% Followup
 setkey article  forward		"F"	% Forward
 setkey article  help		"?"	% Poka� pomoc
 setkey article  hide_article	"H"	% Uktyj okno artyku�u.
 setkey article  art_eob	">"	% id� na koniec artyku�u
 setkey article  left		"\eOD"
 setkey article  left		"\e[D"
 setkey article  next		"n"	% nast�pny nieczytany artyku�
 setkey article  skip_to_next_group	"N"	% nast�pna grupa
 setkey article  prev		"p"	% poprzedni nieczytany artyku�
 setkey article  quit		"q"	% Wyjd� do trybu wyboru grupy.
 setkey article  redraw		"^L"	% Od�wie� wy�wietlacz
 setkey article  redraw		"^R"
 setkey article  reply		"r"	% odpowiedz do autora artyku�u
 setkey article  art_bob	"<"	% Id� na pocz�tek artyku�u
 setkey article  right		"\e[C"
 setkey article  right		"\eOC"
 setkey article  save		"O"	% Do��cz do pliku w formacie unix mail
 setkey article  subject_search_forward	"s"	% Szukaj wprz�d/wstecz artyku�u o podanym temacie
 setkey article  subject_search_backward	"S"
 setkey article  suspend		"^Z"	% Zawie� czytnik
 setkey article	toggle_rot13	"\eR"
 setkey article	toggle_sort	"\eS"
 setkey article  toggle_headers	"t"	% W��cz/wy�acz wy�wietlanie nag��wk�w
 setkey article  toggle_quotes	"T"
 setkey article  undelete    	"u"	% Zaznacz artyku� jako nieprzeczytany
 setkey article  up		"^P"	% Przejd� do poprzedniego artyku�u
 setkey article  up		"\eOA"
 setkey article  up		"\e[A"
 setkey article	header_bob	"\e<"	% Przejd� do pierwszego artyku�u listy
 setkey article	header_eob	"\e>"	% Przejd� do ostatniego artyku�u listy
 setkey article	shrink_window	"^^"	% Ctrl-6 or Ctrl-^	% Skurcz okno nag��wk�w
 setkey article	enlarge_window	"^"	% Shift-6 or just ^	% Powi�ksz okno nag��wk�w
 
 %setkey article  skip_to_prev_group ""     % Bez domy�lnych wi�za�
 %setkey article  fast_quit          ""     % bez domy�lnych wi�za�
 
 % Oto specjalna przer�bka dla terminali HP by uzyska� strza�ki.
 % S� jeszcze jakie� terminale gdzie nie  ma strza�ek w ANSI?
 #if$TERM hpterm
   setkey group up "\eA"       % "^(ku)"
   setkey group down "\eB"     % "^(kd)"
   setkey article down "\eB"
   setkey article up "\eA"
   setkey article left "\eD"
   setkey article right "\eC"
 #endif
.fi

.SH ZOBACZ TAK�E
environ(5)

Pytania o
.I slrn
mo�na zadawa� na grupie dyskusyjnej
.I news.software.readers
gdzie mo�na uzyska� odpowiedzi od autora programu. Dodatkowo, puszczane s�
tam og�oszenia nowych wersji
.IR slrn .

Ostatnia wersja
.I slrn
jest dost�pna przez anonimowy ftp z
.B space.mit.edu
z pub/davis/slrn.

.SH AUTOR
John E. Davis <davis@space.mit.edu>

.SH PODZI�KOWANIA

(Lista jest niekompletna)

Howard Goldstein <hg@n2wx.ampr.org> - od�wie�anie tego podr�cznika.

Andrew Greer <Andrew.Greer@vuw.ac.nz> - port VMS.

Jay Maynard <jmaynard@admin5.hsc.uth.tmc.edu> - port OS/2.

Michael Elkins <elkins@aero.org> - kod MIME.

Lloyd Zusman <ljz@ingress.com> - udoskonalenia kosmetyczne.

J.B. Nicholson-Owens <jbn@mystery-train.cu-online.com> - intensywne
testowanie.

Mark Olesen <olesen@weber.me.queensu.ca> - wskaz�wki i pomoc w wersji AIX.
