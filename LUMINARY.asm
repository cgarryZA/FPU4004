JUN STRT
SQRT
    CLC

    ;store input in RAM
    LDM 2
    DCL

    FIM 0 0
    SRC 0
    LD 4
    WRM
    FIM 0 1
    SRC 0
    LD 5
    WRM
    LD 6
    WR0
    LD 7
    WR1

    ;initialise Counter
    FIM 0 4
    SRC 0
    LD 15
    WRM

    ;initialise guess
    LDM 8
    XCH 12
    LDM 0
    XCH 13
    LDM 3
    XCH 14
    LDM 14
    XCH 15

    ;store ans in RAM
    FIM 0 2
    SRC 0
    LD 12
    WRM
    FIM 0 3
    SRC 0
    LD 13
    WRM
    LD 14
    WR2
    LD 15
    WR3

    SQYh45
    ;move ans into place for multiply
    LD 12
    XCH 4
    LD 13
    XCH 5
    LD 14
    XCH 6
    LD 15
    XCH 7

    LD 12
    XCH 8
    LD 13
    XCH 9
    LD 14
    XCH 10
    LD 15
    XCH 11

    JMS MULT
    ;2A6
    ;Move Result to working
    LD 12
    XCH 8
    LD 13
    XCH 9
    LD 14
    XCH 10
    LD 15
    XCH 11

    ;Load Input
    LDM 2
    DCL

    FIM 0 0
    SRC 0
    RDM
    XCH 4

    FIM 0 1
    SRC 0
    RDM
    XCH 5

    RD0
    XCH 6

    RD1
    XCH 7

    ;Divide input exponent by 2
    ;Remove Bias
    CLC
    LDM 15
    XCH 3
    LD 7
    SUB 3
    XCH 7
    CMC

    LDM 3
    XCH 2
    LD 6
    SUB 2
    XCH 6

    CLC
    LD 6
    RAR
    XCH 6

    LD 7
    RAR
    XCH 7

    FIM 0 5
    SRC 0
    LD 6
    WRM

    INC 1
    SRC 0
    LD 7
    WRM

    LD 3
    XCH 7

    LD 2
    XCH 6

    JCN 2 d2a2df
    ;if carry = 0
        ISZ 7 jbbwu
            INC 6
        jbbwu
    d2a2df

    ;2F3
    JMS MULT

    ;Move Result
    LD 12
    XCH 4
    LD 13
    XCH 5
    ;Flip Sign
    LD 14
    CLC
    RAL
    CMC
    RAR
    XCH 6
    LD 15
    XCH 7

    ;Load 3/2
    LDM 12
    XCH 8
    LDM 0
    XCH 9
    LDM 3
    XCH 10
    LDM 15
    XCH 11

    JMS ARITH

    ;Move Result
    LD 12
    XCH 4
    LD 13
    XCH 5
    LD 14
    XCH 6
    LD 15
    XCH 7

    ;Load Ans from RAM
    LDM 2
    DCL
    FIM 0 2
    SRC 0
    RDM
    XCH 8
    FIM 0 3
    SRC 0
    RDM
    XCH 9
    RD2
    XCH 10
    RD3
    XCH 11

    JMS MULT

    ;store answer in RAM
    FIM 0 2
    SRC 0
    LD 12
    WRM
    FIM 0 3
    SRC 0
    LD 13
    WRM
    LD 14
    WR2
    LD 15
    WR3

    ;loop
    ;Load Counter
    FIM 0 4
    SRC 0
    RDM

    JCN 4 ij2j2
        DAC
        WRM
        JUN SQYh45
    ij2j2

    ;Load Answer
    LD 12
    XCH 8
    LD 13
    XCH 9
    LD 14
    XCH 10
    LD 15
    XCH 11

    ;Load Input

    FIM 0 0
    SRC 0
    RDM
    XCH 4

    FIM 0 1
    SRC 0
    RDM
    XCH 5

    RD0
    XCH 6

    RD1
    XCH 7

    ;Divide input exponent by 2
    ;Remove Bias
    CLC
    LDM 15
    XCH 3
    LD 7
    SUB 3
    XCH 7
    CMC

    LDM 3
    XCH 2
    LD 6
    SUB 2
    XCH 6

    CLC
    LD 6
    RAR
    XCH 6

    LD 7
    RAR
    XCH 7
    JCN 10 n3j1j3
    ;Carry from 7
        ISZ 3 n3j1j3
            INC 2
    n3j1j3

    LD 3
    XCH 7

    LD 2
    XCH 6

    JMS MULT

    ;Load Answer
    LD 12
    XCH 8
    LD 13
    XCH 9
    LD 14
    XCH 10
    LD 15
    XCH 11

    LDM 8
    XCH 4
    LDM 0
    XCH 5

    FIM 0 5
    SRC 0
    RDM
    XCH 6

    INC 1
    SRC 0
    RDM
    XCH 7

    LDM 15
    XCH 1
    LDM 3
    XCH 0

    LD 7
    ADD 1
    XCH 7

    LD 6
    ADD 0
    XCH 6

    JMS MULT
