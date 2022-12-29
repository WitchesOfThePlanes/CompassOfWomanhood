// Shithri - unjoin-rejoin
//
BEGIN 6WSHITP


// kick out

IF ~
  GLOBAL("KickedOut","LOCALS",0)
  HappinessGT(Myself,-290)
  Global("6W#ShithriNahGotToBrynnlaw","GLOBAL",0)
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
  Global("6W#ShithriNahGotToBrynnlaw","GLOBAL",0)
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
  Global("6W#ShithriNahGotToBrynnlaw","GLOBAL",0)
~ THEN BEGIN kicked_out__unhappy
  SAY @1000100 /* Ho, wha' ye think ye doin'? I nah common thug, mind ye! */

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
  Global("6W#ShithriNahGotToBrynnlaw","GLOBAL",0)
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


//
// When she joined, then unjoined and you went to Brynnlaw without her.
//
IF ~
  GlobalGT("6W#ShithriNahGotToBrynnlaw","GLOBAL",0)
~ THEN BEGIN rejoin_lied
  SAY @1000200 /* Huh! I see the liar <PRO_HIMHER>self arrived. */

  IF ~~ THEN
    REPLY @1000201 /* Pardon? */
    GOTO rejoin_lied__pardon
  IF ~~ THEN
    REPLY @1000202 /* I'm never lied to you, Shithri. */
    GOTO rejoin_lied__pardon
  IF ~~ THEN
    REPLY @1000203 /* Hi. Also: bye. */
    EXIT
END

IF ~~ THEN rejoin_lied__pardon
  SAY @1000210 /* Ye think this bucko dumb, ain't ye? Brynnlaw. "Part ways fer now". Rings any bells? */

  IF ~~ THEN
    REPLY @1000212 /* It does. I'm sorry about that, Shithri. */
    GOTO rejoin_lied__sorry

  IF ~~ THEN
    REPLY @1000213 /* You mean you never forget a thing? */
    GOTO rejoin_lied__forget

  IF ~~ THEN
    REPLY @1000214 /* And you BELIEVED it? Wow. Just wow. */
    GOTO rejoin_lied__haha

  IF ~~ THEN
    REPLY @1000215 /* Beats me. */
    GOTO rejoin_lied__nah
END

IF ~~ THEN rejoin_lied__sorry
  SAY @1000220 /* Why should I care? Liar! */
  IF ~~ THEN
    EXIT
END

IF ~~ THEN rejoin_lied__forget
  SAY @2000230 /* A darin' bucko always pays 'er debts. 'n she owns nothin' t' ones like ye. */
  IF ~~ THEN
    EXIT
END

IF ~~ THEN rejoin_lied__haha
  SAY @2000240 /* *stares* *gulp* */
  IF ~~ THEN
    EXIT
END

IF ~~ THEN rejoin_lied__nah
  SAY @2000250 /* Nah jus' liar, but a dumb one at that. Har har. Wha' a swab... */
  IF ~~ THEN
    EXIT
END
