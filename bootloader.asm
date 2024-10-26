[BITS 16]
[ORG 0x7C00]

start:
    ; Пример инициализации
    mov ah, 0x0E
    mov al, 'B'       ; Печатает 'B' для индикации
    int 0x10

    ; Переход в защищенный режим и передача управления
    cli               ; Отключаем прерывания
    jmp 0x1000:0x0000        ; Переход к ядру (адрес ядра в памяти)

times 510 - ($ - $$) db 0 ; Заполняем до 512 байт
dw 0xAA55                  ; Завершающая сигнатура загрузочного сектора
