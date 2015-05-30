MatrixPermutations 1.0
==================
Data wydania stabilnej wersji: 02-02-2014

(C) Copyright 2013 Bartłomiej Żuber <bajtas@gmail.com>

Program, którego dokumentację w tej chwili czytasz, służy do generowania specjalnych permutacji macierzy kwadratowych. 
Pisząc specjalne mam na myśli permutacje, w której jest jedynie jedna wybrana liczba w danym wierszu i kolumnie. Tak, wiem, dość zawiłe sformułowanie ;)
Obrazowo będzie to wyglądać w ten sposób:
Macierz wejściowa:

[ 5 3 4 ]
[ 1 2 3 ]
[ 4 2 1 ]

Przykładowe permutacje:
I. 
	[ 5 0 0 ]			[ 0 3 0 ]		[ 0 0 4 ]
	[ 0 2 0 ]			[ 1 0 0 ]		[ 1 0 0 ]
	[ 0 0 1 ]			[ 0 0 1 ]		[ 0 2 0 ]
	
itd..
	
	Permutacji dla macierzy NxN(kwadratowej) jest N! 

Z powodu szybko rosnącej złożoności  program generuje macierze dla maksymalnego rozmiaru macierzy wejściowej tj. 10x10.

# Manual:
Po kliknięciu przycisku "losuj" zostanie wylosowana dowolna macierz kwadratowa z dowolnymi wartościami.
W przypadku wczytania macierzy z dysku, plik w którym zawarte są dane musi mieć rozszerzenie '*.txt', 
w przypadku nie pełnej macierzy, program wyświetli komunikat o brakach danych w danych komórkach macierzy.
Jeżeli użytkownik naciśnie 'kontynuuj' po wyświetleniu monitu o błędnych (lub braku) wartości w macierzy, program nadpisze pustę miejsca losowymi danymi.

Uwaga, ze względu na szybko rosnącą ilość permutacji(n!), potrzeba około 4 GB miejsca na dysku aby wygenerować permutacje dla macierzy 10x10, a następnie zapisać plik na dysku twardym.

*Lista zmian:*
* 1.0(wersja stabilna) - Ostatnie poprawki dotyczące algorytmu permutacji oraz systemu rezerwujacego pamięć.
* 0.98 - Dopisanie informacji o autorze.
* 0.95 - Drobne poprawki algorytmu wczytującego dane.
* 0.92 - Poprawki związane z rezerwacją pamięci.
* 0.90 - Drobne poprawki.
* 0.87 - Usuwanie błędów związanych z rezerwacją pamięci.
* 0.83b - Poprawki gui warstwy wprowadzania danych.
* 0.83a - Stworzenie interfejsu graficznego dla warstwy wprowadzania danych.
* 0.81 - Implementacja algorytmu wczytującego dane.
* 0.72 - Zmiana rozmiaru okna aplikacji.
* 0.71a - Implementacja algorytmu losującego macierz.
* 0.71 - Drobne poprawki.
* 0.68 - Ostatnie poprawki związane z algorytmem permutacji.
* 0.55 - Usprawnienie zarządzania pamięcią.
* 0.48 - Modyfikacja algorytmu permutacji.
* 0.38 - Wstępna implementacja algorytmu permutacji.
* 0.33 - Dodanie standardowego tła aplikacji.
* 0.32 - Zmiana i poprawki interfejsu graficznego.
* 0.29 - Dodanie możliwości zmiany kolorów oraz możliwości wczytania niestandardowego tła aplikacji.
* 0.28 - Drobne poprawki.
* 0.25 - Zmiana sposobu wyswietlania danych w zapisanym pliku.
* 0.20 - Poprawki w funkcjonowaniu interfejsu graficznego.
* 0.12 - Implementacja przycisku "zapisz na dysku".
* 0.07 - Poprawki związane z algorytmem do wczytywania danych.
* 0.03 - Implementacja algorytmu wczytującego dane z plików '*.txt'.
* 0.01 - Stworzenie prostego interfejsu graficznego.
