#PIERWSZY SKRYPT (multimenu)
#!/bin/bash
OPTS='ahv'
LONGOPTS='author,help,version'
eval set -- $(getopt -o $OPTS --long $LONGOPTS -- $*)
while true; do
case $1 in
-h|--help)
echo -e "\nUzycie: aby uzyc wybranej funkcji wcisnij odpowiedni klawisz"
echo -e "\nDostepne opcje:"
echo -e "\n-a, -author -Wyswietla informacje o autorze"
echo -e "\n-v, -version - Wyswietla informacje na temat wersji"
exit
;;
-a|--author)
echo "@2013 Piotrek Krzyżanowski"
exit
;;
-v|--version)
echo "multimenu v.1.0.2"
exit
;;
*)
echo "Blad. Wybierz $0 -h aby dowiedziec sie wiecej"
exit 1
;;
esac
done

KONIEC="x";
function wybor
{
case $KONIEC in
s) echo "Jesteś w katalogu : $(pwd)" ;;
p) echo "teraz wypisze wszystkie twoje procesy";
ps -e ;;
d) cal -3;;
w) echo "Oto lista plików w tym katalogu";
ls ;;
esac;
}
function menu # menu
{
until [ $KONIEC = k ];do
echo "Wciśnij Enter aby kontynuować";
read;
clear; # czyść ekran
echo;
echo "s - wyświetl ścieżkę w której znajduje się skrypt.";
echo "p - wyświetl listę procesów użytkownika.";
echo "w - wyświetl wszystkie pliki w tym katalogu.";
echo "d - wyswietla dziesiejsza date."
echo "k - zakończ skrypt.";
read KONIEC;
wybor;
done;
}
menu; 


#DRUGI SKRYPT
#!/bin/bash
wej=`zenity --file-selection --title="Wybierz plik do podzielenia"`

  if [ "$?" = 1 ] ; then
		exit 
	fi

wyj=`zenity --file-selection --save --title="Podaj nazwę oraz wybierz miejsce zapisu spakowanych części."`

	if [ "$?" = 1 ] ; then
		exit 
	fi

rozmiar=`zenity --list --text "Wybierz rozmiar podzielonych części:
	50m - dzielone części będą miały rozmiar 50 Mb
	100m - dzielone części będą miały rozmiar 100 Mb
	200m - dzielone części będą miały rozmiar 200 Mb
" --title "Wybór wielkości podzielonych plików" --radiolist --column "" --column "Dostępne rozmiary" FALSE "50m" FALSE "100m" FALSE "200m"` 

	if [ "$?" = 1 ] ; then
		exit 
	fi

kompresja=`zenity --list --title "Wybór bitrate" --text "Wybierz metodę kompresji:

	m0 - kompresja I stopnia (najsłabsza)
	m1 - kompresja II stopna
	m2 - kompresja III stopnia
	m3 - kompresja IV stopnia
	m4 - kompresja V stopnia
	m5 - kompresja VI stopnia (najmocniejsza)" --radiolist --column "" --column "Dostępny metody kompresji" FALSE "m0" FALSE "m1" FALSE "m2" FALSE "m3" FALSE "m4" FALSE "m5"`

	if [ "$?" = 1 ] ; then
	exit 
	fi

rar a "-v $rozmiar" "-$kompresja" "$wyj.rar" "$wej"


#Drugi skrypt wersja light
#!/bin/bash

help="--help"

if [ "$1" = "--help" ]||[ "$1" = "-h" ]
  then
echo ""
echo "Program do dzielenia i pakowania plikow"
echo "wpisz NAZWAPROGRAMU <sciezkaPlikuDoPodzielenia> <SciezkaKoncowa> aby podzielilo"
echo "\n--help/-h  wyswietla ten komunikat"
exit 
  else
  echo ""
fi

if [ "$#" -ne 2 ]
  then
echo "\nPodales zla ilosc parametrow (Wpisz --help/-h aby uzyskac pomoc)"
exit
fi

echo "Podaj rozmiar pojedynczego pliku w megabajtach"
read rozmiar

echo "Podaj moc kompresji (0-5)"
read kompresja

rozmiar="$rozmiar""m"

kompresja="m$kompresja"

#echo "rar a -v $rozmiar -$kompresja $wyj.rar $wej"

rar a "-v $rozmiar" "-$kompresja" "$2.rar" "$1"
