//
// Shithri - interjections file
//

// encoding:
// 1 00 00 00
// ^
// type
// ~ 1 - minor dialogues with minor characters
// ~ 2 - major dialogues
// ~ 3 - quest-related comments
// ~ 4 - plot-relevant
// ~ 5 - party


// Salvanas

CHAIN IF ~
  !InPartySlot(LastTalkedToBy,0)
  Name("6WSHITHRI",LastTalkedToBy)~
THEN SALVANAS 6W#shithri_salvanas
  @1000000 /* Oh, what do we have here? A mountain princess, perhaps? I do sense that raw, wild passion about you. */
  == 6WSHITJ
  @1000001 /* Hardly a mountain lass I be, hussyboy. Can't know a sea dog when ye see one, can ye? */
  == SALVANAS
  @1000002 /* "Hussyboy"? Oh darling, I didn't know we already started... I love women to be this upfront! */
  == 6WSHITJ
  @1000003 /* Aye, honest lass be best lass. *gulp* I be blunt then: ye 'ave pretty hands, dandy! */
  == SALVANAS
  @1000004 /* Then shall we... find someplace more private for me to show you exactly what those hands are capable of? */
  == 6WSHITJ
  @1000005 /* Nah need. I can know fer meself here 'n now. */
  == SALVANAS
  @1000006 /* Passion as sharp as your tongue! I wonder what else that tongue... but I see my hand really picked your eye? */
  == 6WSHITJ
  @1000007 /* Sssh. I be measurin'. */
  == SALVANAS
  @1000008 /* Ah, of course! My fingers are in perfect shape to bring a woman the most sensual of pleasures. */
  == 6WSHITJ
  @1000009 /* 'Tis right. Surprisingly well-suited fer gloves. Jus' a lil cut here... */
  == SALVANAS
  @1000010 /* Ha. Ha ha. You surely are a sharp lady. With that. Blade of yours near my wrist. May you excuse me now... */
EXIT


// Drow (male) prostitute
//
// Implementation Note:
//
// Normally, the dialogue options are allowed depending on a character's gender
// plus an eager answer may be disallowed for some. Neera is the only canon
// companions who is conditionally eager: she is eager but only if the romance
// with her isn't active.
//
// As a side note: it's interesting how Nalia is eligible here for
// an exotic massage, but not when talking with Madam Nin. Looks like she draws
// the line at sexual stuff.
//
// Considering the above, Shithri may be added for "eager" path as long as she's
// not in a romance with Neera + Neera should get an additional condition. Because
// state 1 of Shithri-Neera romance is less serious than in canon romances, the "eager"
// path can probably be permissed for state 1.
//
// All of the other characters speak the very same line here (gender-specific),
// as they are supposed to pretend to be common drow. Shithri's pirate speech
// comes into play now though.
//
// Not sure why the original code uses `Name` instead of `IsGabber` though...

// Shouldn't apply the default dialogue (need to guard both male
// and female version, as some wild surges may temporarily switch genders)
ADD_TRANS_TRIGGER DADROW21 2 ~
  !Name("6WSHITHRI",LastTalkedToBy)
~ DO 0 1

// Neera only if not commited to Shithri
ADD_TRANS_TRIGGER DADROW21 2 ~
  !Global("6W#ShithriNeeraRomanceActive","GLOBAL",2)
~ DO 2

// Shithri's "no thanks" dialogue shouldn't be as elaborate as the original
// one either.
ADD_TRANS_TRIGGER DADROW21 2 ~
  !IsGabber("6WSHITHRI")
~ DO 5

// Add Shithri-specific dialogues, with accent included.
EXTEND_BOTTOM DADROW21 2
  IF ~
    IsGabber("6WSHITHRI")
    !Global("6W#ShithriNeeraRomanceActive","GLOBAL",1)
    !Global("6W#ShithriNeeraRomanceActive","GLOBAL",2)
  ~ THEN
    REPLY @1000100 /* Aye, sounds nah half bad. Show this bu... I mean: this female, wha' ye made o'. */
    GOTO 4

  IF ~
    IsGabber("6WSHITHRI")
  ~
    REPLY @1000110 /* Maybe 'nother day. */
    GOTO 3
