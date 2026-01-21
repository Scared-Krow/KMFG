[Command]
name = "recovery"
command = /x
time = 1
buffer.time = 1
[Command]
name = "recovery"
command = /a
time = 1
buffer.time = 1
[Command]
name = "recovery"
command = /y
time = 1
buffer.time = 1
[Command]
name = "recovery"
command = /b
time = 1
buffer.time = 1

[Command]
name = "TagShiftBack"
command = d
time = 1
buffer.time = 1

[Command]
name = "TagShiftFwd"
command = w
time = 1
buffer.time = 1

[Command]
name = "x"
command = x
time = 1
buffer.time = 5
[Command]
name = "y"
command = y
time = 1
buffer.time = 5
[Command]
name = "z"
command = z
time = 1
buffer.time = 5
[Command]
name = "a"
command = a
time = 1
buffer.time = 5
[Command]
name = "b"
command = b
time = 1
buffer.time = 5
[Command]
name = "c"
command = c
time = 1
buffer.time = 5
[Command]
name = "start"
command = s
time = 1
buffer.time = 1
[Command]
name = "d"
command = d
time = 1
buffer.time = 5
[Command]
name = "w"
command = w
time = 1
buffer.time = 5

[Command]
name = "xNB"
command = x
time = 1
buffer.time = 1
[Command]
name = "yNB"
command = y
time = 1
buffer.time = 1
[Command]
name = "zNB"
command = z
time = 1
buffer.time = 1
[Command]
name = "aNB"
command = a
time = 1
buffer.time = 1
[Command]
name = "bNB"
command = b
time = 1
buffer.time = 1
[Command]
name = "cNB"
command = c
time = 1
buffer.time = 1
[Command]
name = "start"
command = s
time = 1
buffer.time = 1
[Command]
name = "dNB"
command = d
time = 1
buffer.time = 1
[Command]
name = "wNB"
command = w
time = 1
buffer.time = 1

[Command]
name = "2Buttons"
command = x + a
time = 1
buffer.time = 1
[Command]
name = "2Buttons"
command = x + y
time = 1
buffer.time = 1
[Command]
name = "2Buttons"
command = x + b
time = 1
buffer.time = 1
[Command]
name = "2Buttons"
command = a + y
time = 1
buffer.time = 1
[Command]
name = "2Buttons"
command = a + b
time = 1
buffer.time = 1
[Command]
name = "2Buttons"
command = y + b
time = 1
buffer.time = 1

[Command]
name = "menu"
command = m
time = 1
buffer.time = 1

[Command]
name = "fwd"
command = $F
time = 1
[Command]
name = "back"
command = $B
time = 1
[Command]
name = "up"
command = $U
time = 1
[Command]
name = "down"
command = $D
time = 1


[Command]
name = "holdfwdB"
command = /$F
time = 1
buffer.time = 0
[Command]
name = "holdbackB"
command = /$B
time = 1
buffer.time = 0
[Command]
name = "holdupB"
command = /$U
time = 1
buffer.time = 0
[Command]
name = "holddownB"
command = /$D
time = 1
buffer.time = 0

[Command]
name = "holdfwd"
command = /$F
time = 1
[Command]
name = "holdback"
command = /$B
time = 1
[Command]
name = "holdup"
command = /$U
time = 1
[Command]
name = "holddown"
command = /$D
time = 1

[Command]
name = "holdx"
command = /x
time = 1
buffer.time = 0
[Command]
name = "holda"
command = /a
time = 1
buffer.time = 0
[Command]
name = "holdy"
command = /y
time = 1
buffer.time = 0
[Command]
name = "holdb"
command = /b
time = 1
buffer.time = 0
[Command]
name = "holdz"
command = /z
time = 1
buffer.time = 0
[Command]
name = "holdc"
command = /c
time = 1
buffer.time = 0
[Command]
name = "holdd"
command = /d
time = 1
buffer.time = 0
[Command]
name = "holdw"
command = /w
time = 1
buffer.time = 0

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     
command = F, F
time = 12
buffer.time = 8

[Command]
name = "FADash"     
command = ~$F, >F
time = 8
buffer.time = 8

[Command]
name = "BB"     
command = B, B
time = 12
buffer.time = 8

[Command]
name = "BADash"     
command = ~$B, >B
time = 8
buffer.time = 8

[Command]
name = "22"    
command = ~D, D
time = 12
buffer.time = 6

[Command]
name = "28"    
command = ~$D, $U
time = 4
buffer.time = 0


;-SUPER INPUTS-

[Command]
name = "6246A"
command = ~F, $D, $B, $F, x
time = 25
buffer.time = 5

[Command]
name = "6246B"
command = ~F, $D, $B, $F, a
time = 25
buffer.time = 5

[Command]
name = "6246C"
command = ~F, $D, $B, $F, y
time = 25
buffer.time = 5

[Command]
name = "6246D"
command = ~F, $D, $B, $F, b
time = 25
buffer.time = 5

[Command]
name = "236236A"
command = ~D, $F, D, $F, x

[Command]
name = "236236B"
command = ~D, $F, D, $F, a

[Command]
name = "236236C"
command = ~D, $F, D, $F, y

[Command]
name = "236236D"
command = ~D, $F, D, $F, b

[Command]
name = "214214A"
command = ~D, $B, D, $B, x

[Command]
name = "214214B"
command = ~D, $B, D, $B, a

[Command]
name = "214214C"
command = ~D, $B, D, $B, y

[Command]
name = "214214D"
command = ~D, $B, D, $B, b

;-NORMAL INPUTS-

[Command]
name = "214A"
command = ~D, B,  x
buffer.shared = 1

