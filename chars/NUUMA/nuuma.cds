;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 12
command.buffer.time = 3

[Command]
name = "j236D"
command = ~$D, F,  b
time = 10
[Command]
name = "j236C"
command = ~D, F,  y
time = 10

[Command]
name = "236D"
command = ~$D, F,  b
time = 10
[Command]
name = "236C"
command = ~D, F,  y
time = 10

[Command]
name = "sh_buffer"
command = /U
time = 1
buffer.time = 0
[Command]
name = "sh_buffer"
command = /UF
time = 1
buffer.time = 0
[Command]
name = "sh_buffer"
command = /UB
time = 1
buffer.time = 0

; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,699])
trigger2 = movecontact
var(1) = 1

;============================================================================
;======================UNIVERSAL STATES======================================
;============================================================================

;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = stateno!= 100
trigger1 = command = "FF"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Air Dash Fwd
[State -1, Run Fwd]
type = ChangeState
value = 160
triggerall = Map(DJ)>0
triggerall = vel y > 0 || pos y < -40
triggerall = command = "FADash"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;Air Dash Back
[State -1, Run Back]
type = ChangeState
value = 161
triggerall = Map(DJ)>0
triggerall = vel y > 0 || pos y < -40
triggerall = command = "BADash"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;6K
[State -1, 6K]
type = ChangeState
value = 700
triggerall = command = "holdfwd" && command != "holddown" &&(command = "c" || (command = "y" && command = "b"))
triggerall = statetype != A
triggerall = stateno != 700
trigger1 = ctrl
;---------------------------------------------------------------------------
;Enhanced 6K
[State -1, 6K]
type = ChangeState
value = 701
triggerall = HitDefAttr != SCA,HA,HP,HT
triggerall = command = "holdfwd" && command != "holddown" &&(command = "c" || (command = "y" && command = "b"))
triggerall = statetype != A
triggerall = stateno != 700
triggerall = !(stateno = 1025 && numtarget(1))
trigger1 = movecontact && power >= 250
trigger2 = (stateno= [1000, 1005] && animelemno(0) >= 5) && power >= 250
;---------------------------------------------------------------------------
;5K
[State -1, 5K]
type = ChangeState
value = 705
triggerall = command != "holdfwd" && command != "holddown" &&(command = "c" || (command = "y" && command = "b"))
triggerall = statetype != A
trigger1 = (stateno = 706 || stateno = 711) && (command = "cNB" || (command = "y" && command = "b"))
trigger2 = ctrl
;---------------------------------------------------------------------------
;2K
[State -1, 2K]
type = ChangeState
value = 710
triggerall = command = "holddown" && (command = "c" || (command = "y" && command = "b"))
triggerall = statetype != A
trigger1 = (stateno = 706 || stateno = 711) && (command = "cNB" || (command = "y" && command = "b"))
trigger2 = ctrl
;---------------------------------------------------------------------------
;Super Jump
[State -1, SJ]
type = ChangeState
value = 60
triggerall = statetype != A
triggerall = command = "28"
trigger1 = ctrl
;---------------------------------------------------------------------------
;Double Jump
[State -1, DJ]
type = ChangeState
value = 45
triggerall = Map(DJ)>0 && Map(DJAccess)=1
triggerall = vel y > 0 || pos y < -50
triggerall = statetype = A
triggerall = command = "up"
trigger1 = ctrl
trigger2 = var(1)

;============================================================================
;=============================SUPERS=========================================
;============================================================================

;---------------------------------------------------------------------------
;632146C
[State -1, 632146C]
type = ChangeState
value = 2000
triggerall = power>=500
triggerall = command = "6246D"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = ((stateno=1000 || stateno=1005)&& time >= 22) || stateno=1204 && time >= 26
trigger4 = helper(1002),movecontact || helper(1006),movecontact || helper(1209),MoveContact
trigger5 = stateno=[1000,2000] && movecontact
;632146C
[State -1, 632146C]
type = ChangeState
value = 2002
triggerall = power>=500
triggerall = command = "6246D"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = ((stateno=1000 || stateno=1005)&& time >= 22) || stateno=1204 && time >= 26
trigger4 = helper(1002),movecontact || helper(1006),movecontact || helper(1209),MoveContact
trigger5 = stateno=[1000,2000] && movecontact

;============================================================================
;============================SPECIALS========================================
;============================================================================
;22D - Cleaver
[State -1, 236D]
type = ChangeState
value = 1025
triggerall = command = "624B"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;22D - Cleaver
[State -1, 236D]
type = ChangeState
value = 1026
triggerall = command = "624B"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
;22D - Cleaver
[State -1, 236D]
type = ChangeState
value = 1020
triggerall = command = "22D"
trigger1 = ctrl
trigger2 = var(1)
;236D - Cleaver
[State -1, 236D]
type = ChangeState
value = 1010
triggerall = command = "j236D"
triggerall = statetype = A
triggerall = !numhelper(1000)
trigger1 = ctrl
trigger2 = var(1)
;236C - Cleaver
[State -1, 236D]
type = ChangeState
value = 1015
triggerall = command = "j236C"
triggerall = statetype = A
triggerall = !numhelper(1000)
trigger1 = ctrl
trigger2 = var(1)

;236D - Cleaver
[State -1, 236D]
type = ChangeState
value = 1000
triggerall = command = "236D"
triggerall = statetype != A
triggerall = !numhelper(1000)
trigger1 = ctrl
trigger2 = var(1)
;236D - Cleaver
[State -1, 236D]
type = ChangeState
value = 1005
triggerall = command = "236C"
triggerall = statetype != A
triggerall = !numhelper(1000)
trigger1 = ctrl
trigger2 = var(1)

;===========================================================================

;---------------------------------------------------------------------------
;Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = command = "x" && command = "a"
triggerall = statetype != A
trigger1 = ctrl



;===========================================================================
;---------------------------------------------------------------------------
;5A
[State -1, 5A]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact
;---------------------------------------------------------------------------
;5M
[State -1, 5B]
type = ChangeState
value = 210
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 400) && movecontact
;---------------------------------------------------------------------------
;5C
[State -1, 5C]
type = ChangeState
value = 220
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,210]) ||(stateno = [400,410])
trigger2 = movecontact
;---------------------------------------------------------------------------
;6D
[State -1, 5D]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown" && command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,430]) && stateno != 300 &&  stateno != 240
trigger2 = movecontact
;5D
[State -1, 5D]
type = ChangeState
value = 230
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,430]) && (stateno != 430 && stateno != 250 && stateno != [230,240])
trigger2 = movecontact
;---------------------------------------------------------------------------
;2A
[State -1, 2A]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
;---------------------------------------------------------------------------
;2B
[State -1, 2B]
type = ChangeState
value = 410
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 400) && movecontact

;---------------------------------------------------------------------------
;2C
[State -1, 2C]
type = ChangeState
value = 420
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,210]) ||(stateno = [400,410])
trigger2 = movecontact

;---------------------------------------------------------------------------
;2D
[State -1, 2D]
type = ChangeState
value = 430
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,420]) && stateno != 300 && stateno != [230,240]
trigger2 = movecontact

;---------------------------------------------------------------------------
;j.A
[State -1, jA]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;j.B
[State -1, jB]
type = ChangeState
value = 610
triggerall = command = "a"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = movecontact

;---------------------------------------------------------------------------
;j.C
[State -1, jC]
type = ChangeState
value = 620
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,610]
trigger2 = movecontact

;---------------------------------------------------------------------------
;j.D
[State -1, jD]
type = ChangeState
value = 630
triggerall = command = "b"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,620]
trigger2 = movecontact