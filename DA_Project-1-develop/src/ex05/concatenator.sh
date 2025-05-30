#!/bin/bash

csv_files=(*.csv)
if [ ${#csv_files[@]} -eq 0 ]; then
  echo "Ошибка: нет CSV-файлов для объединения."
  exit 1
fi

output_file="hh_positions_combined.csv"
header=$(head -n 1 "${csv_files[0]}")
echo "$header" > "$output_file"

for file in "${csv_files[@]}"; do
  tail -n +2 "$file" >> "$output_file"
done

echo "Объединённый файл создан: $output_file"