BBL 0

SIGNBITS
    ;Load Sign bit 1
    CLC
    LD 6
    RAL
    TCC
    XCH 2
    LD 6
    RAL
    CLC
    RAR
    XCH 6

    ;Load Sign Bit 2
    CLC
    LD 10
    RAL
    TCC
    XCH 3
    LD 10
    RAL
    CLC
    RAR
    XCH 10
BBL 0

NORM
    ;Remove Sign Bit
    LD 14
    RAL
    TCC
    XCH 3
    LD 14
    RAL
    CLC
    RAR
    XCH 14
    N1ORM
        ;Check if the most significant bit is 1
        LD 12
        CLC
        RAR
        CLC
        RAR
        CLC
        RAR
        JCN 4 N2ORM
        ;If it is then it is normalised
        JUN N3ORM
    N2ORM
        ;If it isn't shift mantissa left 1
        CLC
        LD 13
        RAL
        XCH 13
        LD 12
        RAL
        XCH 12
        CLC
        LD 15
        JCN 12 N4ORM
        ;if 15 is zero
            DAC
            CLC
            XCH 15
            LD 14
            DAC
            XCH 14
            JUN N3ORM
        N4ORM
        ;if 15 isn't zero
            DAC
            XCH 15
            JUN N1ORM
    N3ORM
    ;Add Sign Bit
    CLC
    LD 3
    RAL
    RAL
    RAL
    ADD 14
    XCH 14
BBL 0

MULT

    CLC
    ; Set Result to 0
    FIM 6 0

    JMS SIGNBITS

    ;Add exponents
    LD 7
    ADD 11
    XCH 15
    LD 6
    ADD 10
    XCH 14

    ;Subtract bias
    CLC
    LDM 15
    XCH 0
    LD 15
    SUB 0
    XCH 15
    CMC
    LDM 3
    XCH 0
    LD 14
    SUB 0
    XCH 14
    CLC

    ;Get Result Sign
    LD 2
    ADD 3
    RAL
    RAL
    RAL
    CLC
    ADD 14
    XCH 14

    FIM 0 0
    FIM 1 0

    BCHECK
    ;Check if B is zero
    LD 8
    JCN 12 aodiq
        LD 9
        JCN 12 aodiq
            JUN RETURN
    aodiq

    ; Rotate B right
    CLC
    LD 8
    RAR
    XCH 8
    LD 9
    RAR
    XCH 9
    ; if least sig bit is 1 add A to Result
    JCN 10 ao2jdj
        CLC
        LD 13
        ADD 5
        XCH 13

        LD 12
        ADD 4
        XCH 12

        LD 3
        ADD 1
        XCH 3

        LD 2
        ADD 0
        XCH 2
    ao2jdj

    ; Rotate A left
    CLC
    LD 5
    RAL
    XCH 5
    LD 4
    RAL
    XCH 4
    RAL
    LD 1
    RAL
    XCH 1
    LD 0
    RAL
    XCH 0

    JUN BCHECK

    RETURN

    LD 2
    RAL
    JCN 10 ifgn11
    ;IF Carry
        ISZ 15 ifgn11
            INC 14
    ifgn11

    Rn1n

    LD 2
    JCN 12 jf2j2
        LD 3
        JCN 12 jf2j2
            JUN MULTEND
    jf2j2

    LD 2
    RAR
    XCH 2
    LD 3
    RAR
    XCH 3
    LD 12
    RAR
    XCH 12
    LD 13
    RAR
    XCH 13
    CLC
    JUN Rn1n

    MULTEND
BBL 0

