#!/bin/bash

if [[ $1 == "--date" || $1 == "-d" ]]; then
  date +"%Y-%m-%d"

elif [[ $1 == "--logs" || $1 == "-l" ]]; then
  if [[ $2 =~ ^[0-9]+$ ]]; then
    for ((i=1; i<=$2; i++)); do
      filename="log$i.txt"
      echo -e "Nazwa pliku: $filename\nNazwa skryptu: $0\nData: $(date)" > $filename
    done
  else
    echo "Nieprawidłowy argument: wymagana liczba plików"
  fi

elif [[ $1 == "--help" || $1 == "-h" ]]; then
  echo "Dostępne opcje:"
  echo "  -d --date    Wyświetla dzisiejszą datę"
  echo "  -l --logs    Tworzy automatycznie x plików logx.txt"
  echo "               x - numer pliku od 1 - 100, w każdym pliku wpisuje jego nazwę,"
  echo "               nazwę skryptu który go utworzył i datę"
  echo "               Użycie: skrypt.sh --logs [liczba plików]"
  echo "  -e --error   Tworzy pliki errorx.txt w katalogu errorx dla x od 1 do liczby plików"
  echo "               Użycie: skrypt.sh --error [liczba plików]"
  echo "  -h --help    Wyświetla tę pomoc"

elif [[ $1 == "--init" ]]; then
  git clone https://github.com/Butterski/lab4-git.git
  #export PATH="$PATH:$(pwd)/lab4-git"

elif [[ $1 == "--error" || $1 == "-e" ]]; then
  if [[ $2 =~ ^[0-9]+$ ]]; then
    for ((i=1; i<=$2; i++)); do
      dir="error$i"
      mkdir -p $dir
      filename="$dir/error$i.txt"
      echo -e "Nazwa pliku: $filename\nNazwa skryptu: $0\nData: $(date)" > $filename
    done
  else
    for ((i=1; i<=100; i++)); do
      dir="error$i"
      mkdir -p $dir
      filename="$dir/error$i.txt"
      echo -e "Nazwa pliku: $filename\nNazwa skryptu: $0\nData: $(date)" > $filename
    done
  fi

else
  echo "Nieznana opcja: $1"
  echo "Użyj --help, aby uzyskać pomoc"
fi
