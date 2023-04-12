#!bin/bash

if [[ $1 == "--date" ]]; then
  date +"%Y-%m-%d"

elif [[ $1 == "--logs" ]]; then
  if [[ $2 =~ ^[0-100]+$ ]]; then
    for ((i=1; i<=$2; i++)); do
      filename="log$i.txt"
      echo -e "Nazwa pliku: $filename\nNazwa skryptu: $0\nData: $(date)" > $filename
    done
  else
    echo "Nieprawidłowy argument: wymagana liczba plików"
fi
fi