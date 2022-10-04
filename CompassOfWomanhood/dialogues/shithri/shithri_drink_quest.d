//
// Shithri SoA drink quest
//
// Shithri suggests you to ask for bottled liqies in taverns and inns.
// Later on, after you get enough bottles, an old seaman appears
// to challenge you to a competition.
//
// Prove not to be a mere land-lubber! Taste the adventure!
//
//

APPEND 6WSHITJ
  IF ~
    Global("6W#ShithriDrinksStart","GLOBAL",3)
  ~ THEN BEGIN 6W#shithri_drinks_start__0
    SAY @1000000 /* Oy, capt'n! I hope ye'll nah jus' go past these great liqies indifferently, like the last time? */

    IF ~~ THEN
      DO ~SetGlobal("6W#ShithriDrinksStart","GLOBAL",4)~
      REPLY @1000001 /* Why wouldn't I? */
      GOTO 6W#shithri_drinks_start__why

    IF ~~ THEN
      DO ~SetGlobal("6W#ShithriDrinksStart","GLOBAL",4)~
      REPLY @1000002 /* What do you mean? We're already drinking quality stuff, aren't we? */
      GOTO 6W#shithri_drinks_start__quality_stuff

    IF ~~ THEN
      DO ~SetGlobal("6W#ShithriDrinksStart","GLOBAL",4)~
      REPLY @1000003 /* Did you just imply that Elminster's Beer is not a fine liquor?! */
      GOTO 6W#shithri_drinks_start__elminster_beer
  END

  IF ~~ THEN BEGIN 6W#shithri_drinks_start__why
    SAY @1000010 /* Huh. There be more to life than jus' businness all the time, ye know. */

    IF ~~ THEN
      REPLY @1000011 /* But I do enjoy the stuff we drink... */
      GOTO 6W#shithri_drinks_start__quality_stuff

    IF ~~ THEN
      REPLY @1000012 /* You're right. There is time for work and time for pleasure. What do you suggest then? */
      GOTO 6W#shithri_drinks_start__what_do_you_suggest

    IF ~~ THEN
      REPLY @1000013 /* Normally - maybe. But we have stuff to do. */
      GOTO 6W#shithri_drinks_start__we_have_stuff_to_do
  END

  IF ~~ THEN BEGIN 6W#shithri_drinks_start__quality_stuff
    SAY @1000020 /* I nah mean the usual stuff, capt'n. Shadowdark Ale is fine too. But we in Amn! Such a great place, tradin' all the finest liqies o' the whole Faerûn. Ain't it a waste? */

    IF ~~ THEN REPLY
      @1000021 /* If you put it that way... what do you suggest then? */
      GOTO 6W#shithri_drinks_start__what_do_you_suggest

    IF ~~ THEN REPLY
      @1000022 /* Not really. Drinking is a simple pleasure for me. */
      GOTO 6W#shithri_drinks_start__simple_pleasure
  END

  IF ~~ THEN BEGIN 6W#shithri_drinks_start__elminster_beer
    SAY @1000023 /* I hope ye jus' jestin'. */

    IF ~~ THEN
      GOTO 6W#shithri_drinks_start__quality_stuff
  END

  //Note: you WILL still be able to take the quest again by talking to Shithri directly.
  IF ~~ THEN BEGIN 6W#shithri_drinks_start__we_have_stuff_to_do
    SAY @1000023 /* Pfff. Busy-busy <PRO_GIRLBOY>. Wha' a swab... */
    IF ~~ THEN
      EXIT
  END

  // as above
  IF ~~ THEN BEGIN 6W#shithri_drinks_start__simple_pleasure
    SAY @1000025 /* Ehh... mayhaps ye'll get it somewhen. If so, talk t' this bucko again. */
    IF ~~ THEN
      EXIT
  END

  IF ~~ THEN BEGIN 6W#shithri_drinks_start__what_do_you_suggest
    SAY @1000030 /* Simple, me capt'n. We go t' tavern. Ye get a bottle or two. We go t' next one. */

    IF ~~ THEN
      REPLY @1000031 /* Sounds like a plan. */
      GOTO 6W#shithri_drinks_start__accepted

    IF ~~ THEN
      REPLY @1000040 /* Why bottles? Can't we just drink in the tavern?  */
      GOTO 6W#shithri_drinks_start__collection

    IF ~~ THEN
      REPLY @1000032 /* Why can't we just buy all of them in a single place though? */
      GOTO 6W#shithri_drinks_start__why_nah_single_place
  END

  IF ~~ THEN BEGIN 6W#shithri_drinks_start__collection
    SAY @1000041 /* Only enjoyin' fine liqies in taverns? Nay, those taste best right after a tough battle, they do! */

    IF ~~ THEN
      REPLY @1000031 /* Sounds like a plan. */
      GOTO 6W#shithri_drinks_start__accepted

    IF ~~ THEN
      REPLY @1000042 /* Forget it. We can drink something fancy at a tavern, but we won't waste space in our backpacks for liquors supply. */
      GOTO 6W#shithri_drinks_start__simple_pleasure

    IF ~~ THEN
      REPLY @1000032 /* Why can't we just buy all of them in a single place though? */
      GOTO 6W#shithri_drinks_start__why_nah_single_place
  END

  IF ~~ THEN BEGIN 6W#shithri_drinks_start__accepted
    SAY @1000033 /* Aye! A good one at that, yarrr. Set sail fer liqies! */
    IF ~~ THEN
      DO ~SetGlobal("6W#ShithriDrinksActive","GLOBAL",1)~
      UNSOLVED_JOURNAL @9000000 /* Shithri-inspired liquor collection

Per Shithri's suggestion, I decided to give a try to fine liquor collecting. I need to ask for bottle liquors in the inns and taverns we visit. Shithri seems quite knowledgeable about various drinks, so she can probably offer me some advice. */
      EXIT
  END

  IF ~~ THEN BEGIN 6W#shithri_drinks_start__why_nah_single_place
     SAY @1000034 /* We in Amn, capt'n. So many places wit' so many fine liqies. Why only buy in one? */

     IF ~~ THEN
       REPLY @1000035 /* Good thinking. Let's get to wo... I mean - pleasure! */
       GOTO 6W#shithri_drinks_start__aye_aye

     IF ~~ THEN
       REPLY @1000036 /* Because it was supposed to be pleasure, not work? */
       GOTO 6W#shithri_drinks_start__worth_it
  END

  IF ~~ THEN BEGIN 6W#shithri_drinks_start__aye_aye
    SAY @1000037 /* Aye aye, capt'n! Set sail fer liqies! */
    IF ~~ THEN
      DO ~SetGlobal("6W#ShithriDrinksProgress","GLOBAL",1)~
      EXIT
  END

  IF ~~ THEN BEGIN 6W#shithri_drinks_start__worth_it
    SAY @1000045 /* Believe this tar - it be worth the bustle. */

    IF ~~ THEN
      REPLY @1000046 /* Fine, let's do that. */
      GOTO 6W#shithri_drinks_start__aye_aye

    IF ~~ THEN
      REPLY @1000047 /* Meh. Too much work after all. */
      GOTO 6W#shithri_drinks_start__simple_pleasure
  END

  IF ~
    IsGabber(Player1)
    Global("6W#ShithriDrinksStart","GLOBAL",4)
    Global("6W#ShithriDrinksProgress","GLOBAL",0)
  ~ THEN BEGIN 6W#shithri_drinks_start__1
    SAY @1000050 /* Ho, capt'n. Ye ready t' answer the liqie call? */

    IF ~~ THEN
      REPLY @1000051 /* Of course! Let's go get some right now! */
      GOTO 6W#shithri_drinks_start__good

    IF ~~ THEN
      REPLY @1000052 /* Can you repeat what's the plan? */
      GOTO 6W#shithri_drinks_start__what_do_you_suggest

    IF ~~ THEN
      REPLY @1000053 /* No. No time. */
      GOTO 6W#shithri_drinks_start__we_have_stuff_to_do
  END

  IF ~~ THEN BEGIN 6W#shithri_drinks_start__good
    SAY @1000054 /* Good! Set sail fer liqies! */
    IF ~~ THEN
      DO ~SetGlobal("6W#ShithriDrinksProgress","GLOBAL",1)~
      EXIT
  END
END


/*
 * Taverns & Inns
 */

// Which tavern/inn serves which drinks is based on the original game files.

// IMPLEMENTATION NOTE
//
// Each tavern, inn or other place you can buy bottle liquors in,
// has a dedicated piece of code here.
//
// The general structure is:
// * add a new state transition to the main dialogue with the inn keeper
// * add a new state for the inn keeper - where you can ask Shithri for advice;
//   this state sets the "return value" so that you can return to the store
// * add a new state for Shithri - where you can ask her for a specific drink,
//   transitioning to this drink state (independent of which store you got
//   there from store); going back is implemented using "return value" from
//   the inn keeper's state. Note that replying Shithri with drink's name uses
//   that drink's naming pool and not that store's.
//
// It's basically the equivalent of a simple function call in assembly, with Shithri's states being the function and the tavern/inn keeper - the caller.
//
// Thanks to that technique, you can add inns & taverns independently
// from drinks. It's not perfect, as you still need to add the ret values
// to a global mapping in a specific Shithri's state, but it's the best
// this scrip's author (Udiknedormin) came up with.
//
// As for the strings encoding:
// @1000000
//  ^ 1 for the plot talks (e.g. starting the quest)
//    2 for taverns & inns dialogues
//    3 for drinks dialogues
//    4 for drinks item data
//    9 journal entries
// @1000000
//   ^^
//   for plot talks: number of plot talk
//   for taverns & inns: number of tavern/inn
//   for drinks: number of the drink
// @1000000
//     ^^
//     unused
//
// Compatibility note: unluckily, this implementation isn't compatible with
// any mods changing the list of drinks available in an existing inn. While
// this script's author (Udiknedormin) isn't aware of any such mods, there
// might be some. It may lead to inconsistencies: the player being able
// to buy some new drink in the store menu but not seeing it in the dialogue
// or vice versa.
//
// While it's probably possible to automatically generate this dialogue from
// the store's actual offer in its file, it would still pose problems with
// mod installation ordering, so it seems a better option to simply add
// explicit compatibility layers to known mods rather than trying to create
// a generic mechanism. Doubly so, considering how vastly it would decrease
// readability to non-programmers.


//
//  0. Copper Coronet
//

// There are quite a few states that start this store: 22, 24, 31, 33, 36


EXTEND_BOTTOM BERNARD 22
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2000000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors
END
EXTEND_BOTTOM BERNARD 24
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2000000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors
END
EXTEND_BOTTOM BERNARD 31
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2000000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors
END
EXTEND_BOTTOM BERNARD 33
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2000000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors
END
EXTEND_BOTTOM BERNARD 36
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2000000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors
END

APPEND BERNARD
  IF ~~ THEN BEGIN bottled_liquors
    SAY @2000001 /* Sure thing. Anything but fer good ol' Amnian Ale. */
    /* Pewnie. Wszystko poza starym dobrym Amnijskim. */

    IF ~~ THEN
      REPLY @2000002 /* Shithri? Are these any good? */
      DO ~SetGlobal("6W#ShithriDrinksRet","GLOBAL",0)~
      EXTERN ~6WSHITJ~ copper_coronet
  END
END

APPEND 6WSHITJ
  IF ~~ BEGIN copper_coronet
    SAY @2000010 /* Aye. Which one catches yer eye? */

    IF ~
      !PartyHasItem("_6WDR00")
    ~ THEN
      REPLY @3000000 /* Bitter Black Ale. */
      GOTO bitter_black_ale
   
    IF ~
      !PartyHasItem("_6WDR01")
    ~ THEN
      REPLY @3010000 /* Shadowdark Ale. */
      GOTO shadowdark_ale

    IF ~
      !PartyHasItem("_6WDR02")
    ~ THEN
      REPLY @3020000 /* Suz-Ale. */
      GOTO suz_ale

    IF ~~ THEN // always present because the kind is unknown to the player
      REPLY @3030000 /* Golden Sands. */
      // There are multiple kinds, so which kinds
      // are available here needs to be set.
      GOTO golden_sands__basic_only

    IF ~~ THEN
      REPLY @2000011 /* None in particular. */
      EXIT
  END
END


//
//  1. Crooked Crane
//

EXTEND_BOTTOM CROBAR01 1
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2010000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors
END

APPEND CROBAR01
  IF ~~ THEN BEGIN bottled_liquors
    SAY @2010001 /* Oh, you're a fancy one after all? But since you asked: yes, anything but Mead. */

    IF ~~ THEN
      REPLY @2010002 /* Shithri? Are these any good? */
      DO ~SetGlobal("6W#ShithriDrinksRet","GLOBAL",1)~
      EXTERN ~6WSHITJ~ crooked_crane
  END
END

APPEND 6WSHITJ
  IF ~~ BEGIN crooked_crane
    SAY @2010010 /* Aye. Which one catches yer eye? */

    IF ~
      !PartyHasItem("_6WDR00")
    ~ THEN
      REPLY @3000000 /* Bitter Black Ale. */
      GOTO bitter_black_ale

    IF ~
      !PartyHasItem("_6WDR04")
    ~ THEN
      REPLY @3040000 /* Iriaeboran Ale. */
      GOTO iriaeboran_ale

    IF ~
      !PartyHasItem("_6WDR05")
    ~ THEN
      REPLY @3050000 /* Luiren's Best Ale. */
      GOTO luirens_best_ale

    IF ~
      !PartyHasItem("_6WDR06")
    ~ THEN
      REPLY @3060000 /* Tanagyr's Ale. */
      GOTO tanagyrs_ale

    IF ~~ THEN
      REPLY @2010011 /* None in particular. */
      EXIT
  END
END


//
//  2. Sea Bounty
//

// multiple states call store: 0, 1, 3, 6

