#!bin/bash

if [[ $1 == "--date" ]]; then
  date +"%Y-%m-%d"

elif [[ $1 == "--logs" ]]; then
  if [[ $2 =~ ^[0-9]+$ ]]; then
    for ((i=1; i<=$2; i++)); do
      filename="log$i.txt"
      echo -e "Nazwa pliku: $filename\nNazwa skryptu: $0\nData: $(date)" > $filename
    done
  else
    echo "Nieprawidłowy argument: wymagana liczba plików"
  fi

elif [[ $1 == "--help" ]]; then
  echo "Dostępne opcje:"
  echo "  --date    Wyświetla dzisiejszą datę"
  echo "  --logs    Tworzy automatycznie x plików logx.txt"
  echo "            x - numer pliku od 1 - 100, w każdym pliku wpisuje jego nazwę,"
  echo "            nazwę skryptu który go utworzył i datę"
  echo "            Użycie: skrypt.sh --logs [liczba plików]"
  echo "  --help    Wyświetla tę pomoc"

else
  echo "Nieznana opcja: $1"
  echo "Użyj --help, aby uzyskać pomoc"
fi