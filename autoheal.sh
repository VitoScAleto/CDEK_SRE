#!/bin/bash

LOG_FILE="autoheal.log"
URL="http://localhost:8000/"
INTERVAL=30
COMMAND_RESTART="docker compose restart"

check_service(){
    curl -s -f -o /dev/null "$URL"
}

restart_service() {
    
    if $COMMAND_RESTART; then
        echo "Перезапуск сервиса"
        sleep 5
        if check_service; then
            echo "Сервис перезапущен успешно - $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOG_FILE"
        else
            echo "Не удалось перезапустить сервис - $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOG_FILE"
        fi
    else
        echo "Не удалось выполнить команду" "$COMMAND_RESTART"
    fi
}

main(){

    while true; do
        if check_service; then
            echo ""
        else
            restart_service
        fi


        sleep "$INTERVAL"
        echo "Прошло 30 сек"

    done

}

main  






