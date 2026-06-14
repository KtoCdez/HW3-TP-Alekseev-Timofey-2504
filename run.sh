#!/bin/bash

if [ "$1" == "build_generator" ]; then
    docker build -t jedi-generator ./generator

elif [ "$1" == "run_generator" ]; then
    docker run --rm -v "$(pwd)/data:/data" jedi-generator

elif [ "$1" == "create_local_data" ]; then
    python3 generator/generate.py local_data

elif [ "$1" == "build_reporter" ]; then
    docker build -t jedi-reporter ./reporter

elif [ "$1" == "run_reporter" ]; then
    docker run --rm -v "$(pwd)/data:/data" jedi-reporter

elif [ "$1" == "structure" ]; then
    find .

elif [ "$1" == "clear_data" ]; then
    rm -rf data/*

elif [ "$1" == "inside_generator" ]; then
    docker run --rm -v "$(pwd)/data:/data" jedi-generator ls -la /data

elif [ "$1" == "inside_reporter" ]; then
    docker run --rm -v "$(pwd)/data:/data" jedi-reporter ls -la /data

elif [ "$1" == "report_server" ]; then
    docker run --rm -p 8010:80 -v "$(pwd)/data/report.html:/usr/share/nginx/html/index.html" nginx
    
 else
     echo "Неизвестная команда: $1"
 fi