EXTEND_BOTTOM THUMB 0
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2020000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors
END
EXTEND_BOTTOM THUMB 1
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2020000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors
END
EXTEND_BOTTOM THUMB 3
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2020000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors
END
EXTEND_BOTTOM THUMB 6
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2020000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors
END

APPEND THUMB
  IF ~~ THEN BEGIN bottled_liquors
    SAY @2020001 /* Ho, does he, the Thumb? It's yer lucky day, mate - all of them, I say! */

    IF ~~ THEN
      REPLY @2020002 /* Shithri? Are these any good? */
      DO ~SetGlobal("6W#ShithriDrinksRet","GLOBAL",2)~
      EXTERN ~6WSHITJ~ sea_bounty
  END
END

APPEND 6WSHITJ
  IF ~~ BEGIN sea_bounty
    SAY @2020010 /* Aye. Which one catches yer eye? */

    IF ~
      !PartyHasItem("_6WDR07")
    ~ THEN
      REPLY @3070000 /* Alurlyath Wine. */
      GOTO alurlyath_wine

    IF ~
      !PartyHasItem("_6WDR08")
    ~ THEN
      REPLY @3080000 /* Arabellan Wine. */
      GOTO arabellan_wine

    IF ~
      !PartyHasItem("_6WDR00")
    ~ THEN
      REPLY @3000000 /* Bitter Black Ale. */
      GOTO bitter_black_ale

    IF ~
      !PartyHasItem("_6WDR90")
    ~ THEN
      REPLY @3900000 /* Elminster's Beer. */
      GOTO elminsters_beer

    IF ~
      !PartyHasItem("_6WDR09")
    ~ THEN
      REPLY @3090000 /* Evermead. */
      GOTO evermead

    IF ~
      !PartyHasItem("_6WDR01")
    ~ THEN
      REPLY @3010000 /* Shadowdark Ale. */
      GOTO shadowdark_ale

    IF ~~ THEN
      REPLY @2020011 /* None in particular. */
      EXIT
  END
END


//
//  3. Five Flagons
//

// multiple states: 0, 8

EXTEND_BOTTOM FFBART 0
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2030000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors
END
EXTEND_BOTTOM FFBART 8
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2030000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors
END

APPEND FFBART
  IF ~~ THEN BEGIN bottled_liquors
    SAY @2030001 /* But of course, my good smilin' friend! Whatever suits your taste, I have everything from Calimshite lagers to Cormyrian wine. */

    IF ~~ THEN
      REPLY @2030002 /* Shithri? Are these any good? */
      DO ~SetGlobal("6W#ShithriDrinksRet","GLOBAL",3)~
      EXTERN ~6WSHITJ~ five_flagons
  END
END

APPEND 6WSHITJ
  IF ~~ BEGIN five_flagons
    SAY @2030010 /* Aye. Which one catches yer eye? */

    IF ~
      !PartyHasItem("_6WDR00")
    ~ THEN
      REPLY @3000000 /* Bitter Black Ale. */
      GOTO bitter_black_ale

    IF ~
      !PartyHasItem("_6WDR09")
    ~ THEN
      REPLY @3090000 /* Evermead. */
      GOTO evermead

    IF ~~ THEN // always present because the kind is unknown to the player
      REPLY @3030000 /* Golden Sands. */
      // There are multiple kinds, so which kinds
      // are available here needs to be set.
      GOTO golden_sands__basic_only

    IF ~
      !PartyHasItem("_6WDR10")
    ~ THEN
      REPLY @3100000 /* Westgate Wine. */
      GOTO westgate_wine

    IF ~
      !PartyHasItem("_6WDR11")
    ~ THEN
      REPLY @3110000 /* Saerloonian Wine. */
      GOTO saerloonian_wine

    IF ~~ THEN
      REPLY @2030011 /* None in particular. */
      EXIT
  END
END


//
//  4. Delosar's Inn
//

EXTEND_BOTTOM BINNKEEP 0
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2040000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors
END

APPEND BINNKEEP
  IF ~~ THEN BEGIN bottled_liquors
    SAY @2040001 /* Bottled? Good, take them and go, it's a busy place! Unless ye want mead, can't bottle ye that. */

    IF ~~ THEN
      REPLY @2040002 /* Shithri? Are these any good? */
      DO ~SetGlobal("6W#ShithriDrinksRet","GLOBAL",4)~
      EXTERN ~6WSHITJ~ delosars_inn
  END
END

APPEND 6WSHITJ
  IF ~~ BEGIN delosars_inn
    SAY @2040010 /* Aye. Which one catches yer eye? */

    IF ~
      !PartyHasItem("_6WDR00")
    ~ THEN
      REPLY @3000000 /* Bitter Black Ale. */
      GOTO bitter_black_ale

    IF ~
      !PartyHasItem("_6WDR09")
    ~ THEN
      REPLY @3090000 /* Evermead. */
      GOTO evermead

    IF ~~ THEN // always present because the kind is unknown to the player
      REPLY @3030000 /* Golden Sands. */
      // There are multiple kinds, so which kinds
      // are available here needs to be set.
      GOTO golden_sands__gold_only

    IF ~
      !PartyHasItem("_6WDR08")
    ~ THEN
      REPLY @3080000 /* Arabellan Wine. */
      GOTO arabellan_wine

    IF ~~ THEN
      REPLY @2040011 /* None in particular. */
      EXIT
  END
END


//
//  5. Mithrest Inn
//

EXTEND_BOTTOM WINNKEEP 0
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2050000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors
END
EXTEND_BOTTOM WINNKEEP 3
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2050000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors
END

APPEND WINNKEEP
  IF ~~ THEN BEGIN bottled_liquors
    SAY @2050001 /* Indeed, my <LADYLORD>. All of our assortment, in fact. Please have a look. */

    IF ~~ THEN
      REPLY @2050002 /* Shithri? Are these any good? */
      DO ~SetGlobal("6W#ShithriDrinksRet","GLOBAL",5)~
      EXTERN ~6WSHITJ~ mithrest_inn
  END
END

APPEND 6WSHITJ
  IF ~~ BEGIN mithrest_inn
    SAY @2050010 /* Aye. Which one catches yer eye? */

    IF ~
      !PartyHasItem("_6WDR12")
    ~ THEN
      REPLY @3120000 /* Berduskan Wine. */
      GOTO berduskan_wine

    IF ~
      !PartyHasItem("_6WDR13")
    ~ THEN
      REPLY @3130000 /* Winter Wine. */
      GOTO winter_wine

    IF ~~ THEN // always present because the kind is unknown to the player
      REPLY @3030000 /* Golden Sands. */
      // There are multiple kinds, so which kinds
      // are available here needs to be set.
      GOTO golden_sands__gold_or_orange

    IF ~
      !PartyHasItem("_6WDR14")
    ~ THEN
      REPLY @3140000 /* Dragon's Beer. */
      GOTO dragons_beer

    IF ~
      !PartyHasItem("_6WDR00")
    ~ THEN
      REPLY @3000000 /* Bitter Black Ale. */
      GOTO bitter_black_ale

    IF ~
      !PartyHasItem("_6WDR07")
    ~ THEN
      REPLY @3070000 /* Alurlyath Wine. */
      GOTO alurlyath_wine

    IF ~
      !PartyHasItem("_6WDR04")
    ~ THEN
      REPLY @3040000 /* Iriaeboran Ale. */
      GOTO iriaeboran_ale

    IF ~~ THEN
      REPLY @2050011 /* None in particular. */
      EXIT
  END
END


//
//  6. Den of the Seven Vales
//

// male - 0 3 5 7
// female - 1 11 12 15 17

EXTEND_BOTTOM SEVBAR01 0
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2060000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors__male
END
EXTEND_BOTTOM SEVBAR01 3
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2060000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors__male
END
EXTEND_BOTTOM SEVBAR01 5
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2060000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors__male
END
EXTEND_BOTTOM SEVBAR01 7
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2060000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors__male
END

EXTEND_BOTTOM SEVBAR01 1
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2060000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors__female
END
EXTEND_BOTTOM SEVBAR01 11
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2060000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors__female
END
EXTEND_BOTTOM SEVBAR01 12
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2060000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors__female
END
EXTEND_BOTTOM SEVBAR01 15
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2060000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors__female
END
EXTEND_BOTTOM SEVBAR01 17
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2060000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors__female
END

APPEND SEVBAR01
  IF ~~ THEN BEGIN bottled_liquors__male
    SAY @2060001 /* Good, good! Take a bottle or two and put your disgusting male self somewhere when I can't see ye! Any beer ye want, as long as ye pay. */

    IF ~~ THEN
      REPLY @2060005 /* Shithri? Are these any good? */
      DO ~SetGlobal("6W#ShithriDrinksRet","GLOBAL",5)~
      EXTERN ~6WSHITJ~ mithrest_inn
  END
  IF ~~ THEN BEGIN bottled_liquors__female
    SAY @2060002 /* Oh, so ye won't be stayin' fer a while, miss? Pity. Have any beer you want though. */

    IF ~~ THEN
      REPLY @2060005 /* Shithri? Are these any good? */
      DO ~SetGlobal("6W#ShithriDrinksRet","GLOBAL",6)~
      EXTERN ~6WSHITJ~ seven_vales
  END
END

APPEND 6WSHITJ
  IF ~~ BEGIN seven_vales
    SAY @2060010 /* Aye. Which one catches yer eye? */

    IF ~
      !PartyHasItem("_6WDR00")
    ~ THEN
      REPLY @3000000 /* Bitter Black Ale. */
      GOTO bitter_black_ale

    IF ~~ THEN // always present because the kind is unknown to the player
      REPLY @3030000 /* Golden Sands. */
      // There are multiple kinds, so which kinds
      // are available here needs to be set.
      GOTO golden_sands__basic_only

    IF ~
      !PartyHasItem("_6WDR14")
    ~ THEN
      REPLY @3140000 /* Dragon's Beer. */
      GOTO dragons_beer

    IF ~~ THEN
      REPLY @2060011 /* None in particular. */
      EXIT
  END
END


//
//  7. Umar Inn
//

// 2, 29, 31, 36
EXTEND_BOTTOM UHINN01 2
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2070000 /* Any bottled liquors in your offer? */
    EXTERN ~UHINN02~ bottled_liquors__ask
END
EXTEND_BOTTOM UHINN01 29
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2070000 /* Any bottled liquors in your offer? */
    EXTERN ~UHINN02~ bottled_liquors__ask
END
EXTEND_BOTTOM UHINN01 31
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2070000 /* Any bottled liquors in your offer? */
    EXTERN ~UHINN02~ bottled_liquors__ask
END
EXTEND_BOTTOM UHINN01 36
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2070000 /* Any bottled liquors in your offer? */
    EXTERN ~UHINN02~ bottled_liquors__ask
END

// variant:  41, 44, 45, 46, 47, 48, 52
EXTEND_BOTTOM UHINN01 41
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2070001 /* Just a bottle or two for us. */
    GOTO bottled_liquors__want
END
EXTEND_BOTTOM UHINN01 44
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2070001 /* Just a bottle or two for us. */
    GOTO bottled_liquors__want
END
EXTEND_BOTTOM UHINN01 45
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2070001 /* Just a bottle or two for us. */
    GOTO bottled_liquors__want
END
EXTEND_BOTTOM UHINN01 46
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2070001 /* Just a bottle or two for us. */
    GOTO bottled_liquors__want
END
EXTEND_BOTTOM UHINN01 47
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2070001 /* Just a bottle or two for us. */
    GOTO bottled_liquors__want
END
EXTEND_BOTTOM UHINN01 52
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2070001 /* Just a bottle or two for us. */
    GOTO bottled_liquors__want
END

CHAIN UHINN02 bottled_liquors__ask
  @2070010 /* "Liquors"! Pretty word for what you can get in here! */
  == UHINN01
  @2070011 /* Silence, boy! Please excuse him, my good <PRO_LADYLORD>. Of course we have a fine assortment of... */
  == UHINN02
  @2070012 /* "Assortment"! Where ye get all those fancy words from, Vince? */
EXTERN ~UHINN01~ bottled_liquors__ask_fin
APPEND UHINN01
  IF ~~ THEN bottled_liquors__ask_fin
    SAY @2070013 /* Shut yer yip, boy. Now, me <PRO_LADYLORD>. Arabellan wine, Calimshite beer and even the famous evermead - pick whatever you like. */

    IF ~~ THEN
      REPLY @2070030 /* Shithri? Are these any good? */
      DO ~SetGlobal("6W#ShithriDrinksRet","GLOBAL",7)~
      EXTERN ~6WSHITJ~ mithrest_inn
  END

  IF ~~ THEN bottled_liquors__want
    SAY @2070020 /* Of course, of course, me <PRO_LADYLORD> <CHARNAME>. As ye wish. */

    IF ~~ THEN
      REPLY @2070030 /* Shithri? Are these any good? */
      DO ~SetGlobal("6W#ShithriDrinksRet","GLOBAL",7)~
      EXTERN ~6WSHITJ~ mithrest_inn
  END
END

APPEND 6WSHITJ
  IF ~~ BEGIN umar_inn
    SAY @2070040 /* Aye. Which one catches yer eye? */

    IF ~
      !PartyHasItem("_6WDR09")
    ~ THEN
      REPLY @3090000 /* Evermead. */
      GOTO evermead

    IF ~
      !PartyHasItem("_6WDR03")
    ~ THEN
      REPLY @3030000 /* Golden Sands. */
      // There are multiple kinds, so which kinds
      // are available here needs to be set.
      GOTO golden_sands__basic_only

    IF ~
      !PartyHasItem("_6WDR08")
    ~ THEN
      REPLY @3080000 /* Arabellan Wine. */
      GOTO arabellan_wine

    IF ~~ THEN
      REPLY @2070041 /* None in particular. */
      EXIT
  END
