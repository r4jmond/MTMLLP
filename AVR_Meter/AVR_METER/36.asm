// Program odczytuje 4 bajty z tablicy sta�ych zdefiniowanej w pami�ci kodu do rejestr�w R20...R23
ldi R30, Low(Table<<1) // inicjalizacja rejestru Z
ldi R31, High(Table<<1)
lpm R20, Z // odczyt pierwszej sta�ej z tablicy Table
adiw R31:R30,1 // inkrementacja Z
lpm R21, Z // odczyt drugiej sta�ej
adiw R31:R30,1 // inkrementacja Z
lpm R22, Z // odczyt trzeciej sta�ej
adiw R31:R30,1 // inkrementacja Z
lpm R23, Z // odczyt czwartej sta�ej
nop
Table: .db 0x57, 0x58, 0x59, 0x5A // UWAGA: liczba bajt�w zdeklarowanych w pami�ci kodu musi by� parzysta