END


//
// Reginald, from Neera's Hidden Refuge
//
// Implementation Note:
// PC can note that Reginald's a half-orc. Dorn will laugh at PC,
// while Reginald tries to bond with him. Shithri might be a fellow half-orc
// here, as she's more positive towards her heritage than Dorn is.

// Reginald is from Damara --- a country east of Gelena Mountains,
// on the northern-east of Moonsea. Shithri is from Zhentil Keep, on the other
// side of it. Note that the Moonsea isn't that big, so these two are quite
// close, geographically.
//
// Neera's interjection is more important though, so it comes first.
EXTEND_BOTTOM OHNREGI 4
  IF ~
    IfValidForPartyDialogue("6WSHITHRI")
    !IfValidForPartyDialogue("Neera")
  ~ THEN
    DO ~
      SetGlobal("6W#ShithriReginald","GLOBAL",2)
    ~
    EXTERN ~6WSHITJ~ 6W#ShithriReginald_cousin
END
EXTEND_BOTTOM NEERAJ 71
  IF ~
    IfValidForPartyDialogue("6WSHITHRI")
  ~ THEN
    DO ~
      SetGlobal("6W#ShithriReginald","GLOBAL",2)
    ~
    EXTERN ~6WSHITJ~ 6W#ShithriReginald_cousin
END
CHAIN 6WSHITJ 6W#ShithriReginald_cousin
  @1000200 /* Damara? That jus' a stone throw from the Moonsea! Hello me cousin, then! */
  == OHNREGI
  @1000201 /* Cousin, yes. You are Luthic's daughter. */
  == 6WSHITJ
  @1000202 /* Aye I be! */
  == OHNREGI
  @1000203 /* Sound of Thargate. */
  == 6WSHITJ
  @1000204 /* Aye I do! */
  == OHNREGI
  @1000205 /* Good. */
END OHNREGI 3

// Makes sense to ask Shithri to talk to him, considering how he managed
// to talk with her for a bit plus they're "cousins".
EXTEND_BOTTOM OHNREGI 8
  IF ~
    IfValidForPartyDialogue("6WSHITHRI")
    Global("6W#ShithriReginald","GLOBAL",2)
  ~
  REPLY @1000210 /* Shithri? Can you calm down your "cousin"? */
  EXTERN ~6WSHITJ~ 6W#ShithriReginald_calm_down
END
CHAIN 6WSHITJ 6W#ShithriReginald_calm_down
  @1000211 /* Oi, cousin. Cap'tn be alright. Nah need t' get angry. */
  == OHNREGI
  @1000212 /* Talks too much. */
  == 6WSHITJ
  @1000213 /* Ye son o' Gruumsh, nah Leg-Breaker, ain't ya? */
  == OHNREGI
  @1000214 /* YOU talk too much! */
  == 6WSHITJ
  @1000215 /* Come on, cousin! Let's splice the mainbrace 'n forget this already. Wha' says you? */
  == OHNREGI
  @1000216 /* No! You all go now! One chance to walk away. Else I attack. */
COPY_TRANS OHNREGI 9


//
// Hayes betrayed Telana and wild mages, is now drinking himself dead.
// Shithri obviously doesn't approve it one bit.
//

INTERJECT_COPY_TRANS OHNHAYES 29 6W#ShithriHayesBetrayer_comment
  BRANCH ~IsValidForPartyDialog("6WSHITHRI")~
  BEGIN
    == 6WSHITJ
    @1000300 /* Wastin' liqies 'ere, ain't ye, deadman traitor? */
    == OHNHAYES
    @1000301 /* Traitor, yes. But not dead. Not yet. */
  END
END



/*
 * Major NPC dialogues
 */