END


//
//  8. The Vulgar Monkey Inn
//

EXTEND_BOTTOM PPINN01 0
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2080000 /* I just wanted to buy a bottle or two and leave. */
    DO ~SetGlobal("ppinntalk","AR1602",1)~
    GOTO bottled_liquors
END
EXTEND_BOTTOM PPINN01 3
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2080000 /* I just wanted to buy a bottle or two and leave. */
    GOTO bottled_liquors
END

APPEND PPINN01
  IF ~~ THEN BEGIN bottled_liquors
    SAY @2080001 /* Paying AND leaving? Huh, you the best <PRO_MANWOMAN> here then. You be missing the local mead and sout, but that's on you. */

    IF ~~ THEN
      REPLY @2080002 /* Shithri? Are these any good? */
      DO ~SetGlobal("6W#ShithriDrinksRet","GLOBAL",8)~
      EXTERN ~6WSHITJ~ vulgar_monkey
  END
END

APPEND 6WSHITJ
  IF ~~ BEGIN vulgar_monkey
    SAY @2080010 /* Aye. Which one catches yer eye? */

    IF ~
      !PartyHasItem("_6WDR14")
    ~ THEN
      REPLY @3140000 /* Dragon's Beer. */
      GOTO dragons_beer

    IF ~
      !PartyHasItem("_6WDR90")
    ~ THEN
      REPLY @3900000 /* Elminster's Beer. */
      GOTO elminsters_beer

    IF ~
      !PartyHasItem("_6WDR13")
    ~ THEN
      REPLY @3130000 /* Winter Wine. */
      GOTO winter_wine

    IF ~
      !PartyHasItem("_6WDR10")
    ~ THEN
      REPLY @3100000 /* Westgate Wine. */
      GOTO westgate_wine

    IF ~
      !PartyHasItem("_6WDR09")
    ~ THEN
      REPLY @3090000 /* Evermead. */
      GOTO evermead

    IF ~~ THEN
      REPLY @2080011 /* None in particular. */
      EXIT
  END
END


//
//  9. Vyatri's Pub
//

EXTEND_BOTTOM TRINNK01 0
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2090000 /* Any bottled liquors in your offer? */
    DO ~SetGlobal("ppinntalk","AR1602",1)~
    GOTO bottled_liquors__poor
END
EXTEND_BOTTOM TRINNK01 14
  IF ~
    IsGabber(Player1)
    IfValidForPartyDialogue("6WSHITHRI")
    InMyArea("6WSHITHRI")
    GlobalGT("6W#ShithriDrinksActive","GLOBAL",0)
  ~ THEN
    REPLY @2090000 /* Any bottled liquors in your offer? */
    GOTO bottled_liquors__hero
END

APPEND TRINNK01
  IF ~~ THEN BEGIN bottled_liquors__poor
    SAY @2090001 /* Well, there isn't much, but also few people to buy what little I have. These are all pretty good though. Woodland Ale is just on tap though, no bottles. */

    IF ~~ THEN
      REPLY @2090005 /* Shithri? Are these any good? */
      DO ~SetGlobal("6W#ShithriDrinksRet","GLOBAL",9)~
      EXTERN ~6WSHITJ~ vyatris_pub
  END
  IF ~~ THEN BEGIN bottled_liquors__hero
    SAY @2090002 /* Of course, <CHARNAME>! Anything for our hero! I have everything bottled but for our local Woodland Ale. */

    IF ~~ THEN
      REPLY @2090005 /* Shithri? Are these any good? */
      DO ~SetGlobal("6W#ShithriDrinksRet","GLOBAL",9)~
      EXTERN ~6WSHITJ~ vyatris_pub
  END
END

APPEND 6WSHITJ
  IF ~~ BEGIN vyatris_pub
    SAY @2090010 /* Aye. Which one catches yer eye? */

    IF ~
      !PartyHasItem("_6WDR10")
    ~ THEN
      REPLY @3100000 /* Westgate Wine. */
      GOTO westgate_wine

    IF ~
      !PartyHasItem("_6WDR11")
    ~ THEN
      REPLY @3110000 /* Saerloonian Wine. */
      GOTO saerloonian_wine

    IF ~
      !PartyHasItem("_6WDR09")
    ~ THEN
      REPLY @3090000 /* Evermead. */
      GOTO evermead

    IF ~
      !PartyHasItem("_6WDR12")
    ~ THEN
      REPLY @3120000 /* Berduskan Wine. */
      GOTO berduskan_wine

    IF ~
      !PartyHasItem("_6WDR08")
    ~ THEN
      REPLY @3080000 /* Arabellan Wine. */
      GOTO arabellan_wine


    IF ~~ THEN
      REPLY @2090011 /* None in particular. */
      EXIT
  END
END



/*
 * Drinks
 */

// Note: those are mostly based on canon material, but some details are added
// when no info was available.

// IMPLEMENTATION NOTE
//
// Most of the drinks follow the structure:
// description
//  0. (if you have enough money) we're buying it
//  1. sounds good but we can't afford it
//  2. no, I don't like it
//
// After each of those, Shithri asks if you're interested in anything else. That state uses strings from drink 99, so there are only 99 (from 0 to 98) drinks that can actually be handled. Drinks over 90 are the ones Shithri doesn't want to even talk about.
//
// Note that each drink (but for 99) already uses its zeroth string for its name, so the description is string no 1, not no 0.

//
// return to the store
// (coded as drink 99)
//

APPEND 6WSHITJ
  IF ~~ BEGIN liquors_more
    SAY @3990000 /* Any others ye be interested in? */

    IF ~
      Global("6W#ShithriDrinksRet","GLOBAL",0)
    ~ THEN
      REPLY @3990001 /* Are there any I could be interested in? */
      GOTO copper_coronet

    IF ~Global("6W#ShithriDrinksRet","GLOBAL",1)~ THEN
      REPLY @3990001 /* Are there any I could be interested in? */
      GOTO crooked_crane

    IF ~Global("6W#ShithriDrinksRet","GLOBAL",2)~ THEN
      REPLY @3990001 /* Are there any I could be interested in? */
      GOTO sea_bounty

    IF ~Global("6W#ShithriDrinksRet","GLOBAL",3)~ THEN
      REPLY @3990001 /* Are there any I could be interested in? */
      GOTO five_flagons

    IF ~Global("6W#ShithriDrinksRet","GLOBAL",4)~ THEN
      REPLY @3990001 /* Are there any I could be interested in? */
      GOTO delosars_inn

    IF ~Global("6W#ShithriDrinksRet","GLOBAL",5)~ THEN
      REPLY @3990001 /* Are there any I could be interested in? */
      GOTO mithrest_inn

    IF ~Global("6W#ShithriDrinksRet","GLOBAL",6)~ THEN
      REPLY @3990001 /* Are there any I could be interested in? */
      GOTO seven_vales

    IF ~Global("6W#ShithriDrinksRet","GLOBAL",7)~ THEN
      REPLY @3990001 /* Are there any I could be interested in? */
      GOTO umar_inn

    IF ~Global("6W#ShithriDrinksRet","GLOBAL",8)~ THEN
      REPLY @3990001 /* Are there any I could be interested in? */
      GOTO vulgar_monkey

    IF ~Global("6W#ShithriDrinksRet","GLOBAL",9)~ THEN
      REPLY @3990001 /* Are there any I could be interested in? */
      GOTO vyatris_pub

    // ...here go other inns & taverns, according to their codes

    IF ~~ THEN
      REPLY @3990099 /* I'm fine. Off we go! */
      EXIT
  END
END


//
//  0. Bitter Black Ale
//

APPEND 6WSHITJ
  IF ~~ BEGIN bitter_black_ale
    SAY @3000001 /* Ye from Sword Coast 'n nah know it? Quite heavy, but most like it that way. Best chilled. */

    IF ~!PartyGoldLT(8)~ THEN
      REPLY @3000002 /* Let's take it then. */
      DO ~
        TakePartyGold(8)
        DestroyGold(8)
        GiveItemCreate("_6WDR00", Player1, 0, 0, 0)
      ~
      GOTO bitter_black_ale__bought

    IF ~~ THEN
      REPLY @3000003 /* Too bad we can't afford it... */
      GOTO bitter_black_ale__no_money

    IF ~~ THEN
      REPLY @3000004 /* Sounds a bit too common. */
      GOTO bitter_black_ale__nah
  END

  IF ~~ BEGIN bitter_black_ale__bought
    SAY @3000020 /* Sure thingy. Swordies always love it. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN bitter_black_ale__no_money
    SAY @3000030 /* No worries, Swordie. We raise some coins 'n come back fer it. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN bitter_black_ale__nah
    SAY @3000040 /* Aye. I see yer taste be a bit more refined. */
    IF ~~ THEN GOTO liquors_more
  END
END


//
//  1. Shadowdark Ale
//

APPEND 6WSHITJ
  IF ~~ BEGIN shadowdark_ale
    SAY @3010001 /* Liked by the ladies, it be, aye. Creamy and sweety, got bit spicey aroma. */

    IF ~Gender(Player1,FEMALE)~ THEN
      REPLY @3010002 /* "Ladies"? Am I a "lady" to you then? */
      GOTO shadowdark_ale__is_pc_lady

    IF ~!PartyGoldLT(1)~ THEN
      REPLY @3010003 /* Well, if you say it's so liked. */
      DO ~
        TakePartyGold(1)
        DestroyGold(1)
        GiveItemCreate("_6WDR01", Player1, 0, 0, 0)
      ~
      GOTO shadowdark_ale__bought

    IF ~~ THEN
      REPLY @3010004 /* As sad as it sounds, I don't think we can afford it. */
      GOTO shadowdark_ale__no_money

    IF ~~ THEN
      REPLY @3010005 /* "Liked by ladies" doesn't quite cut it. */
      GOTO shadowdark_ale__nah
  END
  IF ~~ BEGIN shadowdark_ale__is_pc_lady
    SAY @3010020 /* Nah, ye nah common lass, capt'n. */

    IF ~!PartyGoldLT(1)~ THEN
      REPLY @3010003 /* Well, if you say it's so liked. */
      DO ~
        TakePartyGold(1)
        DestroyGold(1)
        GiveItemCreate("_6WDR01", Player1, 0, 0, 0)
      ~
      GOTO shadowdark_ale__bought

    IF ~~ THEN
      REPLY @3010004 /* As sad as it sounds, I don't think we can afford it. */
      GOTO shadowdark_ale__no_money

    IF ~~ THEN
      REPLY @3010005 /* "Liked by ladies" doesn't quite cut it. */
      GOTO shadowdark_ale__nah
  END

  IF ~~ BEGIN shadowdark_ale__bought
    SAY @3010030 /* It be, aye. Nah bad, really, nah bad. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN shadowdark_ale__no_money
    SAY @3010040 /* Har har har! 'tis true we be broke. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN shadowdark_ale__nah
    SAY @3010050 /* Ho? Now ye talk like a darin' bucko now, aye ye be! */
    IF ~~ THEN GOTO liquors_more
  END
END


//
//  2. Suz-Ale
//

APPEND 6WSHITJ
  IF ~~ BEGIN suz_ale
    SAY @3020001 /* Wha' fine ale, 'tis! Rich 'n nutty, best cold. One o' Cormyr's better ones, aye. */

    IF ~!PartyGoldLT(7)~ THEN
      REPLY @3020002 /* Rich and nutty? Count me in! */
      DO ~
        TakePartyGold(7)
        DestroyGold(7)
        GiveItemCreate("_6WDR02", Player1, 0, 0, 0)
      ~
      GOTO suz_ale__bought

    IF ~~ THEN
      REPLY @3020003 /* Sounds great, but I don't think we can afford it. */
      GOTO suz_ale__no_money
    IF ~~ THEN
      REPLY @3020004 /* Too sophisticated. Next! */
      GOTO suz_ale__nah
  END

  IF ~~ BEGIN suz_ale__bought
    SAY @3020020 /* 'tis me capt'n! */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN suz_ale__no_money
    SAY @3020030 /* Only swabs nah save coin fer Suz-Ale, aye they ain't. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN suz_ale__nah
    SAY @3020040 /* 'n here ye pretended so fancy... */
    IF ~~ THEN GOTO liquors_more
  END
END


//
//  3. Golden Sands
//

// IMPLEMENTATION NOTE
//
// Strangely enough, it looks like the following pattern doesn't work:
//  * state 0, set global "foo"
//  * state 1, state transitions check value of global "foo"
// ...but this one does:
//  * state 0, set global "foo"
//  * state 1
//  * state 2, state transitions check value of global "foo"
//
// That is why there isn't just a single state `golden_sands` with transitions
// depending on some global.
//
// In this case it's just a minor inconvenience, but it's good to have in mind
// that the engine doesn't handle this case as it could be expected.

