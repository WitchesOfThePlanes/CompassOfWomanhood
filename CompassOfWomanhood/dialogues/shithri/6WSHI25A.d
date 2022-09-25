// Shithri - summon for Throne of Bhaal
//
BEGIN 6WSHI25A

IF ~Global("6W#ShithriSummoned","GLOBAL",1)
~ THEN BEGIN summoned
  SAY @0 /* Fer Sembian wench' sake... wha' be that? */

  // if PC knows Shithri, they can make an inside joke
  IF ~Global("6W#ShithriJoined","GLOBAL",1)~ THEN
    REPLY @1 /* Can't you tell? It's hell, of course. See that little devil over there? */  
    DO ~SetGlobal("6W#ShithriSummoned","GLOBAL",2)~
    GOTO summoned_nah_hell

  // if PC doesn't know Shithri, they can make a more general joke
  IF ~Global("6W#ShithriJoined","GLOBAL",0)~ THEN
    REPLY @2 /* Hello and welcome, Zentish pirate Shithri. You might be wondering why I summoned you here. */
    DO ~SetGlobal("6W#ShithriSummoned","GLOBAL",2)~
    GOTO summoned_never_knew_you

  // serious answer
  IF ~~ THEN
    REPLY @4 /* It's a pocket plane. You could say it's my own ship, just more... planar. */
    DO ~SetGlobal("6W#ShithriSummoned","GLOBAL",2)~
    GOTO summoned_ship

  // super serious answer
  IF ~~ THEN
    REPLY @5 /* Nevermind the place. I'm in need for a daring bosun. Can you help me? */
    DO ~SetGlobal("6W#ShithriSummoned","GLOBAL",2)~
    GOTO summoned_bosun
END

IF ~~ THEN BEGIN summoned_nah_hell
  SAY @10 /* Har har! Aye, sure that! Missed ye, ye lil rapscallion. */
  IF ~~ THEN GOTO summoned_why
END
IF ~~ THEN BEGIN summoned_never_knew_you
  SAY @11 /* Listen ye swab. I nah know ye so ye betta explain yerself handsomely. */
  IF ~~ THEN GOTO summoned_angry_why
END
IF ~~ THEN BEGIN summoned_ship
  SAY @12 /* More like yer own sea. Or jus'... lake. */
  IF ~~ THEN GOTO summoned_why
END

IF ~~ THEN BEGIN summoned_why
  SAY @20 /* *gulp* So why ye brought this bold, darin' bucko here? */

  IF ~~ THEN
    REPLY @21 /* I was looking for a bosun. */
    GOTO summoned_bosun

  IF ~~ THEN
    REPLY @22 /* I need a fine fighter who can play dirty if needed. */
    GOTO summoned_dirty_fighter

  IF ~~ THEN
    REPLY @23 /* Those are tough times, my friend. I could use some drink. */
    GOTO summoned_could_use_drink

  IF ~~ THEN
    REPLY @24 /* I just wanted to see a pretty face, that's all. */
    GOTO summoned_pretty_face
END
IF ~~ THEN BEGIN summoned_could_use_drink
  SAY @25 /* I feel ye, me matey. Got plenty o' them, this bucko. */
  IF ~~ THEN
    REPLY @45 /* That's all I needed to hear. Welcome aboard! */
    DO ~
      SetGlobal("KickedOut","LOCALS",0)
      JoinParty()
    ~
    EXIT

  IF ~~ THEN
    REPLY @26 /* Good! I will grab some later on. For now, just stay here, will you? */
    GOTO summoned_stay_with_drink
END

IF ~~ THEN BEGIN summoned_angry_why
  SAY @30 /* Why ye brought this bold, darin' bucko here? */

  IF ~~ THEN
    REPLY @21 /* I was looking for a bosun. */
    GOTO summoned_bosun

  IF ~~ THEN
    REPLY @22 /* I need a fine fighter who can play dirty if needed. */
    GOTO summoned_dirty_fighter

  IF ~~ THEN
    REPLY @23 /* Those are tough times, my friend. I could use some drink. */
    GOTO summoned_could_use_drink

  IF ~~ THEN
    REPLY @24 /* I just wanted to see a pretty face, that's all. */
    GOTO summoned_pretty_face