ARITH

    ;Extract Sign Bits
    JMS SIGNBITS

    ; Normalise exponent and shift mantissa
    ; Calculate Exponent Difference
        CLC
        LD 6
        SUB 10
        JCN 12 A32RITH
            JUN A1RITH
        A32RITH
        ; if E1 LOW != E2 LOW
            JCN 2 A2RITH
            ; EXP2_Low > EXP1_Low
                CLC
                LD 10
                SUB 6
                XCH 14
                LDM 0
                XCH 0
                JUN A3RITH
            A2RITH
            ; EXP1_Low > EXP2_Low
                XCH 14
                LDM 1
                XCH 0
            A3RITH
            CLC
            LD 0
            JCN 12 A4RITH
            ;R0 = AZ
            ;EXP2_High > EXP1_High
                LD 11
                SUB 7
                XCH 15
                CMC
                LD 10
                SUB 6
                XCH 14
                LD 8
                XCH 12
                LD 9
                XCH 13
                JUN A5RITH
            A4RITH
            ;R0 = AN
            ;EXP1_High > EXP2_High
                LD 7
                SUB 11
                XCH 15
                CMC
                LD 6
                SUB 10
                XCH 14
                LD 4
                XCH 12
                LD 5
                XCH 13
            A5RITH
            JUN A6RITH
        A1RITH
        ;if E1 LOW = E2 LOW
            XCH 14
            CMC
            LD 7
            SUB 11
            JCN 2 A7RITH
            ;EXP2_High > EXP1_High
                LD 11
                SUB 7
                XCH 15
                LD 4
                XCH 12
                LD 5
                XCH 13
                LDM 0
                XCH 0
                JUN A6RITH
            A7RITH
            ;EXP1_High > EXP2_High
                XCH 15
                LD 8
                XCH 12
                LD 9
                XCH 13
                LDM 1
                XCH 0
    A6RITH

    ;Check if Mantissa Needs Shifting
        LD 14
        JCN 12 A8RITH
        ;dEXP_High = AZ
            LD 15
            JCN 12 A8RITH
            ; dEXP_Low = AZ
                JUN A10RITH
    A8RITH

    ;Adjust Smaller Exponent
        CLC
        LD 0
        JCN 12 A11RITH
        ;R0 = AZ
            LD 7
            ADD 15
            XCH 7
            LD 6
            ADD 14
            XCH 6
            CLC
            JUN A12RITH
        A11RITH
        ;R0 = AN
            LD 11
            ADD 15
            XCH 11
            LD 10
            ADD 14
            XCH 10
            CLC
    A12RITH

    ;Shift Mantissa
        A13RITH
        ;Loop Until dEXP = 0
            LD 15
            DAC
            JCN 2 A14RITH
            ;R15 was AZ
                LD 14
                JCN 4 A10RITH
                ;R14 = AN
                    CLC
                    DAC
                    XCH 14
                    LD 15
                    DAC
                    XCH 15
                    JUN A15RITH
            A14RITH
            ;R15 was AN
                XCH 15

        ;Shift Mantissa Right
        A15RITH
            CLC
            LD 12
            RAR
            XCH 12
            LD 13
            RAR
            XCH 13
            JUN A13RITH
        A10RITH

        ;Store Adjusted Mantissa in Working
            LD 0
            JCN 12 A16RITH
            ;R0 = AZ
                LD 12
                XCH 4
                LD 13
                XCH 5
                JUN A17RITH
            A16RITH
            ;R0 = AN
                LD 12
                XCH 8
                LD 13
                XCH 9
        A17RITH

    ;Check Signs
        CLC
        LD 2
        SUB 3
        JCN 4 A18RITH
        ;S1 != S2
            JUN A19RITH
        A18RITH
        ;S1 = S2
        ; Load Either Exponent
            LD 7
            XCH 15
            ; Add Sign Bit
            LD 2
            CLC
            RAL
            RAL
            RAL
            ADD 6
            XCH 14

        ;Add Mantissas
                CLC
                LD 5
                ADD 9
                XCH 13
                LD 4
                ADD 8
                XCH 12
                JCN 10 A21RITH
                ;Carry
                    LD 12
                    RAR
                    XCH 12
                    LD 13
                    RAR
                    XCH 13
                    ISZ 15 A21RITH
                        INC 14
            A21RITH
            JUN A31RITH
    A19RITH
    ;S1 != S2
    ;Subtract Smaller M from Bigger
        CLC
        LD 5
        SUB 9
        CMC
        LD 4
        SUB 8
        JCN 12 A33RITH
            CLC
            LD 5
            SUB 9
            JCN 12 A33RITH
                LDM 0
                XCH 12
                LDM 0
                XCH 13
                LDM 3
                XCH 14
                LDM 15
                XCH 15
                JUN jvci1
        A33RITH
        CLC
        LD 4
        SUB 8
        JCN 2 A30RITH
            JUN A23RITH
        A30RITH
        ;M1 > M2
            ;Load EXP1
            LD 7
            XCH 15
            ;Load SIGN1
            LD 2
            CLC
            RAL
            RAL
            RAL
            ADD 6
            XCH 14
            CLC

            ;M1 - M2
            LD 5
            SUB 9
            XCH 13
            CMC
            LD 4
            SUB 8
            XCH 12
            JUN A22RITH
        A23RITH
        ;M2 > M1
            ;EXP2
            LD 11
            XCH 15
            ;Add SIGN2
            LD 3
            CLC
            RAL
            RAL
            RAL
            ADD 10
            XCH 14

            ;M2-M1
            LD 9
            SUB 5
            XCH 13
            CMC
            LD 8
            SUB 4
            XCH 12
    A22RITH
        JMS NORM
    A31RITH
    LD 13
    JCN 12 jvci1
        LD 12
        JCN 12 jvci1
            LDM 8
            XCH 12
    jvci1
    CLC

    JMS NORM