APPEND 6WSHITJ
  IF ~~ BEGIN golden_sands__basic_only
    SAY @3030001 /* Only Golden Sands Basic here, but there are others elsewhere. */

    IF ~~ GOTO liquors_more
    IF ~
      !PartyHasItem("_6WDR03a")
    ~ THEN
      GOTO golden_sands_basic
  END
  IF ~~ BEGIN golden_sands__gold_only
    SAY @3030101 /* Only Golden Sands Gold here, but there are others elsewhere. */

    IF ~~ GOTO liquors_more
    IF ~
      !PartyHasItem("_6WDR03b")
    ~ THEN
      GOTO golden_sands_gold
  END
  IF ~~ BEGIN golden_sands__gold_or_orange
    SAY @3030201 /* They 'ave Gold 'n Orange ones here. Nah Basic though. */

    IF ~~ GOTO liquors_more

    IF ~
      !PartyHasItem("_6WDR03b")
    ~ THEN
      REPLY @3030202 /* How about the Gold one? */
      GOTO golden_sands_gold

    IF ~
      !PartyHasItem("_6WDR03c")
    ~ THEN
      REPLY @3030203 /* How about the Orange one? */
      GOTO golden_sands_orange
  END

  IF ~~ BEGIN golden_sands_basic
    SAY @3030010 /* Clear lager, 'tis, aye. Crisp 'n light. */

    IF ~!PartyGoldLT(4)~ THEN
      REPLY @3030020 /* Clear lager, that's exactly what I wanted! */
      DO ~
        TakePartyGold(4)
        DestroyGold(4)
        GiveItemCreate("_6WDR03a", Player1, 0, 0, 0)
      ~
      GOTO golden_sands_basic__bought

    IF ~~ THEN
      REPLY @3030030 /* Would really be refreshing... if we could only afford it... */
      GOTO golden_sands_basic__no_money

    IF ~~ THEN
      REPLY @3030040 /* A little too plain to my taste. */
      GOTO golden_sands_basic__nah
  END

  IF ~~ BEGIN golden_sands_basic__bought
    SAY @3030021 /* Ho, ye like mild stuff then, aye. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN golden_sands_basic__no_money
    SAY @3030031 /* Refreshment be worth a coin, aye it be. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN golden_sands_basic__nah
    SAY @3030041 /* 'tis simple, aye. But also effective. */
    IF ~~ THEN GOTO liquors_more
  END


  IF ~~ BEGIN golden_sands_gold
    SAY @3030110 /* Mmm, desert's cacti 'n Daggerfort's nettles... sharp 'n refreshin', aye.. */

    // Delosar's - 3, Mithrest - 6
    IF ~
      !AreaCheck("AR0704")
      !PartyGoldLT(3)
    ~ THEN
      REPLY @3030120 /* Cacti and nettles sound like a good match. */
      DO ~
        TakePartyGold(3)
        DestroyGold(3)
        GiveItemCreate("_6WDR03b", Player1, 0, 0, 0)
      ~
      GOTO golden_sands_gold__bought

    IF ~
      AreaCheck("AR0704")
      !PartyGoldLT(6)
    ~ THEN
      REPLY @3030120 /* Cacti and nettles sound like a good match. */
      DO ~
        TakePartyGold(6)
        DestroyGold(6)
        GiveItemCreate("_6WDR03b", Player1, 0, 0, 0)
      ~
      GOTO golden_sands_gold__bought

    IF ~~ THEN
      REPLY @3030130 /* Would be cheaper to just go to Wood of Sharp Teeth and gather some nettle there... */
      GOTO golden_sands_gold__no_money

    IF ~~ THEN
      REPLY @3030140 /* Mixing ingredients from the north and south is a big no-no. */
      GOTO golden_sands_gold__nah
  END

  IF ~~ BEGIN golden_sands_gold__bought
    SAY @3030121 /* They be, indeed. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN golden_sands_gold__no_money
    SAY @3030131 /* Cheaper still t' brew yer own beer, har har. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN golden_sands_gold__nah
    SAY @3030141 /* Huh. Wha' be that? That some weird Swordie biases... */
    IF ~~ THEN GOTO liquors_more
  END


  IF ~~ BEGIN golden_sands_orange
    SAY @3030210 /* Light as the mornin' mist! Bit acidic, orange 'n currant flavored. */
    IF ~
      !PartyGoldLT(3)
    ~ THEN
      REPLY @3030220 /* Calimshite drink with Calimshite fruits. Sounds really authentic. */
      DO ~
        TakePartyGold(3)
        DestroyGold(3)
        GiveItemCreate("_6WDR03c", Player1, 0, 0, 0)
      ~
      GOTO golden_sands_orange__bought

    IF ~~ THEN
      REPLY @3030230 /* Maybe it could be made cheaper if they used... ehhh... I don't know... */
      GOTO golden_sands_orange__no_money

    IF ~~ THEN
      REPLY @3030240 /* No twist at all? *sigh* */
      GOTO golden_sands_orange__nah
  END

  IF ~~ BEGIN golden_sands_orange__bought
    SAY @3030221 /* Nay, nah really. But it popular on north Sword Coast, aye it be. */
    IF ~~ THEN GOTO liquors_more
  END

  IF ~~ BEGIN golden_sands_orange__no_money
    SAY @3030231 /* What exactly, I wonder? */

    IF ~~ THEN
      REPLY @3030232 /* Err... fenberries, maybe? */
      GOTO golden_sands_orange__fenberries

    IF ~
      OR(2)
        Class(Player1,RANGER_ALL)
        Class(Player1,DRUID_ALL)
    ~ THEN
      REPLY @3030233 /* Gooseberries. They are also but slightly acidic and grow in Tethyr, so they should be pretty cheap. */
      GOTO golden_sands_orange__gooseberries

    IF ~~ THEN
      REPLY @3030234 /* I'm no specialist in fruits, you know. I just like my sack to be full. */
      GOTO golden_sands_orange__full_sack
  END

  IF ~~ BEGIN golden_sands_orange__fenberries
    SAY @3030235 /* Fenberries. The "crimson gold" o' Ne'erwinter, ye mean? Cheap, those fenberries? Har har! Silly capt'n... */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN golden_sands_orange__gooseberries
    SAY @3030236 /* Mmm. Nah bad. Ye e'er though o' startin' a liqie business? Ye'd be good at that. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN golden_sands_orange__full_sack
    SAY @3030237 /* So why naggin'? Jus' 'ave something else. */
    IF ~~ THEN GOTO liquors_more
  END

  IF ~~ BEGIN golden_sands_orange__nah
    SAY @3030241 /* Nah need fer any. 'Tis good as it is. */
    IF ~~ THEN GOTO liquors_more
  END
END


//
//  4. Iriaeboran Ale
//

APPEND 6WSHITJ
  IF ~~ BEGIN iriaeboran_ale
    SAY @3040001 /* Mmm. "Bite o' the north winds", they call it. It quite mild though, 'tis jus' the aftertaste... it cold. */

    // 1 in Crooked Crane, 15 in Mithrest, AreaCheck("AR0704")

    IF ~
      !AreaCheck("AR0704")
      !PartyGoldLT(1)
    ~ THEN
      REPLY @3040002 /* Mild, but with ice-cold aftertaste. Sounds intriguing. */
      DO ~
        TakePartyGold(1)
        DestroyGold(1)
        GiveItemCreate("_6WDR04", Player1, 0, 0, 0)
      ~
      GOTO iriaeboran_ale__bought

    IF ~
      AreaCheck("AR0704")
      !PartyGoldLT(15)
    ~ THEN
      REPLY @3040002 /* Mild, but with ice-cold aftertaste. Sounds intriguing. */
      DO ~
        TakePartyGold(15)
        DestroyGold(15)
        GiveItemCreate("_6WDR04", Player1, 0, 0, 0)
      ~
      GOTO iriaeboran_ale__bought

    IF ~~ THEN
      REPLY @3040003 /* As cool as it sounds, we can't afford it. */
      GOTO iriaeboran_ale__no_money

    IF ~~ THEN
      REPLY @3040004 /* If I wanted to feel like I'm in Icewind Dale, I would simply go there. */
      GOTO iriaeboran_ale__nah
  END

  IF ~~ BEGIN iriaeboran_ale__bought
    SAY @3040020 /* As much as the north itself, aye it be. Good choice. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN iriaeboran_ale__no_money
    SAY @3040030 /* As broke as orcs in Spine o' the World, we be, aye. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN iriaeboran_ale__nah
    SAY @3040040 /* If winter be yer thin'. Jus' a sip be enough fer me. */
    IF ~~ THEN GOTO liquors_more
  END
END


//
//  5. Luiren's Best Ale
//

APPEND 6WSHITJ
  IF ~~ BEGIN luirens_best_ale
    SAY @3050001 /* From halflings, fer halflings. Black 'n heavy like the darkest night, but the aftertaste be quite sweet. */

    IF ~
      !PartyGoldLT(3)
      Race(Player1,HALFLING)
    ~ THEN
      REPLY @3050002 /* "From halflings, for halflings", I like that. */
      DO ~
        TakePartyGold(3)
        DestroyGold(3)
        GiveItemCreate("_6WDR05", Player1, 0, 0, 0)
      ~
      GOTO luirens_best_ale__bought_halfling

    IF ~
      !PartyGoldLT(3)
      !Race(Player1,HALFLING)
    ~ THEN
      REPLY @3050003 /* Halflings must know the good stuff, I guess? */
      DO ~
        TakePartyGold(3)
        DestroyGold(3)
        GiveItemCreate("_6WDR05", Player1, 0, 0, 0)
      ~
      GOTO luirens_best_ale__bought

    IF ~~ THEN
      REPLY @3050004 /* Too bad the halflings won't give it away for free. */
      GOTO luirens_best_ale__no_money

    IF ~~ THEN
      REPLY @3050005 /* Black like a night? Doesn't sound convincing. */
      GOTO luirens_best_ale__nah
  END

  IF ~~ BEGIN luirens_best_ale__bought_halfling
    SAY @3050020 /* Aye, it nah disappoint, I tell ye. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN luirens_best_ale__bought
    SAY @3050030 /* Depends on the halflin'. If they from Turmish - probably nah. Otherwise they good. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN luirens_best_ale__no_money
    SAY @3050040 /* Ye think halflings nah needin' earnings or wha'? */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN luirens_best_ale__nah
    SAY @3050050 /* 'Tis nah fer everybody, I say. */
    IF ~~ THEN GOTO liquors_more
  END
END


//
//  6. Tanagyr's Ale
//

APPEND 6WSHITJ
  IF ~~ BEGIN tanagyrs_ale
    SAY @3060001 /* Oh, me black, black stout! Nothin' as reminds o' home like ye! So heavy, so malty... got it everywhere on the Moonsea 'n Dragon Coast, but nah so common here. */

    IF ~!PartyGoldLT(10)~ THEN
      REPLY @3060002 /* I always wondered what do Zentish drink. */
      DO ~
        TakePartyGold(10)
        DestroyGold(10)
        GiveItemCreate("_6WDR06", Player1, 0, 0, 0)
      ~
      GOTO tanagyrs_ale__bought

    IF ~~ THEN
      REPLY @3060003 /* As much as I'd like to know what do Zentish drink, I don't think we can afford it. */
      GOTO tanagyrs_ale__no_money

    IF ~~ THEN
      REPLY @3060004 /* Sorry, Shithri, but the "Zentish" label isn't really the best way to sell a drink. */
      GOTO tanagyrs_ale__nah
  END

  IF ~~ BEGIN tanagyrs_ale__bought
    SAY @3060020 /* Nah the best reason t' try, but good enough. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN tanagyrs_ale__no_money
    SAY @3060030 /* Aye, it be bit pricey here. Another time, mayhaps. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN tanagyrs_ale__nah
    SAY @3060040 /* Can't say I nah get ye. Shame though, it be really nice stout. */
    IF ~~ THEN GOTO liquors_more
  END
END


//
//  7. Alurlyath Wine
//

APPEND 6WSHITJ
  IF ~~ BEGIN alurlyath_wine
    SAY @3070001 /* Capt'n, please! 'Tis "Undermountain Alurlyath", famous green wine that be glowin' in the dark. Very romantic sweet one, they say. */

    IF ~~ THEN
      REPLY @3070002 /* Glows in the dark?  */
      GOTO alurlyath_wine__glows

    // 6 in Sea Bounty, 12 in Mithrest, AreaCheck("AR0704")

    IF ~
      !AreaCheck("AR0704")
      !PartyGoldLT(6)
    ~ THEN
      REPLY @3070003 /* Sounds unique, indeed. Let's take some. */
      DO ~
        TakePartyGold(6)
        DestroyGold(6)
        GiveItemCreate("_6WDR07", Player1, 0, 0, 0)
      ~
      GOTO alurlyath_wine__bought

    IF ~
      AreaCheck("AR0704")
      !PartyGoldLT(12)
    ~ THEN
      REPLY @3070003 /* Sounds unique, indeed. Let's take some. */
      DO ~
        TakePartyGold(12)
        DestroyGold(12)
        GiveItemCreate("_6WDR07", Player1, 0, 0, 0)
      ~
      GOTO alurlyath_wine__bought

    IF ~~ THEN
      REPLY @3070004 /* Its price is quite... unique too. */
      GOTO alurlyath_wine__no_money

    IF ~~ THEN
      REPLY @3070005 /* Green wine? As if that could taste good! */
      GOTO alurlyath_wine__nah
  END

  IF ~~ BEGIN alurlyath_wine__glows
    SAY @3070020 /* Aye! 'ave a look, capt'n. See that greenish-silver glimmer? */

    IF ~
      !AreaCheck("AR0704")
      !PartyGoldLT(6)
    ~ THEN
      REPLY @3070021 /* It really does glow! We must definitely take some. */
      DO ~
        TakePartyGold(6)
        DestroyGold(6)
        GiveItemCreate("_6WDR07", Player1, 0, 0, 0)
      ~
      GOTO alurlyath_wine__bought

    IF ~
      AreaCheck("AR0704")
      !PartyGoldLT(12)
    ~ THEN
      REPLY @3070021 /* It really does glow! We must definitely take some. */
      DO ~
        TakePartyGold(12)
        DestroyGold(12)
        GiveItemCreate("_6WDR07", Player1, 0, 0, 0)
      ~
      GOTO alurlyath_wine__bought

    IF ~~ THEN
      REPLY @3070022 /* It's very pretty... but also very pricey. */
      GOTO alurlyath_wine__no_money

    IF ~~ THEN
      REPLY @3070023 /* It glows GREEN. Who wants wine to glow GREEN? */
      GOTO alurlyath_wine__nah
  END

  IF ~~ BEGIN alurlyath_wine__bought
    SAY @3070030 /* *smirk* I knew ye be likin' that. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN alurlyath_wine__no_money
    SAY @3070040 /* Jus' the moon's glow fer us then, aye? */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN alurlyath_wine__nah
    SAY @3070050 /* Ye got anythin' against green, me capt'n? I hope nah. */
    IF ~~ THEN GOTO liquors_more
  END
