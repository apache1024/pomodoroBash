#!/bin/bash
# Описание: Что делает этот скрипт
# Автор: Имя
# Дата: 26.01.2026

#set -e # Прекратить выполнение при ошибке
#set -u # Прекратить при использовании необъявленных переменных

nohup sleep infinity > /dev/null 2>&1 &
sleepPid=$!
#echo "sleep infinity PID = $sleepPid"
echo $sleepPid > $HOME/.pomodoroPausePid
echo `cat $HOME/.pomodoroPausePid |head -1`
