#!/bin/bash

{
  echo '"name","count"'> hh_uniq_positions.csv

  tail -n +2 ../ex03/hh_positions.csv | 
  awk -F',' '{ print $3 }' | sed 's/"//g' |
  sort | 
  uniq -c | 
  sort -nr | 
  awk '{ print "\"" $2 "\",\"" $1 "\"" }' 

} >> hh_uniq_positions.csv


if [ -f hh_uniq_positions.csv ]; then
  echo "Файл 'hh_uniq_positions.csv' успешно создан."
else
  echo "Ошибка: не удалось создать 'hh_uniq_positions.csv'."
  exit 1
fi