END


//
//  8. Arabellan Wine
//

APPEND 6WSHITJ
  IF ~~ BEGIN arabellan_wine
    SAY @3080001 /* Oh, that dry one! Mmm, woodsy. Some berry in the background. Great fer braisin' boar. */

    // 7 in all but AreaCheck("AR0513"), where it's 13

    IF ~
      !AreaCheck("AR0513")
      !PartyGoldLT(7)
    ~ THEN
      REPLY @3080002 /* Taste of the forest then. Sounds good. */
      DO ~
        TakePartyGold(7)
        DestroyGold(7)
        GiveItemCreate("_6WDR08", Player1, 0, 0, 0)
      ~
      GOTO arabellan_wine__bought

    IF ~
      AreaCheck("AR0513")
      !PartyGoldLT(13)
    ~ THEN
      REPLY @3080002 /* Taste of the forest then. Sounds good. */
      DO ~
        TakePartyGold(13)
        DestroyGold(13)
        GiveItemCreate("_6WDR08", Player1, 0, 0, 0)
      ~
      GOTO arabellan_wine__bought

    IF ~~ THEN
      REPLY @3080003 /* I'd love some wine-braised boar. But you know, money. */
      GOTO arabellan_wine__no_money

    IF ~~ THEN
      REPLY @3080004 /* Cooking wine? Huh! */
      GOTO arabellan_wine__nah
  END

  IF ~~ BEGIN arabellan_wine__bought
    SAY @3080020 /* Nah exactly. But as close as Cormyrians get, aye. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN arabellan_wine__no_money
    SAY @3080030 /* Another time, capt'n. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN arabellan_wine__nah
    SAY @3080040 /* Cookin' and jus' drinkin'. Good both ways. But ye do ye. */
    IF ~~ THEN GOTO liquors_more
  END
END


//
//  9. Evermead
//

APPEND 6WSHITJ
  IF ~~ BEGIN evermead
    SAY @3090001 /* Pure gold 'n whatnah nobles say about it. Everythin' fancy: rose petals, cherries, orchid fruits - ye name it. */

    IF ~~ THEN
      REPLY @3090002 /* Orchid fruits? Do you mean vanilla? */
      GOTO evermead__vanila

    // 30 gp, but for AreaCheck("AR0513"), where it's 20 gp

    IF ~
      !AreaCheck("AR0513")
      !PartyGoldLT(30)
    ~ THEN
      REPLY @3090003 /* The noblest of liquors... how could I not try that at least once in my lifetime? */
      DO ~
        TakePartyGold(30)
        DestroyGold(30)
        GiveItemCreate("_6WDR09", Player1, 0, 0, 0)
      ~
      GOTO evermead__bought

    IF ~
      AreaCheck("AR0513")
      !PartyGoldLT(20)
    ~ THEN
      REPLY @3090003 /* The noblest of liquors... how could I not try that at least once in my lifetime? */
      DO ~
        TakePartyGold(20)
        DestroyGold(20)
        GiveItemCreate("_6WDR09", Player1, 0, 0, 0)
      ~
      GOTO evermead__bought

    IF ~~ THEN
      REPLY @3090004 /* I see its price is also... *grunt* ...noble. */
      GOTO evermead__no_money

    IF ~~ THEN
      REPLY @3090005 /* Sounds like just putting all the expensive stuff together. That can't be good. */
      GOTO evermead__nah
  END

  IF ~~ THEN BEGIN evermead__vanila
    SAY @3090020 /* Aye. "Vanilla". As I be sayin' - everythin' fancy. Prolly sun elf's idea, I say. */

    IF ~!PartyGoldLT(30)~ THEN
      REPLY @3090003 /* The noblest of liquors... how could I not try that at least once in my lifetime? */
      DO ~
        TakePartyGold(30)
        DestroyGold(30)
        GiveItemCreate("_6WDR09", Player1, 0, 0, 0)
      ~
      GOTO evermead__bought

    IF ~~ THEN
      REPLY @3090004 /* I see its price is also... *grunt* ...noble. */
      GOTO evermead__no_money

    IF ~~ THEN
      REPLY @3090005 /* Sounds like just putting all the expensive stuff together. That can't be good. */
      GOTO evermead__nah
  END

  IF ~~ BEGIN evermead__bought
    SAY @3090030 /* Huh, playin' noble<PRO_MANWOMAN> then? Ne'er thought o' ye like that, nay. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN evermead__no_money
    SAY @3090040 /* Aye. Costin' more than a good armor, aye it be! Har har! */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN evermead__nah
    SAY @3090050 /* They say 'tis fine stuff. But this bucko nah so sure ye're wrong on that one. */
    IF ~~ THEN GOTO liquors_more
  END
END


//
// 10. Westgate Wine
//

APPEND 6WSHITJ
  IF ~~ BEGIN westgate_wine
    SAY @3100001 /* Ho, ne'er gonna forget the Beef 'n Oysters Barnabas! But fits well wit' dwarvish stews too, that bold, crimson liqie, aye. */ 

    IF ~!PartyGoldLT(8)~ THEN
      REPLY @3100002 /* So basically one wine to rule all them beef dishes? Fantastic! */
      DO ~
        TakePartyGold(8)
        DestroyGold(8)
        GiveItemCreate("_6WDR10", Player1, 0, 0, 0)
      ~
      GOTO westgate_wine__bought

    IF ~~ THEN
      REPLY @3100003 /* I'm afraid it's either the wine or the beef for us... */
      GOTO westgate_wine__no_money

    IF ~~ THEN
      REPLY @3100004 /* Beef goes best with beer, not wine. We don't need it. */
      GOTO westgate_wine__nah
  END

  IF ~~ BEGIN westgate_wine__bought
    SAY @3100020 /* Now we only need a fine dwarvish cook t' prepare some stew, I say! */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN westgate_wine__no_money
    SAY @3100030 /* Let us get some coin then. Beef ain't in love wit' dry throats. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN westgate_wine__nah
    SAY @3100040 /* Says the land-lubber who ne'er had any specialty from the Sea o' the Fallen Stars. */
    IF ~~ THEN GOTO liquors_more
  END
END


//
// 11. Saerloonian Wine
//

APPEND 6WSHITJ
  IF ~~ BEGIN saerloonian_wine
    SAY @3110001 /* Precision, me capt'n. 'Tis Saerloonian Topaz, the amber one that combines nutty 'n fruity. Fine liqie, fits well wit' rabbit. But nah t' be confused wit' their red wine, Saerloonian Special Vat, or the famous glowin' white wine, Saerloonian Glowfire. */

    IF ~!PartyGoldLT(15)~ THEN
      REPLY @3110002 /* Nutty AND fruity? Consider me interested. */
      DO ~
        TakePartyGold(15)
        DestroyGold(15)
        GiveItemCreate("_6WDR11", Player1, 0, 0, 0)
      ~
      GOTO saerloonian_wine__bought

    IF ~~ THEN
      REPLY @3110003 /* Either way, we can't afford any of them, I'm afraid. */
      GOTO saerloonian_wine__no_money

    IF ~
      OR(3)
        Class(Player1,RANGER_ALL)
        Class(Player1,DRUID_ALL)
        Kit(Player1,BARBARIAN)
    ~ THEN
      REPLY @3110004 /* Rabbit need no wine. Just fire. */
      GOTO saerloonian_wine__nah_just_fire

    IF ~
    ~ THEN
      REPLY @3110005 /* Yellow wine used for game... doesn't sound very appetizing. */
      GOTO saerloonian_wine__nah_sounds_bad
  END

  IF ~~ BEGIN saerloonian_wine__bought
    SAY @3110020 /* Good choice. One o' the best Sembian wines, 'tis. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN saerloonian_wine__no_money
    SAY @3110030 /* Prolly, aye. The others be e'en more pricey. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN saerloonian_wine__nah_just_fire
    SAY @3110040 /* Betta jus' try it. Then tell this bucko if ye still think that. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN saerloonian_wine__nah_sounds_bad
    SAY @3110050 /* Ye clearly nah know much about rabbits, do ye? */
    IF ~~ THEN GOTO liquors_more
  END
END


//
// 12. Berduskan Wine
//

APPEND 6WSHITJ
  IF ~~ BEGIN berduskan_wine
    SAY @3120001 /* Oh, that one be plenty strong! Dark, heavy. Seems sweet at first but then stabs ye wit' its burnin' aftertaste, aye! Goes well wit' prawns 'n quail eggs. */

    // 14 gp in Trademeet, 8 gp in Mithrest (AR0704)

    IF ~
      !AreaCheck("AR0704")
      !PartyGoldLT(14)
    ~ THEN
      REPLY @3120002 /* Sweet? Check. Burning? Check. Strong? Check. */
      DO ~
        TakePartyGold(14)
        DestroyGold(14)
        GiveItemCreate("_6WDR12", Player1, 0, 0, 0)
      ~
      GOTO berduskan_wine__bought

    IF ~
      AreaCheck("AR0704")
      !PartyGoldLT(8)
    ~ THEN
      REPLY @3120002 /* Sweet? Check. Burning? Check. Strong? Check. */
      DO ~
        TakePartyGold(8)
        DestroyGold(8)
        GiveItemCreate("_6WDR12", Player1, 0, 0, 0)
      ~
      GOTO berduskan_wine__bought

    IF ~~ THEN
      REPLY @3120003 /* Almost as pricey as quail eggs and prawns themselves... */
      GOTO berduskan_wine__no_money

    IF ~
    ~ THEN
      REPLY @3120004 /* I'd prefer some more... subtle taste. */
      GOTO berduskan_wine__nah
  END

  IF ~~ BEGIN berduskan_wine__bought
    SAY @3120020 /* Har har! Now ye talkin' like a darin bucko, yarrr! */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN berduskan_wine__no_money
    SAY @3120030 /* Huh? Prawns be pricey? They 'ave lots o' them jus' south o' here. Port Kir, Tethyr. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN berduskan_wine__nah
    SAY @3120040 /* Oh, ain't ye? So fancy, ye be. */
    IF ~~ THEN GOTO liquors_more
  END
END


//
// 13. Winter Wine
//

APPEND 6WSHITJ
  IF ~~ BEGIN winter_wine
    SAY @3130001 /* That purplish one be made from grapes freezed on the vine. Can't nah be plenty strong, I say. Good fer desserts. */

    // 15 gp in Brynnlaw's Inn, 11 gp in Mithrest (AR0704)

    IF ~
      !AreaCheck("AR0704")
      !PartyGoldLT(15)
    ~ THEN
      REPLY @3130002 /* North dessert wine, no need to tell me more! */
      DO ~
        TakePartyGold(15)
        DestroyGold(15)
        GiveItemCreate("_6WDR13", Player1, 0, 0, 0)
      ~
      GOTO winter_wine__bought

    IF ~
      AreaCheck("AR0704")
      !PartyGoldLT(11)
    ~ THEN
      REPLY @3130002 /* North dessert wine, no need to tell me more! */
      DO ~
        TakePartyGold(11)
        DestroyGold(11)
        GiveItemCreate("_6WDR13", Player1, 0, 0, 0)
      ~
      GOTO winter_wine__bought

    IF ~~ THEN
      REPLY @3130003 /* Are these grapes freezed with gold flakes or something along those lines? */
      GOTO winter_wine__no_money

    IF ~
    ~ THEN
      REPLY @3130004 /* I don't eat desserts. */
      GOTO winter_wine__nah_desserts

    IF ~
    ~ THEN
      REPLY @3130005 /* Grapes need sun, not cold. */
      GOTO winter_wine__nah_grapes_need_sun
  END

  IF ~~ BEGIN winter_wine__bought
    SAY @3130020 /* Ho, so ye 'ave a sweet tooth, ain't ye? Good t' know. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN winter_wine__no_money
    SAY @3130030 /* 'Tis not so easy t' make wine o' frozen grapes, ye know. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN winter_wine__nah_desserts
    SAY @3130040 /* Quite common custom, I say. Lots o' sea dogs ain't too. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN winter_wine__nah_grapes_need_sun
    SAY @3130050 /* That why it so pricey, this wine. Nah so easy t' make wine o' frozen grapes. */
    IF ~~ THEN GOTO liquors_more
  END
END


//
// 14. Dragon's Beer
//

APPEND 6WSHITJ
  IF ~~ BEGIN dragons_beer
    SAY @3140001 /* Ye know how Cormyr has dragon in its coats o' arms? Few know Sembia has a dragon also. They be that proud o' this liqie. Nice foams, harsh flavor. Best one fer rye bread 'n cheese. */

    // 1 gp elsewhere, 9 in Mithrest (AR0704)

    IF ~
      !AreaCheck("AR0704")
      !PartyGoldLT(1)
    ~ THEN
      REPLY @3140002 /* Rye bread, cheese and beer - what else would I need? */
      DO ~
        TakePartyGold(1)
        DestroyGold(1)
        GiveItemCreate("_6WDR14", Player1, 0, 0, 0)
      ~
      GOTO dragons_beer__bought

    IF ~
      AreaCheck("AR0704")
      !PartyGoldLT(9)
    ~ THEN
      REPLY @3140002 /* Rye bread, cheese and beer - what else would I need? */
      DO ~
        TakePartyGold(9)
        DestroyGold(9)
        GiveItemCreate("_6WDR14", Player1, 0, 0, 0)
      ~
      GOTO dragons_beer__bought

    IF ~~ THEN
      REPLY @3140003 /* Sounds very satisfying, but we can't really afford that kind of thing. Not unless we stay at countryside. */
      GOTO dragons_beer__no_money

    IF ~
    ~ THEN
      REPLY @3140004 /* Cheese goes with wine, not beer. */
      GOTO dragons_beer__nah
  END

  IF ~~ BEGIN dragons_beer__bought
    SAY @3140020 /* Har har, nothin' more at all, me capt'n. That be the comfy meal we all need. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN dragons_beer__no_money
    SAY @3140030 /* Why nah then? We could stay fer a few days. Some time. Some time. */
    IF ~~ THEN GOTO liquors_more
  END
  IF ~~ BEGIN dragons_beer__nah
    SAY @3140040 /* I guess ye ne'er had the Sembian cheese then. */
    IF ~~ THEN GOTO liquors_more
  END
