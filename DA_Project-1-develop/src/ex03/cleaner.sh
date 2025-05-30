#!/bin/bash

{

  header=$(head -n 1 ../ex02/hh_sorted.csv)

  echo "$header" > hh_positions.csv
  
  tail -n +2 ../ex02/hh_sorted.csv | awk -F',' -v OFS=',' '{
    position = "";

    if ($3 ~ /Junior/) position = position "Junior";
    if ($3 ~ /Middle/) position = (position == "" ? "" : position "/") "Middle";
    if ($3 ~ /Senior/) position = (position == "" ? "" : position "/") "Senior";

    if (position == "") position = "-";
    
    $3 = "\"" position "\"";

    print $0;
  }'
} >> hh_positions.csv

if [ -f hh_positions.csv ]; then
  echo "Файл 'hh_positions.csv' успешно создан."
else
  echo "Ошибка: не удалось создать 'hh_positions.csv'."
  exit 1
fi