[Command]
name = "214B"
command = ~D, B,  a
buffer.shared = 1

[Command]
name = "214C"
command = ~D, B,  y
buffer.shared = 1

[Command]
name = "214D"
command = ~D, B,  b
buffer.shared = 1

[Command]
name = "236A"
command = ~D, F,  x
buffer.shared = 1

[Command]
name = "236B"
command = ~D, F, a
buffer.shared = 1

[Command]
name = "236C"
command = ~D, F,  y
buffer.shared = 1

[Command]
name = "236D"
command = ~D, F,  b
buffer.shared = 1

[Command]
name = "623A"
command = F, D, $F,  x
time = 18
buffer.time = 3

[Command]
name = "623B"
command = F, D, $F,  a
time = 18
buffer.time = 3

[Command]
name = "623C"
command = F, D, $F,  y
time = 18
buffer.time = 3

[Command]
name = "623D"
command = F, D, $F,  b
time = 18
buffer.time = 3

[Command]
name = "623A"
command = F, D, $F+x
time = 15
buffer.time = 3

[Command]
name = "623B"
command = F, D, $F+a
time = 15
buffer.time = 3

[Command]
name = "623C"
command = F, D, $F+y
time = 15
buffer.time = 3

[Command]
name = "623D"
command = F, D, $F+b
time = 15
buffer.time = 3

[Command]
name = "421A"
command = B, D, $B,  x

[Command]
name = "421B"
command = B, D, $B,  a

[Command]
name = "421C"
command = B, D, $B,  y

[Command]
name = "421D"
command = B, D, $B,  b

[Command]
name = "426A"
command = ~B, D, F,  x

[Command]
name = "426B"
command = ~B, D, F, a

[Command]
name = "426C"
command = ~B, D, F,  y

[Command]
name = "426D"
command = ~B, D, F,  b

[Command]
name = "624A"
command = ~F, D, B,  x

[Command]
name = "624B"
command = ~F, D, B, a

[Command]
name = "624C"
command = ~F, D, B,  y

[Command]
name = "624D"
command = ~F, D, B,  b

[Command]
name = "22A"    
command = ~D, D, x
time = 10
buffer.time = 1


[Command]
name = "22B"    
command = ~D, D, a
time = 10
buffer.time = 1

[Command]
name = "22C"    
command = ~D, D, y
time = 10
buffer.time = 1


[Command]
name = "22D"    
command = ~D, D, b
time = 10
buffer.time = 1


[Command]
name = "46A"    
command = ~25$B, $F, x
time = 10

[Command]
name = "46B"    
command = ~25$B, $F, a
time = 10

[Command]
name = "46C"    
command = ~25$B, $F, y
time = 10

[Command]
name = "46D"    
command = ~25$B, $F, b
time = 10

[Command]
name = "46A"    
command = ~25$B, $F, ~x
time = 10

[Command]
name = "46B"    
command = ~25$B, $F, ~a
time = 10

[Command]
name = "46C"    
command = ~25$B, $F, ~y
time = 10

[Command]
name = "46D"    
command = ~25$B, $F, ~b
time = 10

[Command]
name = "28A"    
command = ~25$D, $U, x
time = 15
buffer.time = 5

[Command]
name = "28B"    
command = ~25$D, $U, a
time = 15
buffer.time = 5

[Command]
name = "28C"    
command = ~25$D, $U, y
time = 15
buffer.time = 5

[Command]
name = "28D"    
command = ~25$D, $U, b
time = 15
buffer.time = 5

[Command]
name = "28A"    
command = ~25$D, $U, ~x
time = 15
buffer.time = 5

[Command]
name = "28B"    
command = ~25$D, $U, ~a
time = 20
buffer.time = 5

[Command]
name = "28C"    
command = ~25$D, $U, ~y
time = 20
buffer.time = 5

[Command]
name = "28D"    
command = ~25$D, $U, ~b
time = 20
buffer.time = 5

;-CACITY EX INPUTS-

[Command]
name = "EX28A"    
command = ~25$D, $U, x + a 
time = 20
buffer.time = 5
[Command]
name = "EX28A"    
command = ~25$D, $U, x + y 
time = 20
buffer.time = 5
[Command]
name = "EX28A"    
command = ~25$D, $U, x + b
time = 20
buffer.time = 5

[Command]
name = "EX28C"    
command = ~25$D, $U, y + a 
time = 15
buffer.time = 5
[Command]
name = "EX28C"    
command = ~25$D, $U, y + x
time = 15
buffer.time = 5
[Command]
name = "EX28C"    
command = ~25$D, $U, y + b
time = 15
buffer.time = 5

[Command]
name = "EX82C"    
command = ~20$U, $D, y + a 
time = 15
buffer.time = 5
[Command]
name = "EX82C"    
command = ~20$U, $D, y + x
time = 15
buffer.time = 5
[Command]
name = "EX82C"    
command = ~20$U, $D, y + b
time = 15
buffer.time = 5

[Command]
name = "82C"    
command = ~20$U, $D, y
time = 15
buffer.time = 5

[Command]
name = "EX236B"
command = ~D, F, a + x
buffer.shared = 1
[Command]
name = "EX236B"
command = ~D, F, a + b
buffer.shared = 1
[Command]
name = "EX236B"
command = ~D, F, a + y
buffer.shared = 1

[Command]
name = "EX46D"    
command = ~25$B, $F, b + a 
time = 10
buffer.time = 5
[Command]
name = "EX46D"    
command = ~25$B, $F, b + x
time = 10
buffer.time = 5
[Command]
name = "EX46D"    
command = ~25$B, $F, b + y
time = 10
buffer.time = 5