END



//
// 90. Elminster's Beer
//

APPEND 6WSHITJ
  IF ~~ BEGIN elminsters_beer
    SAY @3900001 /* Avast, me capt'n! I hope ye jus' jestin' - or be ye really wantin' that dark, cloudy slop? */

    IF ~~ THEN
      REPLY @3900002 /* What's wrong with it? */
      GOTO elminsters_beer__whats_wrong

    IF ~~ THEN
      REPLY @3900003 /* I mean - Elminster can't be wrong on that one, can he? */
      GOTO elminsters_beer__elminster

    IF ~~ THEN
      REPLY @3900004 /* Relax, Shithri, it's a joke. Have some faith in your captain! */
      GOTO elminsters_beer__joke
  END

  IF ~~ THEN BEGIN elminsters_beer__whats_wrong
    SAY @3900020 /* Capt'n. Fer all the devils - if ye really want t' drink that, jus' mix water wit' tar 'n smoke that o'er rotten wood. That be how it tastes. */

    IF ~~ THEN
      REPLY @3900021 /* So dark, thick, cloudy and with smokey aftertaste? Doesn't sound that bad if you ask me. */
      GOTO elminsters_beer__not_so_bad

    IF ~~ THEN
      REPLY @3900003 /* I mean - Elminster can't be wrong on that one, can he? */
      GOTO elminsters_beer__elminster

    IF ~~ THEN
      REPLY @3900022 /* Well, if you say so... */
      GOTO liquors_more
  END

  IF ~~ THEN BEGIN elminsters_beer__not_so_bad
    SAY @3900023 /* Nay. No, nay, ne'er. No nay ne'er no more speak o' that trash o' a beer when this bucko be around! *spits* */
    // You know that Irish folk song?
    // https://www.youtube.com/watch?v=bYPuz0EYPSo

    IF ~~ THEN
      REPLY @3900090 /* Got it. */
      GOTO liquors_more

    IF ~~ THEN
      REPLY @3900091 /* Ok, I won't SPEAK of it. But we're still taking a bottle. */
      DO ~
        TakePartyGold(1)
        DestroyGold(1)
        GiveItemCreate("_6WDR90", Player1, 0, 0, 0)
      ~
      GOTO elminsters_beer__swab

    IF ~PartyGoldLT(1)~ THEN GOTO liquors_more
  END

  IF ~~ THEN BEGIN elminsters_beer__swab
    SAY @3900099 /* *gulp* Wha' a swab... */
    IF ~~ THEN EXIT
  END

  IF ~~ THEN BEGIN elminsters_beer__elminster
    SAY @3900030 /* Capt'n. Oh me capt'n... ye e'er met Elminster? */

    IF ~~ THEN
      REPLY @3900031 /* Well, actually... */
      GOTO elminsters_beer__elminster_nah

    IF ~~ THEN
      REPLY @3900032 /* What if I did? */
      GOTO elminsters_beer__elminster_nah

    IF ~~ THEN
      REPLY @3900033 /* Your point being? */
      GOTO elminsters_beer__elminster_nah
  END

  IF ~~ THEN BEGIN elminsters_beer__elminster_nah
    SAY @3900034 /* They call it "Elminster's Choice" jus' t' sell it, capt'n. The guy ne'er drinks it. */

    IF ~~ THEN
      REPLY @3900035 /* That's just...! */
      GOTO elminsters_beer__infuriating

    IF ~~ THEN
      REPLY @3900036 /* Could've expected that, I suppose. */
      GOTO elminsters_beer__couldve_expected

    IF ~~ THEN
      REPLY @3900004 /* Relax, Shithri, it's a joke. Have some faith in your captain! */
      GOTO elminsters_beer__joke
  END

  IF ~~ THEN BEGIN elminsters_beer__infuriating
    SAY @3900037 /* Aye. It be. */

    IF ~~ THEN
      REPLY @3900092 /* You convinced me. */
      GOTO liquors_more

    IF ~~ THEN
      REPLY @3900093 /* Well, even if Elminster doesn't really drink it, we'll still take a bottle. */
      DO ~
        TakePartyGold(1)
        DestroyGold(1)
        GiveItemCreate("_6WDR90", Player1, 0, 0, 0)
      ~
      GOTO elminsters_beer__swab

    IF ~PartyGoldLT(1)~ THEN GOTO liquors_more
  END
  IF ~~ THEN BEGIN elminsters_beer__couldve_expected
    SAY @3900038 /* See? Works well fer them bastards. */

    IF ~~ THEN
      REPLY @3900092 /* You convinced me. */
      GOTO liquors_more

    IF ~~ THEN
      REPLY @3900093 /* Well, even if Elminster doesn't really drink it, we'll still take a bottle. */
      DO ~
        TakePartyGold(1)
        DestroyGold(1)
        GiveItemCreate("_6WDR90", Player1, 0, 0, 0)
      ~
      GOTO elminsters_beer__swab

    IF ~PartyGoldLT(1)~ THEN GOTO liquors_more
  END

  IF ~~ THEN BEGIN elminsters_beer__joke
    SAY @3900040 /* Har har, wha' savage joke it be, me capt'n! Ye got this bucko right here, aye ye did! */
    IF ~~ THEN GOTO liquors_more
  END
END


//
// Seaman-related dialogues
//

// ShithriDrinksActive:
//  * 1 - still gathering the liquors
//  * 2 - agreed to the duel
//  * 3 - denied the duel, no coming back!
//  * 4 - during duel
//  * 5 - after duel
//
// ShithriDrinksStakes:
//  * 0 - no info on stakes
//  * 1 - if you win, "you pick what you want"
//  * 2 - equal stakes, i.e. 5000 gp

// If Shithri's not in the party, location or can't talk,
// the seaman has nothing interesting to say.
APPEND 6WPIRDR
  IF ~
    !Global("6W#ShithriDrinksActive","GLOBAL",2)
    !IsValidForPartyDialog("6WSHITHRI")
  ~ THEN 6W#ShithriDrinksSeaman__initial_nah
    SAY @5000000 /* Nah talkin' t' ye lubbers. Pff! *gulp* */
    IF ~~ THEN EXIT
  END
END

CHAIN IF ~
  Global("6W#ShithriDrinksActive","GLOBAL",1)
  IsValidForPartyDialog("6WSHITHRI")
  InMyArea(Player1)
  InMyArea("THUMB")
~ THEN 6WPIRDR 6W#ShithriDrinksSeaman__initial
  @5000010 /* Oy, look who's there! Ain't that lil Shithri? */
  == 6WSHITJ
  @5000011 /* Franky the Eye-Popper? Be that ye? How'd ye been, matey? */
  // If you couldn't tell: the person who inspired Popeye's author
  // was a Pole, Frank "Rocky" Fiegel.
  //
  // The Polish version is Ferdek instead, as the early translations
  // of Popeye comis strips translated him either as „żeglarz Kubuś”
  // (Jake the sailor) or Ferdek (Freddie).
  == 6WPIRDR
  @5000012 /* Nah bad, nah bad. Been sailin' between Amn 'n Calimshan quite lot these days. */
  == 6WPIRDR
  @5000013 /* Huh. Betta than ye, it seems. Who's that lubber o'er there? */
  == 6WSHITJ
  @5000014 /* That? That be me capt'n. Capt'n, meet Franky. */
  == 6WPIRDR
  @5000015 /* "Capt'n"? Har har! That a good one! */
  =
  @5000016 /* Shithri, me lil rapscallion. Why nah ye join me instead of playin' wit' that lubber? */
  == 6WSHITJ
  @5000017 /* Capt'n be alright, Franky. */
  == 6WPIRDR
  @5000018 /* Aye, sure thing! That lubber who had dwarvish grog once or twice 'n already thinks <PRO_HIMHER>'s a sailor, har har! Shithri, ye lil jester, 'ave some mercy fer an old man's stomach! */
END
  IF ~~ THEN
    REPLY @5000020 /* Nice to meet you too, Franky. I'm <CHARNAME>. */
    GOTO 6W#ShithriDrinksSeaman__nice_to_meet_you
  IF ~~ THEN
    REPLY @5000021 /* Not to brag, but I'm actually quite an expert when it comes to liquors. */
    GOTO 6W#ShithriDrinksSeaman__im_expert
  IF ~~ THEN
    REPLY @5000022 /* Let's not waste our time on that man. We have stuff to do. */
    GOTO 6W#ShithriDrinksSeaman__wasting_time

APPEND 6WPIRDR
  // Note: the quest ends here!
  IF ~~ THEN 6W#ShithriDrinksSeaman__wasting_time
    SAY @5000030 /* I bet ye do, lubber! Pff. Shithri, mate, if ye reconsider - ye know where t' find me. */
    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriDrinksActive","GLOBAL",3)
      ~
      EXIT
  END

  IF ~~ THEN 6W#ShithriDrinksSeaman__im_expert
    SAY @5000035 /* Ho? 'n wha' makes ye think that? */

    IF ~~ THEN
      REPLY @5000036 /* Well, I mean: how difficult can it be to be better than someone like you? */
      GOTO 6W#ShithriDrinksSeaman__better_than_you

    IF ~~ THEN
      REPLY @5000041 /* That is no concern of yours. */
      GOTO 6W#ShithriDrinksSeaman__not_your_concern
  END

  IF ~~ THEN 6W#ShithriDrinksSeaman__nice_to_meet_you
    SAY @5000040 /* Oh, 'n who be ye, huh? */

    IF ~~ THEN
      REPLY @5000041 /* That is no concern of yours. */
      GOTO 6W#ShithriDrinksSeaman__not_your_concern

    IF ~~ THEN
      REPLY @5000042 /* You heard my trusty bosun. I'm her captain. */
      GOTO 6W#ShithriDrinksSeaman__her_captain

    IF ~~ THEN
      REPLY @5000043 /* I'm someone who knows <PRO_HISHER> liquors better than you do. */
      GOTO 6W#ShithriDrinksSeaman__better_than_you
  END

  IF ~~ THEN 6W#ShithriDrinksSeaman__not_your_concern
    SAY @5000050 /* Aye, it ain't. *gulp* Good luck wit' yer lubbin' then. Shithri, mate, if ye reconsider - ye know where t' find me. */
    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriDrinksActive","GLOBAL",3)
      ~
      EXIT
  END

  IF ~~ THEN 6W#ShithriDrinksSeaman__her_captain
    SAY @5000060 /* Ye sure be! I bet ye got lotta experience on the sea, har har. */

    IF ~~ THEN
      REPLY @5000041 /* That is no concern of yours. */
      GOTO 6W#ShithriDrinksSeaman__not_your_concern

    IF ~~ THEN
      REPLY @5000061 /* Well, I bet even a land-lubber like me knows my liquors better than you do. */
      GOTO 6W#ShithriDrinksSeaman__better_than_you
  END

  IF ~~ THEN 6W#ShithriDrinksSeaman__better_than_you
    SAY @5000070 /* Wha' ye said, ye swab?! */

    IF ~~ THEN
      REPLY @5000071 /* What you heard, dog. I bet I know my liquors better than you do. */
      GOTO 6W#ShithriDrinksSeaman__better_than_you_1

    IF ~~ THEN
      REPLY @5000072 /* I said what I said. */
      GOTO 6W#ShithriDrinksSeaman__better_than_you_1
  END

  IF ~~ THEN 6W#ShithriDrinksSeaman__better_than_you_1
    SAY @5000080 /* I warn ye, ye bildge rat. I nah be called Franky the Eye-Popper fer naught. */

    IF ~~ THEN
      REPLY @5000081 /* Oh? So you admit you can only beat me by fist and not by skill? */
      GOTO 6W#ShithriDrinksSeaman__better_than_you_2

    IF ~~ THEN
      REPLY @5000082 /* Bring it on, Franky the Popped-Eye! */
      DO ~
        SetGlobal("6W#ShithriDrinksActive","GLOBAL",3)
        Enemy()
        Attack(Player1)
      ~
      EXIT
  END
END

CHAIN 6WPIRDR 6W#ShithriDrinksSeaman__better_than_you_2
  @5000085 /* Ho! I see ye got a big mouth. Fine, let's see if ye as good as ye say. The Thumb be judgin'. */
  == THUMB
  @5000086 /* Wha' the Thumb hears? A drinkin' duel, be it? */
  == 6WPIRDR
  @5000087 /* So wha' ye say, Shithri's "cap'tn"? */
END
  IF ~~ THEN
    REPLY @5000090 /* Fine by me. */
    GOTO 6W#ShithriDrinksSeaman__accept
  IF ~~ THEN
    REPLY @5000091 /* I won't waste my time on you. */
    GOTO 6W#ShithriDrinksSeaman__all_talk

