#!/bin/bash

if [ "$1" == "build_generator" ]; then
    echo "Сборка образа генератора"
    docker build -t jedi-generator ./generator

elif [ "$1" == "run_generator" ]; then
    echo "Запуск генератора данных"
    docker run --rm -v "$(pwd)/data:/data" jedi-generator

elif [ "$1" == "create_local_data" ]; then
    echo "Генерирация локальных данных"
    python3 generator/generate.py local_data

elif [ "$1" == "build_reporter" ]; then
    echo "Собираем образ для аналитики"
    docker build -t jedi-reporter ./reporter

elif [ "$1" == "run_reporter" ]; then
    echo "Запуск аналитика данных"
    docker run --rm -v "$(pwd)/data:/data" jedi-reporter

elif [ "$1" == "structure" ]; then
    echo "Структура проекта:"
    find .

elif [ "$1" == "clear_data" ]; then
    echo "Очистка данных"
    rm -rf data/*

elif [ "$1" == "inside_generator" ]; then
    echo "/data в контейнере генератора:"
    docker run --rm -v "$(pwd)/data:/data" jedi-generator ls -la /data

elif [ "$1" == "inside_reporter" ]; then
    echo "/data в контейнере аналитика:"
    docker run --rm -v "$(pwd)/data:/data" jedi-reporter ls -la /data

elif [ "$1" == "report_server" ]; then
    echo "Запуск сервера на порту 8010"
    docker run --rm -p 8010:80 -v "$(pwd)/data/report.html:/usr/share/nginx/html/index.html" nginx
    
 else
     echo "Неизвестная команда: $1"
 fi