// Arrive to Brynnlaw
//
// Shithri, being the companion that is (by far!) most experienced in sailing, will quite naturally always make
// a comment in such a situation. Note how Yoshimo already comments on cards, so if Shithri simply commented on cards,
// it would be a bit awkward.
//
// Implementation Note:
// The variable name can be the same as the two will never be run in the same game.

INTERJECT_COPY_TRANS PPSAEM 14 6W#ShithriCruiseComment
  == 6WSHITJ IF ~IsValidForPartyDialog("6WSHITHRI")~ THEN
  @2000000 /* Visitors? Company? Huh! This bucko been more o' a bosun t' y'all than that drukard o' yer crewman, yarrr. */
END

INTERJECT_COPY_TRANS PPSAEM 53 6W#ShithriCruiseComment
  == 6WSHITJ IF ~IsValidForPartyDialog("6WSHITHRI")~ THEN
  @2000000 /* Visitors? Company? Huh! This bucko been more o' a bosun t' y'all than that drukard o' yer crewman, yarrr. */
END

// Saemon betrays you
//
// Shithri will comment it, because he's a privateer and she hates them.
//
// Normally, Yoshimo would comment here, and all the others - one state later.
// Both Yoshimo and Shithri doing that seems a bit of an overkill, and Shithri (arguably)
// has a better reason to speak here.
//
// Doubly so, because that way, Shithri & Minsc can both speak.
//
// Additionally, Mazzy speaks in the same dialogue and calls Saemon "pirate" - of course Shithri would correct that.

INTERJECT PPSAEM 58 6W#ShithriSaemonBetrayCcomment
  == 6WSHITJ IF ~IsValidForPartyDialog("6WSHITHRI")~ THEN
  @2000100 /* See? See?! THAT be wha' ye get fer trustin' a privateer! *spits* "Good business", bastard say, "good business"! */
  == PPSAEM
  @2000101 /* This has nothing to do with my letter of marque, my lady. I stress to you that I have done what I must, just as you did many a times, I presume. And you will continue to do so. Do you hear? You will continue. That is all that I know. */
END PPSAEM 59

INTERJECT MAZZYJ 168 6W#ShithriMazzySaemonBetray
  == 6WSHITJ IF ~IsValidForPartyDialog("6WSHITHRI")~ THEN
  @2000102 /* Me matey, please! */
  == MAZZYJ IF ~IsValidForPartyDialog("6WSHITHRI")~ THEN
  @2000103 /* Oh, of course. "Privateer". You shall perish, privateer! */
END


// door to Desharik's (Pirate King's) office - you can try to name-drop
// Shithri, but you'll fail as she's not really known here

EXTEND_TOP PPDOOR 0
  IF ~
    IsValidForPartyDialog("6WSHITHRI")
    InMyArea("6WSHITHRI")
  ~ THEN
    REPLY @2000200 /* My good friend Shithri - here - wants to speak to him. */
    GOTO shithri_desharik_door
END
APPEND PPDOOR
  IF ~~ THEN BEGIN shithri_desharik_door
    SAY @2000201 /* And who is she? I don't know her, the King probably doesn't either. And she has no appointment. */
    COPY_TRANS PPDOOR 0
  END
END


// Anomen calls Saemon "pirate" - not on Shithri's watch!
INTERJECT_COPY_TRANS ANOMENJ 265 6W#ShithriAnomenComAsylumBreak
  == 6WSHITJ IF ~IsValidForPartyDialog("6WSHITHRI")~
  @2000300 /* He nah pirate, knighty. 'n wha' kind o' knight gets scared o' some lil chaos, huh? */
END



//
// Main plot-related
//

/*
 * Tree of Life
 */