APPEND 6WPIRDR
  IF ~~ THEN 6W#ShithriDrinksSeaman__all_talk
    SAY @5000095 /* Huh! Thought so - ye jus' all talk. *gulp* Good luck wit' yer lubbin' then. Shithri, matey, if ye reconsider - ye know where t' find me. */
    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriDrinksActive","GLOBAL",3)
      ~
      EXIT
  END

  IF ~~ THEN 6W#ShithriDrinksSeaman__accept
    SAY @5000100 /* Good! *gulp* Here be me rules: I try three o' yers, ye try three o' mine. I win - ye gimme some nice, round figure. Like 5000 gold pieces, says me. Fair enough? */

    IF ~~ THEN
      REPLY @5000101 /* Sure. I accept your rules. */
      DO ~
        SetGlobal("6W#ShithriDrinksActive","GLOBAL",2)
      ~
      GOTO 6W#ShithriDrinksSeaman__accept_rules

    IF ~~ THEN
      REPLY @5000102 /* And what if I win? */
      DO ~
        SetGlobal("6W#ShithriDrinksStakes","GLOBAL",1)
      ~
      GOTO 6W#ShithriDrinksSeaman__what_if_i_win

    IF ~~ THEN
      REPLY @5000103 /* After giving it a second thought, I won't waste my time on you. */
      GOTO 6W#ShithriDrinksSeaman__all_talk
  END

  IF ~~ THEN 6W#ShithriDrinksSeaman__what_if_i_win
    SAY @5000110 /* If ye win? Har har! If that e'er happens, ye pick wha' ye want. */

    IF ~~ THEN
      REPLY @5000111 /* Fine. I accept your rules. */
      DO ~
        SetGlobal("6W#ShithriDrinksActive","GLOBAL",2)
      ~
      GOTO 6W#ShithriDrinksSeaman__accept_rules

    IF ~~ THEN
      REPLY @5000112 /* Make it 5000 gold too and we're fine. */
      DO ~
        SetGlobal("6W#ShithriDrinksStakes","GLOBAL",2)
      ~
      EXTERN ~6WSHITJ~ 6W#ShithriDrinksSeaman__shithri_stake_rethink

    IF ~~ THEN
      REPLY @5000103 /* After giving it a second thought, I won't waste my time on you. */
      GOTO 6W#ShithriDrinksSeaman__all_talk
  END
END

