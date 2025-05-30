#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 '<vacancy_name>'"
  exit 1
fi

VACANCY_NAME=${1// /%20}

curl -s "https://api.hh.ru/vacancies?text=$VACANCY_NAME&per_page=20&page=0" | jq '.' > hh.json

echo "Data saved to hh.json"