EXTEND_BOTTOM Player1 33
  IF ~
    IsValidForPartyDialog("6WSHITHRI")
    InMyArea("6WSHITHRI")
    Global("6W#Shithri_TreeofLife","GLOBAL",0)
    NumInPartyGT(2)
    OR(3)
      !IsValidForPartyDialog("Neera")
      !InMyArea("6WSHITHRI")
      !Global("6W#ShithriNeeraRomanceActive","GLOBAL",2)
  ~ THEN
    GOTO 6W#shithri_tree_of_life__desc_no_neera
  IF ~
    IsValidForPartyDialog("6WSHITHRI")
    InMyArea("6WSHITHRI")
    Global("6W#Shithri_TreeofLife","GLOBAL",0)
    NumInParty(2)
  ~ THEN
    GOTO 6W#shithri_tree_of_life__desc_only_one
  IF ~
    IsValidForPartyDialog("6WSHITHRI")
    InMyArea("6WSHITHRI")
    Global("6W#Shithri_TreeofLife","GLOBAL",0)
    IsValidForPartyDialog("Neera")
    InMyArea("Neera")
    Global("6W#ShithriNeeraRomanceActive","GLOBAL",2)
  ~ THEN
    GOTO 6W#shithri_tree_of_life__desc_with_neera
END

// No romance with Neera
// There are other companions too.
APPEND Player1
  IF ~~ THEN BEGIN 6W#shithri_tree_of_life__desc_no_neera
    SAY @4000000 /* Shithri, the vagabond pirate girl who joined you to sail for Brynnlaw together, but stayed by your side ever since. She has perhaps the fewest attachments out of your companions. Free-spirited and dreaming big, why does she remain? */

    IF ~~ THEN
      REPLY @4000010 /* Shithri, this may be the end of my voyage. But it doesn't need to be the end of yours. */
      DO ~SetGlobal("6W#Shithri_TreeofLife","GLOBAL",1)~
      EXTERN ~6WSHITJ~ 6W#shithri_tree_of_life__not_your_voyage

    IF ~
      GlobalGT("6W#ShithriQueen","GLOBAL",0) // PC knows about Shithri wanting to become the Queen of Pirates
    ~ THEN
      REPLY @4000011 /* You know that Irenicus is more dangerous than any sea you've travelled. There is no need for the world to lose its future first Pirate Queen. */
      DO ~SetGlobal("6W#Shithri_TreeofLife","GLOBAL",1)~
      EXTERN ~6WSHITJ~ 6W#shithri_tree_of_life__danger

    IF ~~ THEN
      REPLY @4000012 /* Are you ready, my trusty bosun? This may very well be our last cruise. I need to know if I can count on you. */
      DO ~SetGlobal("6W#Shithri_TreeofLife","GLOBAL",1)~
      EXTERN ~6WSHITJ~ 6W#shithri_tree_of_life__trusty_bosun
  END
END

APPEND 6WSHITJ
  IF ~~ THEN BEGIN 6W#shithri_tree_of_life__not_your_voyage
    SAY @4000020 /* *gulp* "Capt'n". Why, ye think, I call ye that, ye silly old <PRO_MANWOMAN>? If this be the last o' yer adventures - so be mine. */
    COPY_TRANS Player1 33
  END
  
  IF ~~ THEN BEGIN 6W#shithri_tree_of_life__danger
    SAY @4000021 /* Har har! A Pirate Queen who once backed from a fight wit' a single mage? Ye got some sense o' humor there, capt'n. */
    IF ~~ THEN
      GOTO 6W#shithri_tree_of_life__swashin
  END

  IF ~~ THEN BEGIN 6W#shithri_tree_of_life__trusty_bosun
    SAY @4000022 /* Always, capt'n. This bucko nah back from danger, ye should know as much, yarrr. */
    IF ~~ THEN
      GOTO 6W#shithri_tree_of_life__swashin
  END

  IF ~~ THEN BEGIN 6W#shithri_tree_of_life__swashin
    SAY @4000023 /* So, old <PRO_MANWOMAN>, we keep natterin' or get t' swashin'? */
    COPY_TRANS Player1 33
  END
END