APPEND 6WSHITJ
  IF ~~ THEN 6W#ShithriDrinksSeaman__shithri_stake_rethink
    SAY @5000120 /* Capt'n? May I 'ave this bucko talk t' ye fer a moment? */
    =
    @5000121 /* Franky be plenty strong, though he nah look like it. Some say it cause o' how much spinach he eats, but I nah believe that. He prolly be 'avin' some item that makes 'im strong. */

    IF ~~ THEN
      REPLY @5000122 /* Like gloves or belt? */
      // ;)
      GOTO 6W#ShithriDrinksSeaman__shithri_like_gloves_or_belt

    IF ~~ THEN
      REPLY @5000123 /* Doesn't matter. 5000 gold pieces is a fair reward. */
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksSeaman__same_stake
  END

  IF ~~ THEN 6W#ShithriDrinksSeaman__shithri_like_gloves_or_belt
    SAY @5000125 /* Aye. Somethin' o' that kind. */

    IF ~~ THEN
      REPLY @5000126 /* Well, in that case... Hey, Franky! I will pick what I want then I win, after all. I accept your rules. */
      DO ~
        SetGlobal("6W#ShithriDrinksActive","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksSeaman__accept_rules

    IF ~~ THEN
      REPLY @5000123 /* Doesn't matter. 5000 gold pieces is a fair reward. */
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksSeaman__same_stake
  END
END

APPEND 6WPIRDR
  IF ~~ THEN 6W#ShithriDrinksSeaman__same_stake
    SAY @5000130 /* Could be, aye. 5000 gold pieces t' ye if ye e'er win. Deal? */

    IF ~~ THEN
      REPLY @5000111 /* Fine. I accept your rules. */
      DO ~
        SetGlobal("6W#ShithriDrinksActive","GLOBAL",2)
        SetGlobal("6W#ShithriDrinksStakes","GLOBAL",2)
      ~
      GOTO 6W#ShithriDrinksSeaman__accept_rules

    IF ~~ THEN
      REPLY @5000103 /* After giving it a second thought, I won't waste my time on you. */
      GOTO 6W#ShithriDrinksSeaman__all_talk
  END

  IF ~~ THEN 6W#ShithriDrinksSeaman__accept_rules
    SAY @5000140 /* Ready? */

    IF ~
      !GlobalLT("6W#ShithriDrinksHasUniqueDrinks","GLOBAL",3)
      !PartyGoldLT(5000)
    ~ THEN
      REPLY @5000141 /* When you are. */
      GOTO 6W#ShithriDrinksDuel__start

    IF ~PartyGoldLT(5000)~ THEN
      REPLY @5000142 /* Let me just gather my gold. */
      GOTO 6W#ShithriDrinksSeaman__take_your_time

    IF ~~ THEN
      REPLY @5000143 /* Let me just gather my collection. */
      GOTO 6W#ShithriDrinksSeaman__take_your_time
  END

  IF ~~ THEN 6W#ShithriDrinksSeaman__take_your_time
    SAY @5000150 /* Aye, take yer time. I ain't wanna hear ye complain ye got nah chance. */
    IF ~~ THEN EXIT
  END
END

APPEND 6WPIRDR
  // After agreeing to the duel.
  IF ~
    IsGabber(Player1)
    Global("6W#ShithriDrinksActive","GLOBAL",2)
    InMyArea("THUMB")
  ~ THEN 6W#ShithriDrinksSeaman__ready
    SAY @5000160 /* Oy, lubber. Ready fer the duel yet? */

    IF ~
      !GlobalLT("6W#ShithriDrinksHasUniqueDrinks","GLOBAL",3)
      !PartyGoldLT(5000)
    ~ THEN
      REPLY @5000161 /* When you are. */
      GOTO 6W#ShithriDrinksDuel__start

    IF ~~ THEN
      REPLY @5000162 /* No, not yet. */
      GOTO 6W#ShithriDrinksSeaman__take_your_time
  END
END

//
// The actual duel!
//

CHAIN 6WPIRDR 6W#ShithriDrinksDuel__start
  @5000200 /* Oy, The Thumb! Come o'er 'ere! */
  == THUMB
  @5000201 /* Hehe. Listen y'all! Ye don't be seein' that often - a drinkin' duel 'ere in Sea's Bounty! */
  DO ~
    SetGlobal("6W#ShithriDrinksActive","GLOBAL",4)
    SetGlobal("6W#ShithriDrinksStarting","GLOBAL",1)
  ~
EXIT

APPEND THUMB
  IF WEIGHT #-1 ~
    Global("6W#ShithriDrinksActive","GLOBAL",4)
  ~ THEN 6W#ShithriDrinksDuel__start_thumb
    SAY @5000210 /* Betta be listenin' good, folks! These two will now be... */

    // similar to how it's done in the original BG2, it's a priority queue:
    // only one character speaks, depending on which is available:
    // 1. Korgan
    // 2. Dorn
    // 3. Shithri
    // 4. Franky the Eye-Popper (always present)
    // Can't really use interjections here, as the state isn't there yet.
    //TODO: verify
    IF ~~ THEN
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__start_pirdr
    IF ~IsValidForPartyDialog("6WSHITHRI")~ THEN
      EXTERN ~6WSHITJ~ 6W#ShithriDrinksDuel__start_shithri
    IF ~IsValidForPartyDialog("Dorn")~ THEN
      EXTERN ~DORNJ~ 6W#ShithriDrinksDuel__start_dorn
    IF ~IsValidForPartyDialog("Korgan")~ THEN
      EXTERN ~KORGANJ~ 6W#ShithriDrinksDuel__start_korgan
  END
END

APPEND KORGANJ
  IF ~~ THEN 6W#ShithriDrinksDuel__start_korgan
    SAY @5000211 /* Be quick with it, ye hooker! We're waiting! */
    IF ~~ EXTERN ~THUMB~ 6W#ShithriDrinksDuel__start_thumb_1
  END
END
APPEND DORNJ
  IF ~~ THEN 6W#ShithriDrinksDuel__start_dorn
    SAY @5000212 /* Too much talking, not enough drinking! */
    IF ~~ EXTERN ~THUMB~ 6W#ShithriDrinksDuel__start_thumb_1
  END
END
APPEND 6WSHITJ
  IF ~~ THEN 6W#ShithriDrinksDuel__start_shithri
    SAY @5000213 /* Oy, ye gonna flappin' yer gums, leavin' 'em throats-dry? Or let 'em 'ave their duel already, yarrr? */
    IF ~~ EXTERN ~THUMB~ 6W#ShithriDrinksDuel__start_thumb_1
  END
END
APPEND 6WPIRDR
  IF ~~ THEN 6W#ShithriDrinksDuel__start_pirdr
    SAY @5000214 /* Oi, I ain't THAT patient, mate. My throat's dry. */
    IF ~~ EXTERN ~THUMB~ 6W#ShithriDrinksDuel__start_thumb_1
  END
END

CHAIN THUMB 6W#ShithriDrinksDuel__start_thumb_1
  @5000220 /* Me folks! Wit'out nah more yappin': hello an' welcome our contestants... */
  == SBSLUM01 IF ~InMyArea("SBSLUM01")~ // nobleman
  @5000221 /* We know them already! */
  == SBWENCH IF ~InMyArea("SBWENCH")~ // wench
  @5000222 /* Just begin already, let them taste the wine! */
  == THUMB
  @5000225 /* O' course, o' course. First goes our first-timer, <CHARNAME>! */
END ~THUMB~ 6W#ShithriDrinksDuel__pick_drink

APPEND THUMB
  IF ~~ THEN 6W#ShithriDrinksDuel__pick_drink
    SAY @5000226 /* Pick a drink fer Franky t' guess. */

    // an answer for each possible liquor
    IF ~
      PartyHasItem("_6WDR00")
      GlobalLT("6W#ShithriDrinksHasDrink00","GLOBAL",2)
    ~ THEN
      REPLY @6000000 /* Bitter Black Ale. */
      DO ~
        RemoveHasItem("_6WDR00")
        SetGlobal("6W#ShithriDrinksHasDrink00","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__00

    IF ~
      PartyHasItem("_6WDR01")
      GlobalLT("6W#ShithriDrinksHasDrink01","GLOBAL",2)
    ~ THEN
      REPLY @6000010 /* Shadowdark Ale. */
      DO ~
        RemoveHasItem("_6WDR01")
        SetGlobal("6W#ShithriDrinksHasDrink01","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__01

    IF ~
      PartyHasItem("_6WDR02")
      GlobalLT("6W#ShithriDrinksHasDrink02","GLOBAL",2)
    ~ THEN
      REPLY @6000020 /* Suz-Ale. */
      DO ~
        RemoveHasItem("_6WDR02")
        SetGlobal("6W#ShithriDrinksHasDrink02","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__02

    IF ~
      PartyHasItem("_6WDR03a")
      GlobalLT("6W#ShithriDrinksHasDrink03a","GLOBAL",2)
    ~ THEN
      REPLY @6000030 /* Golden Sands Basic. */
      DO ~
        RemoveHasItem("_6WDR03a")
        SetGlobal("6W#ShithriDrinksHasDrink03a","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__03a

    IF ~
      PartyHasItem("_6WDR03b")
      GlobalLT("6W#ShithriDrinksHasDrink03b","GLOBAL",2)
    ~ THEN
      REPLY @6000031 /* Golden Sands Gold. */
      DO ~
        RemoveHasItem("_6WDR03b")
        SetGlobal("6W#ShithriDrinksHasDrink03b","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__03b

    IF ~
      PartyHasItem("_6WDR03c")
      GlobalLT("6W#ShithriDrinksHasDrink03c","GLOBAL",2)
    ~ THEN
      REPLY @6000032 /* Golden Sands Orange. */
      DO ~
        RemoveHasItem("_6WDR03c")
        SetGlobal("6W#ShithriDrinksHasDrink03c","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__03c

    IF ~
      PartyHasItem("_6WDR04")
      GlobalLT("6W#ShithriDrinksHasDrink04","GLOBAL",2)
    ~ THEN
      REPLY @6000040 /* Iriaeboran North Brew. */
      DO ~
        RemoveHasItem("_6WDR04")
        SetGlobal("6W#ShithriDrinksHasDrink04","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__04

    IF ~
      PartyHasItem("_6WDR05")
      GlobalLT("6W#ShithriDrinksHasDrink05","GLOBAL",2)
    ~ THEN
      REPLY @6000050 /* Luiren's Best Ale. */
      DO ~
        RemoveHasItem("_6WDR05")
        SetGlobal("6W#ShithriDrinksHasDrink05","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__05

    IF ~
      PartyHasItem("_6WDR06")
      GlobalLT("6W#ShithriDrinksHasDrink06","GLOBAL",2)
    ~ THEN
      REPLY @6000060 /* Tanagyr's Ale. */
      DO ~
        RemoveHasItem("_6WDR06")
        SetGlobal("6W#ShithriDrinksHasDrink06","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__06

    IF ~
      PartyHasItem("_6WDR07")
      GlobalLT("6W#ShithriDrinksHasDrink07","GLOBAL",2)
    ~ THEN
      REPLY @6000070 /* Undermountain Alurlyath. */
      DO ~
        RemoveHasItem("_6WDR07")
        SetGlobal("6W#ShithriDrinksHasDrink07","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__07

    IF ~
      PartyHasItem("_6WDR08")
      GlobalLT("6W#ShithriDrinksHasDrink08","GLOBAL",2)
    ~ THEN
      REPLY @6000080 /* Arabellan Dry. */
      DO ~
        RemoveHasItem("_6WDR08")
        SetGlobal("6W#ShithriDrinksHasDrink08","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__08

    IF ~
      PartyHasItem("_6WDR09")
      GlobalLT("6W#ShithriDrinksHasDrink09","GLOBAL",2)
    ~ THEN
      REPLY @6000090 /* Evermead. */
      DO ~
        RemoveHasItem("_6WDR09")
        SetGlobal("6W#ShithriDrinksHasDrink09","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__09

    IF ~
      PartyHasItem("_6WDR10")
      GlobalLT("6W#ShithriDrinksHasDrink10","GLOBAL",2)
    ~ THEN
      REPLY @6000100 /* Westgate Ruby. */
      DO ~
        RemoveHasItem("_6WDR10")
        SetGlobal("6W#ShithriDrinksHasDrink10","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__10

    IF ~
      PartyHasItem("_6WDR11")
      GlobalLT("6W#ShithriDrinksHasDrink11","GLOBAL",2)
    ~ THEN
      REPLY @6000110 /* Saerloonian Topaz. */
      DO ~
        RemoveHasItem("_6WDR11")
        SetGlobal("6W#ShithriDrinksHasDrink11","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__11

    IF ~
      PartyHasItem("_6WDR12")
      GlobalLT("6W#ShithriDrinksHasDrink12","GLOBAL",2)
    ~ THEN
      REPLY @6000120 /* Berduskan Dark. */
      DO ~
        RemoveHasItem("_6WDR12")
        SetGlobal("6W#ShithriDrinksHasDrink12","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__12

    IF ~
      PartyHasItem("_6WDR13")
      GlobalLT("6W#ShithriDrinksHasDrink13","GLOBAL",2)
    ~ THEN
      REPLY @6000130 /* Winter Wine. */
      DO ~
        RemoveHasItem("_6WDR13")
        SetGlobal("6W#ShithriDrinksHasDrink13","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__13

    IF ~
      PartyHasItem("_6WDR14")
      GlobalLT("6W#ShithriDrinksHasDrink14","GLOBAL",2)
    ~ THEN
      REPLY @6000140 /* Dragon's Beer. */
      DO ~
        RemoveHasItem("_6WDR14")
        SetGlobal("6W#ShithriDrinksHasDrink14","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__14

    IF ~
      PartyHasItem("_6WDR90")
      GlobalLT("6W#ShithriDrinksHasDrink90","GLOBAL",2)
    ~ THEN
      REPLY @6000900 /* Elminster's Choice. */
      DO ~
        RemoveHasItem("_6WDR90")
        SetGlobal("6W#ShithriDrinksHasDrink90","GLOBAL",2)
      ~
      EXTERN ~6WPIRDR~ 6W#ShithriDrinksDuel__round_1a__90
  END
END


APPEND 6WPIRDR
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__00
    SAY @5010000 /* *sniffs* *sips* */
    =
    @5010001 /* Heavy. Black, wit' deep brown foam. Huh! Easy. It's Arabellan Bitter Black. */

    IF ~~ THEN
      DO ~
        IncreaseGlobal("6#ShithriDrinksPirPoints","GLOBAL",1)
      ~
      //TODO: to round 1b, with Player1 guessing - with point
      EXIT
  END
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__01
    SAY @5010100 /* *sniffs* *sips* */
    =
    @5010101 /* Smells o' cloves. Cloudy an' bubblin'. Cremy. It's, obviously, Shadowdark Ale! */

    IF ~~ THEN
      DO ~
        IncreaseGlobal("6#ShithriDrinksPirPoints","GLOBAL",1)
      ~
      //TODO: to round 1b, with Player1 guessing - with point
      EXIT
  END
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__02
    SAY @5010200 /* *sniffs* *sips* */
    =
    @5010201 /* Hmmm... */
    =
    @5010202 /* This one's nah easy. Was I nah a common guest at Calimport, I'd 'ave nah idea... but I had it once or twice. What its name though... Pretty sure it comes from Cormyr's capital... */

    IF ~~ THEN
      //TODO: to round 1b, with Player1 guessing - no point
      EXIT
  END
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__03a
    SAY @5010300 /* *stares* Be it a trick? *sips* */
    =
    @5010301 /* Nay. Nah trick. It's really jus' Golden Sands Basic. How disappointin'. */

    IF ~~ THEN
      DO ~
        IncreaseGlobal("6#ShithriDrinksPirPoints","GLOBAL",1)
      ~
      //TODO: to round 1b, with Player1 guessing - with point
      EXIT
  END
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__03b
    SAY @5010310 /* *sniffs* *sips* */
    =
    @5010311 /* Har har! Givin' cacti brew t' me? Forgot I'm tradin' wit' Calimshan already, <PRO_BOYGIRL>? O' course it's Golden Sands Gold! */

    IF ~~ THEN
      DO ~
        IncreaseGlobal("6#ShithriDrinksPirPoints","GLOBAL",1)
      ~
      //TODO: to round 1b, with Player1 guessing - with point
      EXIT
  END
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__03c
    SAY @5010320 /* *sniffs* *sips* */
    =
    @5010321 /* Hmm. Pretty sure it's Golden Sands Brew... but wha' kinda? */
    =
    @5010322 /* Smells o' oranges. Sweet. Very light. But a bit acidic, nah jus' from orange. Currant, be it? */
    =
    @5010323 /* Me guess: Golden Sands Orange. */

    IF ~~ THEN
      DO ~
        IncreaseGlobal("6#ShithriDrinksPirPoints","GLOBAL",1)
      ~
      //TODO: to round 1b, with Player1 guessing - with point
      EXIT
  END
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__04
    SAY @5010400 /* *sniffs* *sips* */
    =
    @5010401 /* Brrr! Cold! Something from the North? Nah gonna lie though - I ain't knowin' that one. */

    IF ~~ THEN
      //TODO: to round 1b, with Player1 guessing - no point
      EXIT
  END
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__05
    SAY @5010500 /* *sniffs* *sips* */
    =
    @5010501 /* Smells like... smells. Black. Weird. Huh... Bet it's some halflin' or gnome one. No clue about theirs though. */

    IF ~~ THEN
      //TODO: to round 1b, with Player1 guessing - no point
      EXIT
  END
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__06
    SAY @5010600 /* *sniffs* */
    =
    @5010601 /* Ye 'ave good taste, lubber, I mus' admit. This be good old Black Tanagyr's. */

    IF ~~ THEN
      //TODO: to round 1b, with Player1 guessing - nwith point
      DO ~
        IncreaseGlobal("6#ShithriDrinksPirPoints","GLOBAL",1)
      ~
      EXIT
  END
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__07
    SAY @5010700 /* *stares* *sips* */
    =
    @5010701 /* Green. Glowing. Is it rich though? Hmm... mayhaps? Could it be... */
    =
    @5010702 /* Drow Green. Nah Ulaver, nay. But some kind of Drow Green. */

    IF ~~ THEN
      //TODO: to round 1b, with Player1 guessing - no point
      //TODO: Shithri, Thumb or clients commenting how it's popular among romantic people AND available in this tavern?
      EXIT
  END
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__08
    SAY @5010800 /* *smells* *sips* */
    =
    @5010801 /* Har har. Taste o' the forest, aye. Drunk it back on Inner Sea, drinkin' it 'ere. One o' me favs, Arabellan Dry. */

    IF ~~ THEN
      //TODO: to round 1b, with Player1 guessing - with point
      DO ~
        IncreaseGlobal("6#ShithriDrinksPirPoints","GLOBAL",1)
      ~
      EXIT
  END
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__09
    SAY @5010900 /* *sniffs* *sips* */
    =
    @5010901 /* Be it really... *sips* */
    =
    @5010902 /* Ne'er had it afore. But it obviously be it - the famous Evermead. I see ye nah poor <PRO_MANWOMAN> if ye can afford it, lubber. */

    IF ~~ THEN
      //TODO: to round 1b, with Player1 guessing - with point
      DO ~
        IncreaseGlobal("6#ShithriDrinksPirPoints","GLOBAL",1)
      ~
      EXIT
  END
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__10
    SAY @5011000 /* *sniffs* *sips* */
    =
    @5011001 /* Deep, deep red an' quite bold... Had something like that in Cormyr. It's Blood Wine. */

    IF ~~ THEN
      //TODO: to round 1b, with Player1 guessing - no point
      //TODO: Shithri commenting he never liked beef?
      EXIT
  END
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__11
    SAY @5011100 /* *stares* *sips* */
    =
    @5011101 /* Hmm. Nah glow, but the color fits an' it does tast o' pears. Nah too sweet either. I says: Saerloonian Glowfire, although badly stored. */

    IF ~~ THEN
      //TODO: to round 1b, with Player1 guessing - no point
      //TODO: Shithri saying "see? told ya nah t' confuse the two!"
      EXIT
  END
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__12
    SAY @5011200 /* *stares* *sips* */
    =
    @5011201 /* Very dark. Dense. Dry, but in a sweet way. An' that burnin' aftertaste... like fort'fied? They make that kind o' stuff in the North, ain't they? Winter Dry, then? */

    IF ~~ THEN
      //TODO: to round 1b, with Player1 guessing - no point
      EXIT
  END
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__13
    SAY @5011300 /* *stares* *sips* */
    =
    @5011301 /* Very dark, purplish even. Sweet, but plenty strong. An' that burnin' aftertaste... like fort'fied? They make that kind o' stuff in the North, ain't they? Winter Wine, then? */

    IF ~~ THEN
      //TODO: to round 1b, with Player1 guessing - with point
      DO ~
        IncreaseGlobal("6#ShithriDrinksPirPoints","GLOBAL",1)
      ~
      EXIT
  END
  IF ~~ THEN 6W#ShithriDrinksDuel__round_1a__14
    SAY @5011400 /* *smells* *sips* */
    =
    @5011401 /* Nah from Cormyr. Nay, definitely - too strong. Sembia, perhaps? Hmmm... I be knowin' but one strong Sembian beer. That's Old Black Goblin. */

    IF ~~ THEN
      //TODO: to round 1b, with Player1 guessing - no point
      EXIT
  END
END
CHAIN 6WPIRDR 6W#ShithriDrinksDuel__round_1a__90
  @5019000 /* *stares* *sniffs* */
  =
  @5019001 /* Ye tryin' t' poison me? I ain't be drinkin' tis... tis... tis slop! */
  == THUMB
  @5019002 /* Yer guess then? */
  == 6WPIRDR
  @5019003 /* Oh come on, mate! 'Twas suppposed t' be FINE liquor duel! */
END
  // rule-lawyer to the rescue!
  IF ~
    CheckStatGT(Player1,13,INT)
  ~ THEN
    REPLY @5019010 /* "Fine"? Huh. Can't remember the "fine" part, I'm afraid. Maybe the judge remembers? */
    EXTERN ~THUMB~ 6W#ShithriDrinksDuel__round_1a__90__int

  // could get philosophical too
  IF ~
    CheckStatGT(Player1,13,WIS)
  ~
    REPLY @5019011 /* Well, it's a bit subjective whether or not some drink is "fine", wouldn't you agree? */
    EXTERN ~THUMB~ 6W#ShithriDrinksDuel__round_1a__90__wis

  // crowd-control
  IF ~
    OR(2)
      CheckStatGT(Player1,13,CHA)
      Class(Player1,BARD_ALL)
    InMyArea("SBWENCH")
  ~
    REPLY @5019012 /* Huh. So he says he won't be guessing. You heard that, good folks? */
    EXTERN ~SBWENCH~ 6W#ShithriDrinksDuel__round_1a__90__cha

  // ...or be pacifist?
  IF ~~
    REPLY @5019013 /* Fine, I'll just pick another one then? */
    EXTERN ~THUMB~ 6W#ShithriDrinksDuel__pick_another_drink


CHAIN THUMB 6W#ShithriDrinksDuel__round_1a__90__int
  @5019020 /* Hmmm... nay. The Tumb be pretty sure he says: "drinking duel". Nah "fine" t' be found. */
END ~THUMB~ 6W#ShithriDrinksDuel__round_1a__90__forfeit_or_what

CHAIN THUMB 6W#ShithriDrinksDuel__round_1a__90__wis
  @5019030 /* May The Thumb say: he be servin' it 'here in Sea's Bounty. */
  == SBCUST01 IF ~InMyArea("SBCUST01")~
  @5019031 /* Ex'cly! Who ye thnk ye're, mate? Sayin' all 'ose bad things 'bout... */
  == SBCUST02 IF ~InMyArea("SBCUST02")~
  @5019032 /* Expected more o' ye, Franky. All fancy an' bein' too "noble" t' drink wit' us. */
  == SBSLUM01 IF ~InMyArea("SBSLUM01")~ // nobleman
  @5019033 /* Oh really, good sailor, you're ruining the charm of this place! */
  == THUMB
  @5019035 /* I be countin' this drink as good as any. */
END ~THUMB~ 6W#ShithriDrinksDuel__round_1a__90__forfeit_or_what

CHAIN SBWENCH 6W#ShithriDrinksDuel__round_1a__90__cha
  @5019040 /* Hey, sweety, can't you just accept defeat? */
  == SBCUST02 IF ~InMyArea("SBCUST02")~
  @5019041 /* Nah fair, Franky! Rules be rules! */
  BRANCH ~
    InMyArea("SBCUST02")
    InMyArea("SBCUST01")
  ~
  BEGIN
    == SBCUST01
    @5019042 /* Oi, mate, who ye thnk ye're?, huh? Who're ye anways? */
    == SBCUST02
    @5019043 /* Franky. He's a regular. */
    == SBCUST01
    @5019044 /* Well, *I* nay be knowin' 'him! */
  END
  == THUMB
  @5019045 /* I says continue. */
END ~THUMB~ 6W#ShithriDrinksDuel__round_1a__90__forfeit_or_what

CHAIN THUMB 6W#ShithriDrinksDuel__round_1a__90__forfeit_or_what
  @5019050 /* Franky, mate, ye be drinkin' or forfeitin' round? */
  == 6WPIRDR
  @5019051 /* *sigh* Jus'... jus' let's say I lost that one. */
  //TODO: to round 1b, with Player1 guessing - no point
EXIT

CHAIN THUMB 6W#ShithriDrinksDuel__pick_another_drink
  @5019060 /* I says fine. */
END ~THUMB~ 6W#ShithriDrinksDuel__pick_drink
