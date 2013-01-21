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
echo "Menu v 0.0.1";
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