// The only companion.
APPEND Player1
  IF ~~ THEN BEGIN 6W#shithri_tree_of_life__desc_only_one
    SAY @4000001 /* Shithri, the vagabond pirate girl who joined you to sail for Brynnlaw together, but stayed with you ever since. Free-spirited and dreaming big, your sole companion in this hardest of journeys. Why does she remain at your side? */
    IF ~~ THEN
      REPLY @4000010 /* Shithri, this may be the end of my voyage. But it doesn't need to be the end of yours. */
      DO ~SetGlobal("6W#Shithri_TreeofLife","GLOBAL",1)~
      EXTERN ~6WSHITJ~ 6W#shithri_tree_of_life__not_your_voyage

    IF ~~ THEN
      REPLY @4000011 /* You know that Irenicus is more dangerous than any sea you've travelled. There is no need for the world to lose its future first Pirate Queen. */
      DO ~SetGlobal("6W#Shithri_TreeofLife","GLOBAL",1)~
      EXTERN ~6WSHITJ~ 6W#shithri_tree_of_life__danger

    IF ~~ THEN
      REPLY @4000012 /* Are you ready, my trusty bosun? This may very well be our last cruise. I need to know if I can count on you. */
      DO ~SetGlobal("6W#Shithri_TreeofLife","GLOBAL",1)~
      EXTERN ~6WSHITJ~ 6W#shithri_tree_of_life__trusty_bosun
  END
END

// Neera romance
APPEND Player1
  IF ~~ THEN BEGIN 6W#shithri_tree_of_life__desc_with_neera
    SAY @4000002 /* Shithri, the vagabond pirate girl who joined you to sail for Brynnlaw together, but stayed by your side ever since. While travelling with you, she seem to have find a reason why. But does she also have a reason to follow you now? */

    IF ~~ THEN
      REPLY @4000010 /* Shithri, this may be the end of my voyage. But it doesn't need to be the end of yours. */
      DO ~SetGlobal("6W#Shithri_TreeofLife","GLOBAL",1)~
      EXTERN ~6WSHITJ~ 6W#shithri_tree_of_life__not_your_voyage

    IF ~~ THEN
      REPLY @4000011 /* You know that Irenicus is more dangerous than any sea you've travelled. There is no need for the world to lose its future first Pirate Queen. */
      DO ~SetGlobal("6W#Shithri_TreeofLife","GLOBAL",1)~
      EXTERN ~6WSHITJ~ 6W#shithri_tree_of_life__danger

    // if you mention the relationship with Neera,
    // both of them will declared their loyalty,
    // so no need to ask Neera separately
    IF ~~ THEN
      REPLY @4000013 /* Shithri, you shouldn't go. You have someone to live for now. */
      DO ~
        SetGlobal("6W#Shithri_TreeofLife","GLOBAL",1)
        SetGlobal("OHN_TreeofLife","GLOBAL",1)
      ~
      EXTERN ~6WSHITJ~ 6W#shithri_tree_of_life__live_for

    IF ~~ THEN
      REPLY @4000012 /* Are you ready, my trusty bosun? This may very well be our last cruise. I need to know if I can count on you. */
      DO ~SetGlobal("6W#Shithri_TreeofLife","GLOBAL",1)~
      EXTERN ~6WSHITJ~ 6W#shithri_tree_of_life__trusty_bosun
  END
END

CHAIN 6WSHITJ 6W#shithri_tree_of_life__live_for
  @4000024 /* *smirks* Ye think that "someone" would want this bucko t' back up? T' nah be the same darin' bucko she always be? */
  == NEERAJ
  @4000025 /* THAT is something that "someone" could regret. Saving her friend's soul? Not really. */
  =
  @4000026 /* Not that "someone" wants to. She doesn't, one bit. Not even a teensy, tiny bit. But she needs to do it. */
  == 6WSHITJ
  @4000027 /* See, old <PRO_MANWOMAN>? So, we keep natterin' or get t' swashin'? */
COPY_TRANS Player1 33


/*
 * In-Hell reaction
 */

APPEND 6WSHITJ
  IF ~~ THEN BEGIN in_hell_reaction
    SAY @4000100 /* Wha' the hell... */
    COPY_TRANS PLAYER1 25
  END
END

