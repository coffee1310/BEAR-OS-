; bootloader.asm
[bits 16]       ; Указываем, что это 16-битный код
[org 0x7C00]   ; Начальный адрес загрузчика

start:
    mov ah, 0x0E      ; Подготовка для печати символа
    mov al, 'Running BearOS'       ; Печатаем 'B' для индикации
    int 0x10          ; Вызов BIOS для отображения символа

    cli                ; Отключаем прерывания
    jmp 0x1000        ; Переход к ядру (адрес ядра в памяти)

times 510 - ($ - $$) db 0 ; Заполняем до 512 байт
dw 0xAA55                  ; Завершающая сигнатура загрузочного сектора
