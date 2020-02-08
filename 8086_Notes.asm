Progr           segment
                assume  cs:Progr, ds:dane, ss:stosik

start:          mov     ax,dane
                mov     ds,ax
                mov     ax,stosik
                mov     ss,ax
                mov     sp,offset szczyt
JUMPS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                mov ah,62h
                int 21h
                mov es, bx 		; Pobranie adresu PSP (Program Segment Prefix) do BX
                mov bx, 80h		; 80h komórka z iloscia znaków
                mov al, es:[bx]		; Ustawienie ES na adres PSP
                xor cx,cx
                mov cl,al 		; Ilość znaków do CL
                mov bx, 82h 		; 80-ileZnakow 81-spacja 82-zaczynaja sie litery
                dec cx 			; Usuń 'Enter' z końca polecenia

                lea si,plik		; Pobierz adres pamięci przeznaczony na nazwę pliku

wczytaj:
                mov al, es:[bx]		; Wpisujemy znak
                xor ah,ah
                mov [si],ax
                inc bx			; Nast. znak
                inc si			; Nast. pozycja
                loop wczytaj


otworzPlik:				; Spr czy plik istnieje
                mov ah, 3Dh		; Otworz plik
                mov al, 0		; Tryb odczytu pliku
                lea dx, plik		; Sciezka do pliku - nazwa
                int 21h
                jc BladPliku		; CY==1 - blad
                mov uchwyt,ax		; Jezeli jest plik to w AX jest do niego uchwyt

petla:
                mov ah,3fh		; Czytaj z pliku
                mov bx,uchwyt		; Uchwyt
                mov cx,1 		; Ila znaków ma odczytać
                lea dx,Bufor		; Bufor
                int 21h
                mov ax,Bufor
                cmp ax,'K'		; Jesli znak =='K' to koniec
                jz koniec

                			;1 oktawa

                cmp ax, 'z'
                jz pC1
                cmp ax, 'x'
                JZ pD1
                cmp ax, 'c'
                jZ pE1
                cmp ax, 'v'
                jz pF1
                cmp ax, 'b'
                jZ pG1
                cmp ax, 'n'
                jz pA1
                cmp ax, 'm'
                jz pB1

                			;2 oktawa

                cmp ax, 'Z'
                jz pC2
                cmp ax, 'X'
                JZ pD2
                cmp ax, 'C'
                jZ pE2
                cmp ax, 'V'
                jz pF2
                cmp ax, 'B'
                jZ pG2
                cmp ax, 'N'
                jz pA2
                cmp ax, 'M'
                jz pB2

                			;3 oktawa

                cmp ax, 'a'
                jz pC3
                cmp ax, 's'
                JZ pD3
                cmp ax, 'd'
                jZ pE3
                cmp ax, 'f'
                jz pF3
                cmp ax, 'g'
                jZ pG3
                cmp ax, 'h'
                jz pA3
                cmp ax, 'j'
                jz pB3

                			;4 oktawa

                cmp ax, 'A'
                jz pC4
                cmp ax, 'S'
                JZ pD4
                cmp ax, 'D'
                jZ pE4
                cmp ax, 'F'
                jz pF4
                cmp ax, 'G'
                jZ pG4
                cmp ax, 'H'
                jz pA4
                cmp ax, 'J'
                jz pB4

                			;5 oktawa

                cmp ax, 'q'
                jz pC5
                cmp ax, 'w'
                JZ pD5
                cmp ax, 'e'
                jZ pE5
                cmp ax, 'r'
                jz pF5
                cmp ax, 't'
                jZ pG5
                cmp ax, 'y'
                jz pA5
                cmp ax, 'u'
                jz pB5

                			;6 oktawa

                cmp ax, 'Q'
                jz pC6
                cmp ax, 'W'
                JZ pD6
                cmp ax, 'E'
                jZ pE6
                cmp ax, 'R'
                jz pF6
                cmp ax, 'T'
                jZ pG6
                cmp ax, 'Y'
                jz pA6
                cmp ax, 'U'
                jz pB6

                			;7 oktawa

                cmp ax, '1'
                jz pC7
                cmp ax, '2'
                JZ pD7
                cmp ax, '3'
                jZ pE7
                cmp ax,'4'
                jz pF7
                cmp ax, '5'
                jZ pG7
                cmp ax, '6'
                jz pA7
                cmp ax, '7'
                jz pB7
                cmp ax, '0'
                jz p0


                			; 1193000 / f[hz] z materiałów
                      ; 1 wiersz z materialow
pC1:
                mov nuta,36152
                jmp Play
pD1:
                mov nuta,32243
                jmp Play