EXTEND PLAYER1 25
  IF ~
    IsValidForPartyDialog("6WSHITHRI")
    Global("6W#Shithri_in_hell","GLOBAL",0)
  ~ THEN
    DO ~SetGlobal("6W#Shithri_in_hell","GLOBAL",1)~
    EXTERN ~6WSHITJ~ in_hell_reaction
END


/*
 * Reaction to Slayer "feeling" (no change yet):
 */

// IMPLEMENTATION NOTE
//
// In this situation, only one companion may speak,
// with the following priority order:
// 1.  Imoen
// 2.  Jaheira
// 3.  Viconia
// 4.  Anomen
// 5.  Minsc
// 6.  Cernd
// 7.  Haer'Dalis
// 8.  Mazzy
// 9.  Nalia
// 10. Jan
// 11. Korgan
// 12. Keldorn
// 13. Valygar
// 14. Edwin
// (Note the lack of EE characters, surprisingly)
//
// It seems to be the order in which they will "run" to you, putting
// the closest, most loyal and supportive friends (Imoen, Jaheira) first
// and the least emotionally concerned (Korgan), most distant (Edwin)
// or simply silent (Valygar) - last.
//
// Therefore Shithri cannot "outrun" Imoen and Jaheira - she's nowhere
// as important of a person to the PC and vice versa. Some mods do add
// such a person, e.g. Tashia mod seems to put Tashia between Imoen and
// Jaheira - which, at least in case of romance, seems fair, Tashia
// being quite an expressive person and being in quite a close relationship
// to the PC. Shithri, however, is more of a buddy-buddy-bud person
// and not that eager to express genuine care. She's also not romancable
// by the PC. That would put her somewhere in the Cernd-Haer'Dalis-Jan category.
//
// That category also suits well because Shithri:
// * would respect that Imoen is PC's sister, ergo: family, and therefore
//   is more important than herself
// * wouldn't consider herself more important than Jaheira due to her respect
//   for sha'nru
// * could just want to avoid drama with Viconia and Anomen as it's
//   not a good moment for drama
// * would always let Minsc first because he's her good friend
// * would consider whatever Cernd has to say more important than what
//   she wants to say
// Aside from Aerie, that all fits very well for placing her right after Cernd.
// Whenever she would let Haer'Dalis first or not is debatable,
// but considering how calm his reaction is - she should probably come first.
//
// That settles Shithri as being placed between Cernd and Haer'Dalis.
//
// Compatibility with other mods is more challenging here, as it's rather
// challenging to take every possible scenario in the account
// for a situation like this. Here is the implementation that seems
// good enough for the author (Udiknedormin) of this script:
//  1. Add Shithri's reaction at the bottom, so that it's checked first.
//  2. Add the negative triggers for all the characters "above" her on the list.
//     That way her reply won't be picked over them, but will be picked over
//     any others.
//  3. In case Tashia or a similar mod is installed after Shithri - works fine,
//     as Tashia mod adds an explicit ~!IsValidForPartyDialog("Tashia")~ trigger
//     to other transitions.
//  4. In case Tashia or a similar mod is installed before Shithri -
//     add their respective characters here. It should still work fine if those
//     aren't installed.

APPEND 6WSHITJ
  IF ~~ THEN BEGIN slayer_feeling_reaction
    SAY @4000200 /* Ho, me capt'n, ye nah look so great. Ye need a draught? */

    IF ~~ THEN
      REPLY @4000201 /* Shithri, I really doubt drinking will fill the void from my soul being sucked out. */
      GOTO slayer_feeling_reaction__drinking_wont_help

    IF ~~ THEN
      REPLY @4000202 /* You know what? I think I do. You have my thanks, my trusty bosun. *gulp* */
      GOTO slayer_feeling_reaction__do_need_drink

    IF ~~ THEN
      REPLY @4000203 /* Do ALL the problems get solved by booze in your world? */
      GOTO slayer_feeling_reaction__all_the_problems
  END

  IF ~~ THEN BEGIN slayer_feeling_reaction__drinking_wont_help
    SAY @4000210 /* Nay, nah that. But could make it more bearable until ye get it back. */
    IF ~~ THEN EXIT
  END
  IF ~~ THEN BEGIN slayer_feeling_reaction__do_need_drink
    SAY @4000211 /* Always there fer ya, capt'n! */
    IF ~~ THEN EXIT
  END
  IF ~~ THEN BEGIN slayer_feeling_reaction__all_the_problems
    SAY @4000212 /* If ye askin' if this bucko needs ye t' pour some liqie o'er her dead body... aye. She does. */
    IF ~~ THEN EXIT
  END
