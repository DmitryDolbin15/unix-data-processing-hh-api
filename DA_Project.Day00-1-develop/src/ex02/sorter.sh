#!/bin/bash

header=$(head -n 1 ../ex01/hh.csv)

tail -n +2 ../ex01/hh.csv | sort -t ',' -k2,2 | sort -t ',' -k1,1 > hh_sorted_temp.csv

echo "$header" > hh_sorted.csv
cat hh_sorted_temp.csv >> hh_sorted.csv

rm hh_sorted_temp.csv

echo "Файл hh_sorted.csv успешно создан."