pE1:
                mov nuta,29098
                jmp Play
pF1:
                mov nuta,27114
                jmp Play
pG1:
                mov nuta,24347
                jmp Play
pA1:
                mov nuta,2150
                jmp Play
pB1:
                mov nuta,19242
                jmp Play

                      ; 2 wiersz z materialow
pC2:
                mov nuta,18354
                jmp Play
pD2:
                mov nuta,16342
                jmp Play
pE2:
                mov nuta,14549
                jmp Play
pF2:
                mov nuta,13713
                jmp Play
pG2:
                mov nuta,12173
                jmp Play
pA2:
                mov nuta,10845
                jmp Play
pB2:
                mov nuta,9699
                jmp Play

                     ; 3 wiersz z materialow
pC3:
                mov nuta,9121
                jmp Play
pD3:
                mov nuta,8126
                jmp Play
pE3:
                mov nuta,7239
                jmp Play
pF3:
                mov nuta,6833
                jmp Play
pG3:
                mov nuta,6087
                jmp Play
pA3:
                mov nuta,5423
                jmp Play
pB3:
                mov nuta,4830
                jmp Play

                      ; 4 wiersz z materialow
pC4:
                mov nuta,4553
                jmp Play
pD4:
                mov nuta,4058
                jmp Play
pE4:
                mov nuta,3615
                jmp Play
pF4:
                mov nuta,3418
                jmp Play
pG4:
                mov nuta,3043
                jmp Play
pA4:
                mov nuta,2711
                jmp Play
pB4:
                mov nuta,2415
                jmp Play

                       ; 5 wiersz z materialow
pC5:
                mov nuta,2281
                jmp Play
pD5:
                mov nuta,2032
                jmp Play
pE5:
                mov nuta,1810
                jmp Play
pF5:
                mov nuta,1709
                jmp Play
pG5:
                mov nuta,1522
                jmp Play
pA5:
                mov nuta,1356
                jmp Play
pB5:
                mov nuta,1207
                jmp Play

                      ; 6 wiersz z materialow
pC6:
                mov nuta,1139
                jmp Play
pD6:
                mov nuta,1015
                jmp Play
pE6:
                mov nuta,904
                jmp Play
pF6:
                mov nuta,854
                jmp Play
pG6:
                mov nuta,761
                jmp Play
pA6:
                mov nuta,678
                jmp Play
pB6:
                mov nuta,604
                jmp Play

                      ; 7 wiersz z materialow
pC7:
                mov nuta,570
                jmp Play
pD7:
                mov nuta,508
                jmp Play
pE7:
                mov nuta,452
                jmp Play
pF7:
                mov nuta,427
                jmp Play
pG7:
                mov nuta,380
                jmp Play
pA7:
                mov nuta,339
                jmp Play
pB7:
                mov nuta,302
                jmp Play

p0:
                mov cx,3		; 30D40H = 200.000 mikrosekund = 0.2s
                mov dx,0D40H		; Opoznienie czasu
                mov ah,86h		; CX:DX - CX=3, DX=0D40
                int 15h
                jmp petla

Play:
                xor ah,ah		; Przygotowanie speakera
                mov al, 10110110b
                out 43h, al
                mov ax,nuta
                out 42h,al		; Prześlij częstotliwość dźwięku (2 bajty - HL)
                mov al,ah		; Nie mozna OUT 42H,ah. Mozna tylko AL i AX
                out 42h,al
                in al,61h 		; Wczytaj zawartosc portu B 8255
                or al, 00000011b	; Ustaw dwa najmlodsze bity na stan wysoki
                out 61h,al		; Odeslij zmieniona zawartosc (Graj nute)
					; Szybkosc gry =  im mniej tym szybciej
                mov cx,4		; 493E0H = 300.000 mikrosekund = 0.3s
                mov dx,93E0H		; Opoznienie czasu
                mov ah,86h		; CX:DX - CX=4, DX=93E0
                int 15h 		; przerwanie do opóżnienia czasu
                and al, 11111100b	; Ustaw dwa najmlodsze bity na stan niski
                out 61h,al		; Wyslij i wylacz speaker
                jmp petla

BladPliku:
                lea dx,blad		; Wczytaj adres tekstu
                mov ah,09h		; I go wypisz
                int 21h
koniec:
              	mov     ah,4ch		; Koniec
                mov	    al,0
                int	    21h

Progr           ends
dane            segment
                plik db 9 dup (0)
                uchwyt dw ?
                Bufor dw ?
                blad db 'Blad!$'
                nuta dw ?
dane            ends
stosik          segment
                dw    100h dup(0)
szczyt          Label word
stosik          ends
end start
