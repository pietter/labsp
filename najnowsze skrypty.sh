#!/bin/bash
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
