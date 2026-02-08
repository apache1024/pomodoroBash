#!/bin/bash
# Описание: Что делает этот скрипт
# Автор: Имя
# Дата: 26.01.2026

#set -e # Прекратить выполнение при ошибке
#set -u # Прекратить при использовании необъявленных переменных
if [[ $# == 3 ]]; then
    startLine="pomodoro $1 $2 $3"
    echo $startLine
    nohup pomodoro $1 $2 $3 > /dev/null 2>&1 &
  else
    nohup pomodoro > /dev/null 2>&1 &
fi