END

IF ~~ THEN BEGIN summoned_bosun
  SAY @40 /* Bosun, ye say? Huh. I can help wit' that, aye. */

  IF ~~ THEN
    REPLY @41 /* Well, more like a competent dirty fighter than a bosun. */
    GOTO summoned_dirty_fighter
  IF ~~ THEN
    REPLY @42 /* I hope you brought lots of booze, my friend. */
    GOTO summoned_have_some_booze
  IF ~~ THEN
    REPLY @43 /* Good! For now, stand there on your watch. */
    GOTO summoned_watch
END


IF ~~ THEN BEGIN summoned_dirty_fighter
  SAY @44 /* Known swasher I be, aye. Anythin' else? */

  IF ~~ THEN
    REPLY @45 /* That's all I needed to hear. Welcome aboard! */
    DO ~
      SetGlobal("KickedOut","LOCALS",0)
      JoinParty()
    ~
    EXIT
  IF ~~ THEN
    REPLY @42 /* I hope you brought lots of booze, my friend. */
    GOTO summoned_have_some_booze
  IF ~~ THEN
    REPLY @43 /* Good! For now, stand there on your watch. */
    GOTO summoned_watch
END

IF ~~ THEN BEGIN summoned_have_some_booze
  SAY @46 /* Ye tryin' t' offend me? Dry throat be nah threat t' me mateys! */
  IF ~~ THEN
    REPLY @45 /* That's all I needed to hear. Welcome aboard! */
    DO ~
      SetGlobal("KickedOut","LOCALS",0)
      JoinParty()
    ~
    EXIT

  IF ~~ THEN
    REPLY @43 /* Good! For now, stand there on your watch. */
    GOTO summoned_watch_drink_0
END

IF ~~ THEN BEGIN summoned_watch
  SAY @50 /* Aye aye. */
  IF ~~ THEN DO ~
    MoveToPointNoInterrupt([2160.1190])
    Face(NE)
  ~ EXIT
END

IF ~~ THEN BEGIN summoned_watch_drink_0
  SAY @51 /* Ye be askin' fer drinks 'n send this bucko t' her watch? *sigh* Fine then. */
  IF ~~ THEN DO ~
    MoveToPointNoInterrupt([2160.1190])
    Face(NE)
  ~ GOTO summoned_watch_drink_1
END
IF ~~ THEN BEGIN summoned_watch_drink_1
  SAY @52 /* *gulp* */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN summoned_stay_with_drink
  SAY @53 /* Aye, nah worries. */
  IF ~~ THEN DO ~
    MoveToPointNoInterrupt([2160.1190])
    Face(NE)
  ~ GOTO summoned_watch_drink_1
END

IF ~~ THEN BEGIN summoned_pretty_face
  SAY @60 /* Har har. I know, those ears o' I. */

  IF ~~ THEN
    REPLY @61 /* I was also looking for a bosun. */
    GOTO summoned_bosun

  IF ~~ THEN
    REPLY @62 /* And I also need a fine fighter who can play dirty if needed. */
    GOTO summoned_dirty_fighter

  IF ~~ THEN
    REPLY @63 /* Those are tough times, my friend. A pretty face and a draught of booze is but needed. */
    GOTO summoned_could_use_drink

  IF ~~ THEN
    REPLY @64 /* I'm glad we agree. Could you stay here for me then? */
    GOTO summoned_stay_with_drink
END


// after summoning, on her watch
IF ~Global("6W#ShithriSummoned","GLOBAL",2)
~ THEN BEGIN finish_watch_maybe
  SAY @70 /* Ahoy, capt'n! Be it the end o' me watch? */

  IF ~~ THEN
    REPLY @71 /* On the contrary. Your real watch begins now. */
    GOTO finish_watch
  IF ~~ THEN
    REPLY @72 /* No, not yet. */
    GOTO nah_finish_watch
END

IF ~~ THEN BEGIN finish_watch
  SAY @73 /* Aye, expected that much. Lead on! */
  IF ~~ THEN
    DO ~JoinParty()~
    EXIT
END
IF ~~ THEN BEGIN nah_finish_watch
  SAY @74 /* Pff. So why naggin', ye be? *gulp* */
  IF ~~ THEN EXIT
END
