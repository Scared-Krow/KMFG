; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below.
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
;
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10


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
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 16

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 3



;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;===========================================================================

;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,630])
trigger2 = (movecontact || (enemy,Map(Parry)=1 && MoveReversed))
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
trigger1 = movecontact && power >= 250
trigger2 = (stateno=1101 && time >= 6 ) && power >= 250
;---------------------------------------------------------------------------
;5K
[State -1, 5K]
type = ChangeState
value = 705
triggerall = command != "holdfwd" && command != "holddown" &&(command = "c" || (command = "y" && command = "b"))
triggerall = statetype != A
trigger1 = stateno = 706 || stateno = 711
trigger2 = ctrl
;---------------------------------------------------------------------------
;2K
[State -1, 2K]
type = ChangeState
value = 710
triggerall = command = "holddown" && (command = "c" || (command = "y" && command = "b"))
triggerall = statetype != A
trigger1 = stateno = 706 || stateno = 711
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
triggerall = vel y > 0 || pos y < -50
triggerall = Map(DJ)>0 && Map(DJAccess)=1
triggerall = statetype = A
triggerall = command = "up"
;triggerall = vel y > -7 && pos y < -30
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = stateno != 195
trigger1 = command = "start"

;============================================================================
;=============================SUPERS=========================================
;============================================================================

;---------------------------------------------------------------------------
;632146C
[State -1, 632146C]
type = ChangeState
value = 3000
triggerall = power>=500
triggerall = command = "6246C"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno=[640,2000] && movecontact

;---------------------------------------------------------------------------
;214214A
[State -1, 214214B]
type = ChangeState
value = 3100
triggerall = Map(BUCKX2) <= 0
triggerall = power>=500
triggerall = command = "214214A"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = ((stateno=1000 || stateno=1005)&& time >= 21)
trigger4 = helper(1002),movecontact || helper(1006),movecontact
trigger5 = stateno=[1000,2000] && movecontact

;============================================================================
;============================SPECIALS========================================
;============================================================================
;---------------------------------------------------------------------------
;236A
[State -1, 236A]
type = ChangeState
value = 1000
triggerall = command = "236A"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;236B
[State -1, 236B]
type = ChangeState
value = 1100
triggerall = command = "236B"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;63214B
[State -1, 63214B]
type = ChangeState
value = 1200
triggerall = command = "624B"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;623C
[State -1, 623C]
type = ChangeState
value = 1300
triggerall = command = "623C"
triggerall = statetype != A
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
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 400) && movecontact
;---------------------------------------------------------------------------
;5M
[State -1, 5B]
type = ChangeState
value = 210
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 400) && movecontact
;---------------------------------------------------------------------------
;5C
[State -1, 5C]
type = ChangeState
value = 230
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,210]) ||(stateno = [400,410])
trigger2 = movecontact
;---------------------------------------------------------------------------
;5D
[State -1, 5D]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,430]) && stateno != 300 && stateno != 250 && stateno != 240 && stateno != 241
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
trigger2 = (stateno = 200 || stateno = 400) && movecontact
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
value = 430
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
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,430]) && stateno != 300 && stateno != 250 && stateno != [240,241]
trigger2 = movecontact

;---------------------------------------------------------------------------
;j.A
[State -1, jA]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = movecontact

;---------------------------------------------------------------------------
;j.B
[State -1, jB]
type = ChangeState
value = 610
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = movecontact

;---------------------------------------------------------------------------
;j.C
[State -1, jC]
type = ChangeState
value = 630
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 610
trigger2 = movecontact

;---------------------------------------------------------------------------
;j.D
[State -1, jD]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 610 || stateno = 630
trigger2 = movecontact