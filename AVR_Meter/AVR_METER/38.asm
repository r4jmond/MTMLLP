.MACRO LOAD_CONST
LDI @0, LOW(@2)
LDI @1, HIGH(@2)
.ENDMACRO
.equ Digits_P = PORTB
.equ Segments_P = PORTD

MainLoop:

LDI R16, 5
RCALL DigitTo7segCode

RJMP MainLoop

DelayInMs:
	LOAD_CONST R16, R17, 5
	MOV R25, R17
	MOV R24, R16
	Ms:
		RCALL DelayOneMs
		SBIW R25:R24, 1
	BRNE Ms
RET

DelayOneMs:
	PUSH R25
	PUSH R24
	LOAD_CONST R24, R25, 2000
	OneMs:
		SBIW R25:R24, 1
	BRNE OneMs
	POP R24
	POP R25
RET

DigitTo7segCode:
	PUSH R30
	PUSH R31
	LDI R30, LOW(seg<<1)
	LDI R31, HIGH(seg<<1)
	ADC R30, R16
	LPM R16, Z
	POP R31
	POP R30
RET

seg: .db $3F, $06, $5B, $4F, $66, $6D, $7D, $07, $7F, $6F