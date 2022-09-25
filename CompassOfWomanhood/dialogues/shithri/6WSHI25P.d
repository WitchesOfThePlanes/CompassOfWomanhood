// Shithri - unjoin-rejoin for Throne of Bhaal
//
BEGIN 6WSHI25P

// Kick out
IF ~GLOBAL("KickedOut","LOCALS",0)~ THEN BEGIN kicked_out
  SAY @0 /* Ye be 'avin' nah need fer this bucko nah more? */

  IF ~~ THEN
    REPLY @1 /* No no, of course I do. Do stay. */
    DO ~
      SetGlobal("KickedOut","LOCALS",0)
      JoinParty()
    ~
    EXIT

  IF ~AreaCheck("AR4500")~ THEN
    REPLY @2 /* Oh, but I do! Stay on your watch here. */
    DO ~
      SetGlobal("KickedOut","LOCALS",1)
      MoveToPointNoInterrupt([2160.1190])
      Face(NE)
    ~ GOTO stay_here

  IF ~
    !AreaCheck("AR4500")
    !AreaCheck("AR4000")
    !AreaCheck("AR6200")
  ~ THEN
    REPLY @3 /* Oh, but I do! You need to guard our... lake, was it? */
    GOTO guard_lake

  IF ~
    !AreaCheck("AR4500")
    !AreaCheck("AR4000")
    !AreaCheck("AR6200")
  ~ THEN
    REPLY @2 /* Oh, but I do! Stay on your watch here. */
    DO ~SetGlobal("KickedOut","LOCALS",1)~
    GOTO stay_here
END

IF ~~ BEGIN stay_here
  SAY @10 /* Aye, nah worries. *gulp* */
  IF ~~ THEN EXIT
END
IF ~~ BEGIN guard_lake
  SAY @11 /* Har har. Ye be askin' t' find that imp o' yers playin' cards instead o'... whatever he usually does. */
  IF ~~ THEN
    DO ~
      SetGlobal("KickedOut","LOCALS",1)
      CreateVisualEffectObject("SPDIMNDR",Myself)
      Wait(2)
      MoveBetweenAreas("AR4500",[2160.1190],NE)
    ~
    EXIT
END

// Join back
IF ~GLOBAL("KickedOut","LOCALS",1)~ THEN BEGIN join_back
  SAY @20 /* Ahoy, capt'n! Be it the end o' me watch guardin' this here? */

  IF ~~ THEN
    REPLY @21 /* It is. Go with me now. */
    DO ~
      SetGlobal("KickedOut","LOCALS",0)
      JoinParty()
    ~
    GOTO joined_back

  IF ~~ THEN
    REPLY @22 /* No, not yet. */
    GOTO nah_joined_back
END

IF ~~ THEN BEGIN joined_back
  SAY @23 /* Aye aye, capt'n. */
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN nah_joined_back
  SAY @24 /* Pff. So why naggin', ye be? *gulp* */
  IF ~~ THEN EXIT
END
