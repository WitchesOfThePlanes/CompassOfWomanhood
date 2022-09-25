// Shithri - unjoin-rejoin
//
BEGIN 6WSHITP


// kick out

IF ~
  GLOBAL("KickedOut","LOCALS",0)
  HappinessGT(Myself,-290)
~ THEN BEGIN kicked_out
  SAY @1000000 /* Ye heard one a shanty too many, yarrr? */

  IF ~~ THEN
    REPLY @1000001 /* What? Me? I love your sea song, Shithri! You must have misunderstood. */
    DO ~
      SetGlobal("KickedOut","LOCALS",0)
      JoinParty()
    ~
    GOTO nah_kicked_out

  IF ~~ THEN
    REPLY @1000002 /* It's not like I hate them, but we need to part our ways. For now. */
    DO ~SetGlobal("KickedOut","LOCALS",1)~
    GOTO kicked_out_but_likes_shanties

  IF ~~ THEN
    REPLY @1000003 /* Finally someone said it for me. */
    DO ~SetGlobal("KickedOut","LOCALS",1)~
    GOTO kicked_out_hates_shanties
END

IF ~~ THEN BEGIN nah_kicked_out
  SAY @1000010 /* Ho? Mayhaps too much grog, har har! */
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN kicked_out_but_likes_shanties
  SAY @1000011 /* Glad ye like 'em. */
  IF ~~ THEN GOTO waiting_where
END
IF ~~ THEN BEGIN kicked_out_hates_shanties
  SAY @1000012 /* Only swabs be hatin' shanties, aye they be. */
  IF ~~ THEN GOTO waiting_where
END

IF ~~ THEN BEGIN waiting_where
  SAY @1000020 /* Fine. I be goin' fer a draught now, t' "Sea Bounty" tavern, aye. */
  IF ~~ THEN
    DO ~EscapeAreaMove("AR0313",677,281,NE)~
    EXIT
END


// re-join

IF ~
  GLOBAL("KickedOut","LOCALS",1)
  ReputationGT(Player1,1)
~ THEN BEGIN rejoin_maybe
  SAY @1000030 /* Ahoy, capt'n! Care fer a draught? */

  IF ~~ THEN
    REPLY @1000031 /* Actually, I want you to rejoin the team. */
    GOTO rejoin_yep
  IF ~~ THEN
    REPLY @1000032 /* Maybe one. But I will be going then. */
    GOTO rejoin_nah_but_draught
  IF ~~ THEN
    REPLY @1000033 /* Not really, no. */
    GOTO rejoin_nah_draught_nah
END

IF ~~ THEN BEGIN rejoin_yep
  SAY @1000040 /* Huh. Why nah. */
  IF ~~ THEN
    DO ~
      SetGlobal("KickedOut","LOCALS",0)
      JoinParty()
    ~
    EXIT
END
IF ~~ THEN BEGIN rejoin_nah_but_draught
  SAY @1000041 /* Har har, o' course. One draught. Jus' one. Ye surely nah be dead-drunk under this table soon enough, nay nay. */
  //TODO: gulping sounds? something else?
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN rejoin_nah_draught_nah
  SAY @1000042 /* Pff. So why naggin', ye be? *gulp* */
  IF ~~ THEN EXIT
END


// kick out - but unhappy

IF ~
  GLOBAL("KickedOut","LOCALS",0)
  !HappinessGT(Myself,-290)
~ THEN BEGIN kicked_out__unhappy
  SAY @1000100 /* Ho, wha' ye think ye doin'? I nah be common thug, mind ye! */

  IF ~~ THEN
    DO ~
      SetGLOBAL("KickedOut","LOCALS",1)
      EscapeAreaMove("AR0313",677,281,NE)
    ~
    EXIT
END


IF ~
  GLOBAL("KickedOut","LOCALS",1)
  !ReputationGT(Player1,1)
~ THEN BEGIN rejoin_unhappy
  SAY @1000110 /* Huh! I see the common thug <PRO_HIMHER>self arrived. */

  IF ~~ THEN
    REPLY @1000112 /* Well, I want you to rejoin the team. */
    GOTO rejoin_unhappy__pls_join
  IF ~~ THEN
    REPLY @1000113 /* How about we have a drink or two, what do you say? */
    GOTO rejoin_unhappy__drink
  IF ~~ THEN
    REPLY @1000114 /* And what do we have here? The good-for-nothing pirate "princess"? */
    GOTO rejoin_unhappy__princess
END

IF ~~ THEN BEGIN rejoin_unhappy__pls_join
  SAY @1000120 /* Har har, nice one! *gulp* Business be business, but ye seem t' jus' enjoy murder. */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN rejoin_unhappy__drink
  SAY @1000130 /* Nah splicin' the mainbrace wit' the like o' ye, thug. */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN rejoin_unhappy__princess
  SAY @1000140 /* At least I nah be a murderer wit' no code o' conduct. *gulp* */
  IF ~~ THEN EXIT
END