END

EXTEND_BOTTOM PLAYER1 3
  IF ~
    IsValidForPartyDialogue("6WSHITHRI")
    !IsValidForPartyDialogue("IMOEN2")
    !IsValidForPartyDialogue("JAHEIRA")
    !IsValidForPartyDialogue("VICONIA")
    //!IsValidForPartyDialogue("AERIE") <--- no reason to include her here
    !IsValidForPartyDialogue("ANOMEN")
    !IsValidForPartyDialogue("MINSC")
    !IsValidForPartyDialogue("CERND")
    // known mod characters that should have higher priority than Shithri
    !IsValidForPartyDialogue("Tashia")
  ~ THEN
    DO ~SetGlobal("SelfTalk","GLOBAL",2)~
    EXTERN ~6WSHITJ~ slayer_feeling_reaction
END


/*
 * Reaction to Slayer "change"
 */

// IMPLEMENTATION NOTE
//
// It's quite similar as in case of Slayer "feeling", although the priority
// order is a bit different and EE companions are added. Rather counter-intuitively,
// they were just all dumped at the bottom with no checks and ordering.
// Still, Shithri will stick to the original game convention and get into
// the proper priority queue.
//
// The ordering is:
// 1.  (EE) Neera
// 2.  (EE) Hexxat
// 3.  (EE) Dorn
// 4.  (EE) Rasaad
// 5.  Imoen
// 6.  Jaheira
// 7.  Viconia
// 8.  Aerie
// 9.  Anomen
// 10. Edwin
// 11. Valygar
// 12. Keldorn
// 13. Korgan
// 14. Jan
// 15. Nalia
// 16. Mazzy
// 17. Haer'Dalis
// 18. Cernd
// 19. Minsc
//
// While EE companions are at the top of the list, it doesn't seem to make
// much sense considering the original game, especially for ALL of them to have
// higher priority than Imoen and Jaheira. Their ordering will, therefore,
// be ignored here.
//
// As before, Imoen, Jaheira are for sure more important than Shithri.
// Viconia and Anomen - could let them speak to avoid drama.
// No reason for Aerie and Edwin.
//
// Reason to let Dorn speak first is similar to that of Anomen.
// For other EE companions - no reason really. Even though Shithri likes Neera,
// Neera doesn't seem to react quickly here, so it seems to make sense to take
// priority over her.


CHAIN 6WSHITJ slayer_change_reaction
  @4000300 /* Fer hundred dull cutlasses, prickle-prickle! */
  =
  @4000301 /* That nah good, nay. Ye almost like a lil kraken. I be guessin' that yer pa's form, aye. Or jus' piece o' it. */
  =
  @4000302 /* But fer Mother's voice, me capt'n, get a grip. Or we all end up deadmen. */
END

EXTEND_BOTTOM PLAYER1 5
  IF ~
    IsValidForPartyDialogue("6WSHITHRI")
    !IsValidForPartyDialogue("IMOEN2")
    !IsValidForPartyDialogue("JAHEIRA")
    !IsValidForPartyDialogue("VICONIA")
    //!IsValidForPartyDialogue("AERIE") <--- no reason to include her here
    !IsValidForPartyDialogue("ANOMEN")
    !IsValidForPartyDialogue("Dorn")
    // known mod characters that should have higher priority than Shithri
    !IsValidForPartyDialogue("Tashia")
  ~ THEN
    EXTERN ~6WSHITJ~ slayer_change_reaction
END


/*
 * Irenicus beat reaction
 */