BBL 0

DIV

    JMS SIGNBITS

    ;Add Signs
    LD 2
    ADD 3
    RAL
    RAL
    RAL
    CLC
    XCH 0

    ;Subtract Exponents
    LD 7
    SUB 11
    XCH 15
    CMC
    LD 6
    SUB 10
    XCH 14

    ;Add Bias
    CLC
    LDM 15
    ADD 15
    XCH 15
    LDM 3
    ADD 14
    XCH 14
    CLC

    ;Load Sign Bit
    LD 0
    ADD 14
    XCH 14

    LD 4
    XCH 0
    LD 5
    XCH 1
    LDM 0
    XCH 4
    LDM 0
    XCH 5

    LD 8
    XCH 6
    LD 9
    XCH 7
    LDM 0
    XCH 8
    LDM 0
    XCH 9

    LDM 0
    XCH 2
    LDM 0
    XCH 3
    LDM 0
    XCH 12
    LDM 0
    XCH 13

    ;Do Division
    LDM 7
    XCH 10
    D9IV
    LD 10
    JCN 4 D10IV
    ;Looped 7x
        CLC
        LD 5
        SUB 9
        CMC
        LD 4
        SUB 8
        CMC
        LD 1
        SUB 7
        CMC
        LD 0
        SUB 6
        JCN 10 D12IV
            LD 5
            SUB 9
            XCH 5
            CMC
            LD 4
            SUB 8
            XCH 4
            CMC
            LD 1
            SUB 7
            XCH 1
            CMC
            LD 0
            SUB 6
            XCH 0
            CLC
            ;Increment Answer Mantissa
            ISZ 13 D13IV
                INC 12
            D13IV
        D12IV

        ;Rotate Divisor Right
        CLC
        LD 6
        RAR
        XCH 6
        LD 7
        RAR
        XCH 7
        LD 8
        RAR
        XCH 8
        LD 9
        RAR
        XCH 9
        CLC

        ;Rotate Result Left
        CLC
        LD 13
        RAL
        XCH 13
        LD 12
        RAL
        XCH 12
        LD 3
        RAL
        XCH 3
        LD 2
        RAL
        XCH 2

        ;Decrement Counter
        LD 10
        DAC
        XCH 10
        CLC
        JUN D9IV
    D10IV

    v1b341

    LD 2
    JCN 12 g521123
        LD 3
        JCN 12 g521123
            JUN DIVEND
    g521123

    LD 2
    RAR
    XCH 2
    LD 3
    RAR
    XCH 3
    LD 12
    RAR
    XCH 12
    LD 13
    RAR
    XCH 13
    CLC
    JUN v1b341

    DIVEND

    JMS NORM
BBL 0

