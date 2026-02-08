#!/bin/bash
# Описание:
sinopsis="Скрипт снимает паузу после окончание времени таймера паузы\n
путием выполнения операции kill -s 5 \$PID\n
PID записывается в файл \$HOME/.pomodoroPausePid, после сняния этого процесса скрипт pomodoro продолжает работать "

# Автор: Имя
# Дата: 26.01.2026

set -e # Прекратить выполнение при ошибке
set -u # Прекратить при использовании необъявленных переменных
value=""
try=""
# Код скрипта

extract_value_pid(){
  value=`cat $HOME/.pomodoroPausePid |head -1`
  if [[ $value =~ ^[0-9]{1,7}$ ]]; then
    return 0
    else
      exit 1
  fi
}

try_pid(){
  try=`ps -e |grep $value|awk '{print $1}'`
  if [[ $value == $try ]]; then
    return 0
    else
      echo "Процесс $value не найден"
      exit 1
  fi
  return 0
}

kill_pid(){
  kill -s 5 $value && return 0
  echo "Что то пошло не так" && exit 1
}

# Функция main содержит основную логику скрипта
main() {
  extract_value_pid
  try_pid
  kill_pid
  exit 0

}

# Вызов функции main с передачей всех аргументов скрипта
main "$@"