// IMPLEMENTATION NOTE
//
// Similarly to Slayer "feeling" and "change", although the order is,
// once again, a bit different:
// 1.  (EE) Neera
// 2.  (EE) Hexxat
// 3.  (EE) Dorn
// 4.  (EE) Rasaad
// 5.  Imoen
// 6.  Jaheira
// 7.  Viconia
// 8.  Aerie
// 9.  Anomen
// 10. Keldorn
// 11. Edwin
// 12. Korgan
// 13. Nalia
// 14. Minsc
// 15. Cernd
// 16. Valygar
// 17. Jan
// 18. Mazzy
// 19. Haer'Dalis
//
// Considering how Shithri has no reason not to go before Keldorn,
// that's her position in this ordering.
//
// In the previous two situations Dorn was prioritized over her,
// so in this one she will have her chance to speak. Seems fitting
// to the original design of reordering the characters.

APPEND 6WSHITJ
  IF ~~ THEN irenicus_beat_reaction
    SAY @4000400 /* Yarrr! May his rotten black heart ne'er know peace, damn bastard. 'n may he pray fer capt'n to get <PRO_HISHER> soul back now. Or Hell be breeze in comparison. */
    IF ~~ THEN EXIT
  END
END

EXTEND_BOTTOM PLAYER1 16
  IF ~
    IsValidForPartyDialogue("6WSHITHRI")
    !IsValidForPartyDialogue("IMOEN2")
    !IsValidForPartyDialogue("JAHEIRA")
    !IsValidForPartyDialogue("VICONIA")
    //!IsValidForPartyDialogue("AERIE") <--- no reason to include her here
    !IsValidForPartyDialogue("ANOMEN")
    // known mod characters that should have higher priority than Shithri
    !IsValidForPartyDialogue("Tashia")
  ~ THEN
    EXTERN ~6WSHITJ~ irenicus_beat_reaction
END


/*
 * Freed Asylum prisoners
 */

// IMPLEMENTATION NOTE
//
// Mods seem to generally skip this one. Xan mod seems to use
// INTERJECT_COPY_TRANS here, which isn't really following the original
// design - with only one companion commenting the situation.
//
// Again, EE companions don't react to it.
//
// This time, the ordering is:
// 1.  Imoen
// 2.  Jaheira
// 3.  Viconia
// 4.  Anomen
// 5.  Aerie
// 6.  Minsc
// 7.  Edwin
// 8.  Korgan
// 9.  Jan
// 10. Cernd
// (notably - Mazzy, Nalia, Valygar, Edwin and Keldorn are absent)
//
// Shithri seems like a natural fit here, as all the other characters
// comment how PC must take the lead - and who's better to say that
// than your trusty bosun?
//
// Arguably, Minsc's (and Boo's!) comment is worth getting prioritied though.

APPEND 6WSHITJ
  IF ~~ THEN asylum_prisoners_freed_reaction
    SAY @4000500 /* Yo-ho-ho! Mad madmen all around! Ye betta lead them outta here, capt'n, or be prepared fer lots o' mageries. 'n nah a good kind. */
    IF ~~ THEN
      DO ~
        SetGlobal("playerTalk","AR1515",2)
        SetGlobal("AsylumPlot","GLOBAL",54)
        StartCutSceneMode()
        StartCutScene("Cut41m")
      ~
      EXIT
  END
END

EXTEND_BOTTOM PLAYER1 15
  IF ~
    IsValidForPartyDialogue("6WSHITHRI")
    !IsValidForPartyDialogue("IMOEN2")
    !IsValidForPartyDialogue("JAHEIRA")
    !IsValidForPartyDialogue("VICONIA")
    //!IsValidForPartyDialogue("AERIE") <--- no reason to include her here
    !IsValidForPartyDialogue("ANOMEN")
    // known mod characters that should have higher priority than Shithri
    !IsValidForPartyDialogue("Tashia")
  ~ THEN
    EXTERN ~6WSHITJ~ asylum_prisoners_freed_reaction
END