STRT
    LDM 12
    XCH 8
    LDM 3
    XCH 9
    LDM 4
    XCH 10
    LDM 15
    XCH 11

    LDM 13
    XCH 4
    LDM 4
    XCH 5
    LDM 5
    XCH 6
    LDM 3
    XCH 7

    JMS ARITH

    LD 12
    XCH 8
    LD 13
    XCH 9
    LD 14
    XCH 10
    LD 15
    XCH 11

    LDM 0
    DCL
    FIM 0 2
    SRC 0
    LD 8
    WRM
    INC 1
    SRC 0
    LD 9
    WRM
    LD 10
    WR1
    LD 11
    WR2

        LDM 8
    XCH 4
        LDM 14
    XCH 5
        LDM 6
    XCH 6
        LDM 9
    XCH 7

    JMS DIV

    LD 12
    XCH 4
    LD 13
    XCH 5
    LD 14
    XCH 6
    LD 15
    XCH 7

    ;SQRT Iterations
    LDM 2
    XCH 15

    JMS SQRT

    LD 12
    XCH 4
    LD 13
    XCH 5
    LD 14
    XCH 6
    LD 15
    XCH 7

    LDM 12
    XCH 8
    LDM 8
    XCH 9
    LDM 12
    XCH 10
    LDM 5
    XCH 11

    JMS ARITH

    LDM 0
    DCL
    FIM 0 4
    SRC 0
    LD 12
    WRM
    INC 1
    SRC 0
    LD 13
    WRM
    INC 1
    SRC 0
    LD 14
    WRM
    INC 1
    SRC 0
    LD 15
    WRM

Loop1
    CLC
    LDM 13
    XCH 8
    LDM 4
    XCH 9
    LDM 13
    XCH 10
    LDM 3
    XCH 11

    LDM 0
    DCL
    FIM 0 2
    SRC 0
    RDM
    XCH 4
    INC 1
    SRC 0
    RDM
    XCH 5
    RD1
    XCH 6
    RD2
    XCH 7

    JMS ARITH

    LD 14
    RAL
    JCN 10 N2c2
    JUN END
    N2c2

    LDM 0
    DCL
    FIM 0 2
    SRC 0
    RDM
    XCH 4
    LD 4
    XCH 8
    INC 1
    SRC 0
    RDM
    XCH 5
    LD 5
    XCH 9

    RD1
    XCH 6
    LD 6
    XCH 10

    RD2
    XCH 7
    LD 7
    XCH 11

    JMS MULT

    LDM 0
    DCL
    LD 12
    XCH 8
    LD 13
    XCH 9
    LD 14
    XCH 10
    LD 15
    XCH 11

    LDM 8
    XCH 4
    LDM 14
    XCH 5
    LDM 14
    XCH 6
    LDM 9
    XCH 7

    JMS DIV

    LDM 0
    DCL
    FIM 0 0
    SRC 0
    LD 12
    WRM
    INC 1
    SRC 0
    LD 13
    WRM
    LD 14
    WR0
    LD 15
    WR1
    INC 1
    INC 1
    INC 1
    SRC 0
    RDM
    XCH 4
    INC 1
    SRC 0
    RDM
    XCH 5
    INC 1
    SRC 0
    RDM
    XCH 6
    INC 1
    SRC 0
    RDM
    XCH 7

    LD 12
    XCH 8
    LD 13
    XCH 9
    LD 14
    XCH 10
    LD 15
    XCH 11

    JMS ARITH

    LDM 0
    DCL
    FIM 0 4
    SRC 0
    LD 12
    WRM
    INC 1
    SRC 0
    LD 13
    WRM
    INC 1
    SRC 0
    LD 14
    WRM
    INC 1
    SRC 0
    LD 15
    WRM

    FIM 0 2
    SRC 0
    RDM
    XCH 4
    INC 1
    SRC 0
    RDM
    XCH 5
    RD2
    XCH 6
    RD3
    XCH 7

    LD 12
    XCH 8
    LD 13
    XCH 9
    LD 14
    RAL
    CMC
    RAR
    XCH 10
    LD 15
    XCH 11

    JMS ARITH

    LDM 0
    DCL
    FIM 0 2
    SRC 0
    LD 12
    WRM
    INC 1
    SRC 0
    LD 13
    WRM
    LD 14
    WR2
    LD 15
    WR3

    JUN Loop1
EndLoop1
END NOP
