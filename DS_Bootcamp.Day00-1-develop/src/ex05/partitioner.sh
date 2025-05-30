#!/bin/bash

header=$(head -n 1 ../ex03/hh_positions.csv)


tail -n +2 ../ex03/hh_positions.csv | while IFS=, read -r id created_at name has_test alternate_url ; do
  
  date=$(echo "$created_at" | sed 's/"//g'| cut -d'T' -f1)
  
  if [ ! -f "$date.csv" ]; then
    echo "$header" > "$date.csv"
  fi
 
  echo "$id,$created_at,$name,$has_test,$alternate_url" >> "$date.csv"
done

echo "Файлы созданы по датам."