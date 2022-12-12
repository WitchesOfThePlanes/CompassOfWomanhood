//
// Caly's tale-gathering joining quest
//
// Caly is gathering tales. She can only be joined before chapter 4,
// as she doesn't stop in Athkatla for long enough and your tale would
// be too advanced for her to personally experience much of it.
//

// Caly joining the party is in this file because it produces the journal
// entries that eventually turn into her quest, so it needs to be in the same
// translation file.

//
// @1000001
//  ^
//  1 - join-related
//  2 - plot
//  3 - minor characters
//  9 - journal-related
// @1000001
//   ^^
//   for @2... (plot) - dialogue partner number
// @1000001
//     ^^
//     dialogue number with the same partner
// @1000001
//       ^^
//       number of line in dialogue
//


//
// Introduction
//
// 6W#CALY_INTRO_STORIES holds the state of initial conversation
//  * 0 - no tale promised nor told
//  * 1 - tale of your future adventures promised
//  * 2 - tale of your previous adventures told
// After that initial conversation, it can still be updated as follows:
//   0 -> 1
//   0 -> 2
//   1 -> 2

APPEND 6WCAL0
  IF ~
    Global("6W#CalyInitial","GLOBAL",0)
  ~ THEN 6W#Caly_Initial
    SAY @1000000 /* A tale, a tale, my gold for a tale! */
    // Richard III in Shakespeare's "Richard III":
    //   "A horse, a horse, my kingdom for a horse!"

    IF ~~ THEN
      REPLY @1000001 /* Why exactly are you looking for tales in Temple District? */
      GOTO 6W#Caly_Initial__why_this_district

    IF ~
      GlobalLT("6W#CALY_INTRO_STORIES","GLOBAL",2)
    ~ THEN
      REPLY @1000002 /* I don't know any good tales yet, but a long journey is ahead of me, so surely I'll get to know some. */
      GOTO 6W#Caly_Initial__long_journey_ahead

    IF ~
      IsGabber(Player1)
      GlobalLT("6W#CALY_INTRO_STORIES","GLOBAL",2)
      OR(2)
        CheckStatGT(Player1,13,INT)
        Class(Player1,BARD_ALL)
    ~ THEN
      REPLY @1000003 /* I can tell you a story of a <PRO_MANWOMAN>, who was a <PRO_SONDAUGHTER> to God of Murder. And who was forced to kill <PRO_HISHER> own brother... */
      //TODO: cutscene, maybe some sound
      GOTO 6W#Caly_Initial__my_story

    IF ~
      IsGabber(Player1)
      Global("6W#CALY_INTRO_STORIES","GLOBAL",2)
    ~ THEN
      REPLY @1000004 /* I'm afraid I don't have any new ones for you. */
      GOTO 6W#Caly_Initial__no_new_ones

    IF ~~ THEN
      REPLY @1000009 /* I don't know any tales, mad woman. Nor am I interested in them. */
      GOTO 6W#Caly_Initial__you_mad
  END
  IF ~~ THEN 6W#Caly_Initial__why_this_district
    SAY @1000010 /* Oh, just this very morning I heard one about a man who lead out his people out of slavery, with help of a desert demon. Splendid fairy tale, indeed. */
    // It may not be as clear of a reference for the English speakers,
    // so a little hint for you: "desert demon" is a commonly used phrase
    // in Polish that atheists tend to use for the deity of a quite famous
    // religion(s?) that originated in the Middle East.

    IF ~~ THEN
      REPLY @1000002 /* I don't know any good tales yet, but a long journey is ahead of me, so surely I'll get to know some. */
      GOTO 6W#Caly_Initial__long_journey_ahead

    IF ~
      IsGabber(Player1)
      GlobalLT("6W#CALY_INTRO_STORIES","GLOBAL",2)
      OR(2)
        CheckStatGT(Player1,13,INT)
        Class(Player1,BARD_ALL)
    ~ THEN
      REPLY @1000003 /* I can tell you a story of a <PRO_MANWOMAN>, who was a <PRO_SONDAUGHTER> to God of Murder. And who was forced to kill <PRO_HISHER> own brother... */
      //TODO: cutscene, maybe some sound
      GOTO 6W#Caly_Initial__my_story

    IF ~
      IsGabber(Player1)
      Global("6W#CALY_INTRO_STORIES","GLOBAL",2)
    ~ THEN
      REPLY @1000004 /* I'm afraid I don't have any new ones for you. */
      GOTO 6W#Caly_Initial__no_new_ones

    IF ~~ THEN
      REPLY @1000009 /* I don't know any tales, mad woman. Nor am I interested in them. */
      GOTO 6W#Caly_Initial__you_mad
  END

  IF ~~ THEN 6W#Caly_Initial__long_journey_ahead
    SAY @1000020 /* I hope you may share them with me, then... */

    IF ~~ THEN
      DO ~
        SetGlobal("6W#CALY_INTRO_STORIES","GLOBAL",1)
        ForceRandomEncounter("6W2000")
      ~
      EXIT
  END

  IF ~~ THEN 6W#Caly_Initial__my_story
    SAY @1000030 /* Ah, what a great story that was! I shall gladly add it to my collection. */

    IF ~~ THEN
      DO ~
        SetGlobal("6W#CALY_INTRO_STORIES","GLOBAL",2)
        ForceRandomEncounter("6W2000")
      ~
      EXIT
  END

  IF ~~ THEN 6W#Caly_Initial__no_new_ones
    SAY @1000040 /* Just make sure to come back when you know its ending. */

    IF ~~ THEN
      REPLY @1000041 /* Of course, I will. */
      EXIT

    IF ~~ THEN
      REPLY @1000042 /* What do you mean? I'm pretty sure I did tell you how it ended. */
      GOTO 6W#Caly_Initial__how_it_ended

    IF ~~ THEN
      REPLY @1000043 /* Or some new ones. */
      GOTO 6W#Caly_Initial__or_new_ones
  END

  IF ~~ THEN 6W#Caly_Initial__how_it_ended
    SAY @1000050 /* *smiles* You seem to have missed "and <PRO_HESHE> lived happily ever after". Or was that intentional, I wonder? */
    =
    @1000051 /* Sssh! No need to answer. Some things are better unspoken. */

    IF ~~ THEN
      EXIT
  END

  IF ~~ THEN 6W#Caly_Initial__or_new_ones
    SAY @1000055 /* I'd much rather... */
    =
    @1000056 /* *smiles* Forgive me. I almost said a word too many. */

    IF ~~ THEN
      EXIT
  END

  IF ~~ THEN 6W#Caly_Initial__you_mad
    SAY @1000090 /* Mad? Perhaps. After all, if I wasn't out of my mind,
                    I wouldn't be living in the material world. */

    // The English version is a word play on
    // "out of one's mind" == "not inside of one's mind", ergo: existing
    // in this material world, as well as a reference to Madonna's
    // "Material Girl". If you thought you could impress her by giving her
    // expensive gifts!
    //
    // The Polish version is a word-play on the word ,,obłąkana'' (mad, crazy)
    // and the verb ,,błąkać (się)'' (to wander), one of forms of which is
    // ,,przybłąkać się'' (to stray, to end up being comewhere without
    // the conscious intention to do so), which is also a reference to a famous
    // Polish translation of "Alice in the Wonderland", Robert Stiller.
    // Original quote from the Alice's dialogue with the Cheshire Cat:
    //   "How do you know I'm mad?" said Alice.
    //   "You must be," said the Cat, "or you wouldn't have come here."
    // While Stiller's version seamlessly adds a very Carroll-like
    // word play here:
    //   --- Skąd może pan wiedzieć, że ja mam bzika?'' --- zapytała Alicja.
    //   --- Musisz być obłąkana --- powiedział Kot --- bo inaczej byś się
    //       tu nie przybłąkała.
    // Which translates to: "You have to be mad (obłąkana) or otherwise
    // you wouldn't have strayed (przybłąkała) to here" --- pretty much what
    // Caly says about herself here.

    IF ~~ THEN
      EXIT
  END
END
