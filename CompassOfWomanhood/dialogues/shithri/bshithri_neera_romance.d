//
// Shithri-Neera lovetalks etc.
//
// Appends to both SoA and ToB parts, but note that the romance can only start
// in SoA, like most other romances.
//
// Use WEIGHT #0 to not trigger any other banters by chance.
//

// Encoding:
// 1000000
//
// First digit:
// ~ 1 - lovetalks
// ~ 2 - reactions to death etc


// when Neera leaves "here", it sets a flag for Shithri
ADD_TRANS_ACTION ~NEERAP~
  BEGIN 0 END
  BEGIN 2 END
  ~SetGlobal("6W#NeeraWaitingHere","GLOBAL",1)~
  UNLESS ~6W#NeeraWaitingHere~


// Neera dies
APPEND B6WSHIT
  IF WEIGHT #0 ~
    Global("6W#ShithriNeeraNeeraDied","GLOBAL",1)
  ~ THEN 6W#romance_shithri_neera__neera_dead
    SAY @2000000 /* Neera... Neera! */
    =
    @2000001 /* Nah captives. Nah captives today. Ye hear?! */

    IF ~~ THEN
      DO ~SetGlobal("6W#ShithriNeeraNeeraDied","GLOBAL",2)~
      EXIT
  END

  // IF WEIGHT #0 ~
  //   Global("6W#ShithriNeeraNeeraRaise","GLOBAL",1)
  // ~ THEN 6W#romance_shithri_neera__neera_pls_raise
  //   @2000002 /* Healer. Now. */

  //   IF ~~ THEN //TODO: answers
  //     DO ~SetGlobal("6W#ShithriNeeraNeeraRaise","GLOBAL",2)
  //     EXIT
  // END
END


APPEND B6WSHI25
  IF WEIGHT #0 ~
    Global("6W#ShithriNeeraNeeraDied","GLOBAL",1)
  ~ THEN 6W#romance_shithri_neera__neera_dead
    SAY @2000000 /* Neera... Neera! */
    =
    @2000001 /* Nah captives. Nah captives today. Ye hear?! */

    IF ~~ THEN
      DO ~SetGlobal("6W#ShithriNeeraNeeraDied","GLOBAL",2)~
      EXIT
  END
END

// Shithri dies
APPEND BNEERA
  IF WEIGHT #0 ~
    OR(2)
      Global("6W#ShithriNeeraShithriDead","GLOBAL",1)
      Global("6W#ShithriNeeraShithriDead","GLOBAL",3)
  ~ THEN 6W#romance_shithri_neera__shithri_dead
    SAY @2000010 /* No! Shithri, no! They will pay for this! */

    IF ~~ THEN
      DO ~IncrementGlobal("6W#ShithriNeeraShithriDead","GLOBAL",1)~
      EXIT
  END
END

APPEND BNEERA25
  IF WEIGHT #0 ~
    OR(2)
      Global("6W#ShithriNeeraShithriDead","GLOBAL",1)
      Global("6W#ShithriNeeraShithriDead","GLOBAL",3)
  ~ THEN 6W#romance_shithri_neera__shithri_dead
    SAY @2000010 /* No! Shithri, no! They will pay for this! */

    IF ~~ THEN
      DO ~IncrementGlobal("6W#ShithriNeeraShithriDead","GLOBAL",1)~
      EXIT
  END
END


// LoveTalk2 (no 0)

CHAIN IF WEIGHT #1 ~
  Global("6W#ShithriNeeraLoveTalk","GLOBAL",2)
~ THEN BNEERA 6W#romance_shithri_neera_0
  @1000000 /* Err... Shithri? Was your grog always this colorless? */
  DO ~IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)~
  == B6WSHIT
  @1000001 /* Grog be mostly water, me hearty. */
  == BNEERA
  @1000002 /* I'm pretty sure it used to be brown. May I try some? */
  =
  @1000003 /* Ptui! *spits* Water for sure. Sea water, to be precise. Must have been that last spell. */
  =
  @1000004 /* I'm sorry, Shithri. */
  == B6WSHIT
  @1000005 /* Don't. I be on dry land fer too long, missed the sea. But now I 'ave sea in a bottle! *smirks* */
  == BNEERA
  @1000006 /* Oh. Ok... */
EXIT


// LoveTalk4 (no 1)

CHAIN IF WEIGHT #1 ~
  Global("6W#ShithriNeeraLoveTalk","GLOBAL",4)
~ THEN BNEERA 6W#romance_shithri_neera_1
  @1000100 /* You're not how I imagined pirates, you know. */
  DO ~IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)~
  == B6WSHIT
  @1000101 /* Oh, be I? How ye imagined 'em then? */
  == BNEERA
  @1000102 /* Well, I mean... more bad I guess? You seem more like an old sailor sitting in the tavern's corner with his pipe and... */
  =
  @1000103 /* Not implying you're an old man with half of his teeth, I mean... */
  == B6WSHIT
  @1000104 /* Ye nah how I imagined half-elves o' High Forest either. */
  == BNEERA
  @1000105 /* What do you mean? */
  == B6WSHIT
  @1000106 /* I thought 'em be less fun 'n more what poets like. Mysterious 'n lonely. */
  == BNEERA
  @1000107 /* Oh. I see. Well. Life's full of surprises and all. */
EXIT


// LoveTalk6 (no 2)

CHAIN IF WEIGHT #1 ~
  Global("6W#ShithriNeeraLoveTalk","GLOBAL",6)
~ THEN B6WSHIT 6W#romance_shithri_neera_2
  @1000200 /* How it be, me hearty, growin' up in High Forest? */
  DO ~IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)~
  == BNEERA
  @1000201 /* Pretty wild. But also pretty dull. Imagine a place where you can spend months and months without meeting anybody you can talk to. Well, you could talk to trees or the like, but most of them won't answer back. Or so I thought. */
  == B6WSHIT
  @1000202 /* Ye nah 'ave' villages thar? */
  == BNEERA
  @1000203 /* Of course we did. I just couldn't come back to mine. */
  == B6WSHIT
  @1000204 /* Why nah? */
  == BNEERA
  @1000205 /* Sure, I'll now tell you the whole story of my life in the most intimate details. Sounds fine to me! */
  == B6WSHIT
  @1000206 /* Be it fair if I tell ye mine first? */
  == BNEERA
  @1000207 /* That's a bit unexpected, but... yeah. Could be fun, I guess. Story time and all. */
  == B6WSHIT
  @1000208 /* I be from Zhentil Keep. A city about half the size o' Baldur's Gate. Hidden behind huge bulwarks made o' earth. 'n on them, rock walls almost the same size. Bridges leadin' to the city be so high ye could stack five ships under 'em. */
  == BNEERA
  @1000209 /* Wouldn't make much sense though. */
  == B6WSHIT
  @1000210 /* Aye, ships nah stack too well. */
  =
  @1000211 /* Me mother be a proud orc, worshippin' Cave Mother. I nah knew me father, but me mother always tell he be "a fine man, fer an elf". */
  == BNEERA
  @1000212 /* Whoa, that's new! So that makes you a half-elf? */
  == B6WSHIT
  @1000213 /* Aye. I think so. */
  == BNEERA
  @1000214 /* Okay, now THAT's unexpected. */
  =
  @1000215 /* I think I like it. This story time. */
EXIT


// LoveTalk8 (no 3)

CHAIN IF WEIGHT #1 ~
  Global("6W#ShithriNeeraLoveTalk","GLOBAL",8)
~ THEN B6WSHIT 6W#romance_shithri_neera_3
  @1000300 /* Ho! Yer turn comes now. */
  DO ~IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)~
  == BNEERA
  @1000301 /* Not much to say. My mother was an elf and my father - human. */
  == B6WSHIT
  @1000302 /* Why ye said yer childhood be wild? */
  == BNEERA
  @1000303 /* Well, there were lots and lots of fire, for once. I guess you could say I've always had a knack for fire... in a way. */
  =
  // it's actually based on the canon story "Final Exam", from D&D Dragonmag
  // link: https://dnd.dragonmag.com/2020/05/01/fiction-neera/content.html
  @1000304 /* I mean I set my classmate on fire. And also the forest. I set the autumn forest on fire. Setting things on fire kind of became my speciality. */
  =
  @1000305 /* I guess repeating "fire" time and time again doesn't make it any more interesting. */
  =
  @1000306 /* Long story short: I left my village because of it and went to the heart of the forest, only to get banished by a tree. So here I am. I hope you liked my story. */
  == B6WSHIT
  @1000307 /* Aye. Explains much. */
  == BNEERA
  @1000308 /* Does it? Great. I mean I'm glad you like it after all. */
  == B6WSHIT
  @1000309 /* Ye be like the sea. But also like flame. I be wonderin' why. Now I know. */
  == BNEERA
  @1000310 /* What do you- */
  == B6WSHIT
  @1000311 /* Shhh. Ye will learn that soon. Promise. */
EXIT


// LoveTalk10 (no 4)

CHAIN IF WEIGHT #1 ~
  Global("6W#ShithriNeeraLoveTalk","GLOBAL",10)
~ THEN BNEERA 6W#romance_shithri_neera_4
  @1000400 /* Shithri, I don't see anything. And I'm pretty sure my darkvision is just fine. */
  DO ~IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)~
  == B6WSHIT
  @1000401 /* It ain't a surprise if ye see it. */
  == BNEERA
  @1000402 /* Hmm. */
  DO ~
    SetGlobal("6W#Shithri_Neera_bird","GLOBAL",1)
    ClearAllActions()
    StartCutSceneMode()
    //TODO: play bird sound? ideally nightgale
    Wait(5)
    EndCutSceneMode()
    Interact("6WSHITHRI")
  ~
EXIT

CHAIN IF WEIGHT #1 ~
  Global("6W#Shithri_Neera_bird","GLOBAL",1)
~ THEN BNEERA 6W#romance_shithri_neera_4__bird
  @1000403 /* What is that bird? I never heard it back in the High Forest. */
  DO ~SetGlobal("6W#Shithri_Neera_bird","GLOBAL",2)~
  == B6WSHIT
  @1000404 /* Nightgale. Common bird in the forest o' Cormanthor. */
  =
  @1000405 /* Only been there once. But wha' a memory 'tis. */
  =
  @1000406 /* Do ye like it? */
  == BNEERA
  // it's actually based on the canon story "Best Friend", from D&D Dragonmag
  // link: https://dnd.dragonmag.com/2020/05/01/fiction-neera/content.html
  @1000407 /* I do. Reminds me of the good old times. My friend Ettin probably ate birds like that. */
  == B6WSHIT
  // ettins, also called "two-headed giants"
  // https://forgottenrealms.fandom.com/wiki/Ettin
  @1000408 /* Ye be friends wit' an ettin? */
  == BNEERA
  @1000409 /* Ettin was his name, silly. */
  == B6WSHIT
  @1000410 /* Oh. */
  == BNEERA
  // tressyms, similar but not quite the same as winged-cats
  // (as there are other beasts called winged-cats and they are different)
  // https://forgottenrealms.fandom.com/wiki/Tressym
  @1000411 /* He was a tressym. */
  == B6WSHIT
  @1000412 /* So... like a winged cat? */
  == BNEERA
  @1000413 /* Yes. No. Kind of? It's complicated. */
EXIT


// LoveTalk12 (no 5)

CHAIN IF WEIGHT #1 ~
  Global("6W#ShithriNeeraLoveTalk","GLOBAL",12)
~ THEN BNEERA 6W#romance_shithri_neera_5
  @1000500 /* Shithri? It just occurred to me you never asked me if I wanted a drink. */
  DO ~IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)~
  == B6WSHIT
  @1000501 /* Aye. I did nah. */
  == BNEERA
  @1000502 /* You also never drink when talking with me. */
  == B6WSHIT
  @1000503 /* Aye. 'Tis true. */
  == BNEERA
  @1000504 /* Oh. I get it now. It's about that wild surge, isn't it? */
  == B6WSHIT
  @1000505 /* *smirk* That too. */
  =
  @1000506 /* Ye see... there be things more fun than fine liqies. 'n this bucko likes fun. */
  == BNEERA
  @1000507 /* I'm not sure if I get what you mean. Aaand I'm not sure I want to know. */
  == B6WSHIT
  @1000508 /* Nothin' wicked. I jus' enjoy yer company. */
  == BNEERA
  @1000509 /* Oh. Well, that's good to hear. Yeah. */
EXIT


// LoveTalk14 (no 6)

CHAIN IF WEIGHT #1 ~
  Global("6W#ShithriNeeraLoveTalk","GLOBAL",14)
~ THEN B6WSHIT 6W#romance_shithri_neera_6
  @1000600 /* Care fer a... */
  DO ~IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)~
  == BNEERA
  @1000601 /* Yes, please! Finally! Gosh, took you long enough. */
  =
  @1000602 /* Huh? What is that hand for? */
  == B6WSHIT
  @1000603 /* Ye jus' agreed for a dance. *smirk* */
  == BNEERA
  @1000604 /* What?! No! */
  =
  @1000605 /* I mean, I AM an amazing dancer, but- */
  =
  @1000606 /* Whoa! */
EXIT


// LoveTalk16 (no 7)

CHAIN IF WEIGHT #1 ~
  Global("6W#ShithriNeeraLoveTalk","GLOBAL",16)
~ THEN B6WSHIT 6W#romance_shithri_neera_7
  @1000700 /* *sigh* */
  DO ~IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)~
  == BNEERA
  @1000701 /* What? What did I get wrong this time? */
  == B6WSHIT
  @1000702 /* Wha'? */
  == BNEERA
  @1000703 /* You sighted at me. I'm pretty sure you sighted AT me. */
  == B6WSHIT
  @1000704 /* I jus'... I be jus' thinkin' about the story o' yer hair. The one ye told me last evenin'. */
  == BNEERA
  @1000705 /* Ah, that one. What about it? */
  == B6WSHIT
  @1000706 /* I be thinkin'. Ye got 'em the day ye be banished. Ye be banished fer settin' the forest on fire. Ye set it on fire to defend against orcs. */
  =
  @1000707 /* When I look at yer hair. I nah be proud. */
  == BNEERA
  @1000708 /* I won't lie to you - I really hated them. Hated them hard. But I doubt you're related to them. I mean, Zhentil Keep is quite far from High Forest. Besides, they may be another clan or something. And- */
  == BNEERA IF ~Global("6W#ShithriReginald","GLOBAL",0)~
  @1000709 /* And look, I have a friend who is half-orc, his name is Reginald. */
  == BNEERA IF ~!Global("6W#ShithriReginald","GLOBAL",0)~
  @1000710 /* And look, you remember my friend Reginald. He's also half-orc. */
  == BNEERA
  @1000711 /* Uh, that didn't sound good. */
  =
  @1000712 /* Anyway, my point is you shouldn't worry about that. It's not like I'm judging you. */
  == B6WSHIT
  @1000713 /* Nah. It nah be about me. It about them. They failed godly-ma. */
  =
  @1000714 /* I get it. People be all jumpy about half-orcs fer a reason. I jus'... nevermind. */
EXIT


// LoveTalk18a (no 8)
// Neera asks CHARNAME about Shithri
// if Neera and CHARNAME have a thing too

APPEND BNEERA
  IF WEIGHT #1 ~
    Global("6W#ShithriNeeraLoveTalk","GLOBAL",18)
    Global("6W#ShithriNeeraChoice","GLOBAL",0)
    Global("NeeraRomanceActive","GLOBAL",1)
  ~ THEN BEGIN 6W#romance_shithri_neera_8
    SAY @1000800 /* My head aches so much. It's so, so tiring. */

    IF ~~ THEN
      REPLY @1000801 /* Do you need a break? */
      DO ~
        IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)
        SetGlobal("6W#ShithriNeeraChoice","GLOBAL",1)
      ~
      GOTO 6W#romance_shithri_neera_8__confused

    IF ~~ THEN
      REPLY @1000802 /* Anything I can do to help? */
      DO ~
        IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)
        SetGlobal("6W#ShithriNeeraChoice","GLOBAL",1)
      ~
      GOTO 6W#romance_shithri_neera_8__can_i_help

    IF ~~ THEN
      REPLY @1000803 /* A little headache never killed nobody. */
      DO ~
        IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)
        SetGlobal("6W#ShithriNeeraChoice","GLOBAL",1)
      ~
      GOTO 6W#romance_shithri_neera_8__lil_headache
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__confused
    SAY @1000810 /* I'm fine. I'm just... confused. */

    IF ~~ THEN
      REPLY @1000811 /* Why? */
      GOTO 6W#romance_shithri_neera_8__why_confused

    IF ~~ THEN
      REPLY @1000812 /* Confused? You? */
      GOTO 6W#romance_shithri_neera_8__you_confused

    IF ~~ THEN
      REPLY @1000813 /* Then let's get moving. */
      GOTO 6W#romance_shithri_neera_8__actually_helped
  END
  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__actually_helped
    SAY @1000890 /* Yeaaah... that actually helped. */
    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriNeeraRomanceActive","GLOBAL",2)
        SetGlobal("NeeraRomanceActive","GLOBAL",3)
      ~
      EXIT
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__you_confused
    SAY @1000814 /* I know, right? */
    IF ~~ THEN GOTO 6W#romance_shithri_neera_8__why_confused
  END
  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__why_confused
    SAY @1000815 /* Well, aside from wild surges, divine heritage and all... */
    =
    @1000816 /* I mean. You. Me. A certain pirate girl who's grown surprisingly attached to me. */

    IF ~~ THEN
      REPLY @1000817 /* Oh. Has she? */
      GOTO 6W#romance_shithri_neera_8__has_she

    IF ~~ THEN
      REPLY @1000818 /* We are all friends, aren't we? */
      GOTO 6W#romance_shithri_neera_8__all_friends

    IF ~~ THEN
      REPLY @1000819 /* Yeah. I think she likes you. */
      GOTO 6W#romance_shithri_neera_8__likes_you
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__has_she
    SAY @1000820 /* In case you didn't notice, she asked me for a dance. Which you didn't. */
    =
    @1000821 /* I'm just unsure how I feel about that. */

    IF ~~ THEN
      REPLY @1000822 /* Is it about me? */
      GOTO 6W#romance_shithri_neera_8__about_me

    IF ~~ THEN
      REPLY @1000823 /* Why? You're just good friends. */
      GOTO 6W#romance_shithri_neera_8__just_good_friends

    IF ~~ THEN
      REPLY @1000824 /* We are all friends, aren't we? */
      GOTO 6W#romance_shithri_neera_8__all_friends

    IF ~~ THEN
      REPLY @1000825 /* I think you grew attached to her too. */
      GOTO 6W#romance_shithri_neera_8__attached
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__about_me
    SAY @1000830 /* Yes, yes, yes. Everything is about YOU! The center of the planes! */
    IF ~~ THEN
      GOTO 6W#romance_shithri_neera_8__ugh
  END
  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__ugh
    SAY @1000831 /* Ugh. You know what? You did help. Thanks. */

    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriNeeraRomanceActive","GLOBAL",2)
        SetGlobal("NeeraRomanceActive","GLOBAL",3)
      ~
      EXIT
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__just_good_friends
    SAY @1000832 /* And what about you and me? */

    IF ~~ THEN
      REPLY @1000833 /* Same. */
      GOTO 6W#romance_shithri_neera_8__all_just_friends

    IF ~~ THEN
      REPLY @1000834 /* ...REALLY good friends? */
      GOTO 6W#romance_shithri_neera_8__really_good_friends
  END
  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__all_just_friends
    SAY @1000835 /* Yeah. Yeah! Thank you, <CHARNAME>. I was just... that's a relief. */
    =
    @1000836 /* Let's get going! */

    IF ~~ THEN
      // both are friends, neither anything "more"
      DO ~
        SetGlobal("6W#ShithriNeeraRomanceActive","GLOBAL",3)
        SetGlobal("NeeraRomanceActive","GLOBAL",3)
      ~
      EXIT
  END
  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__really_good_friends
    SAY @1000837 /* Hmm. Perhaps you're right. */
    =
    @1000838 /* Yes. Haha. Of course you are. I mean... yes. */
    =
    @1000839 /* Thanks, that helped. Let's get going! */

    IF ~~ THEN
      // PC is a "better" friend
      DO ~
        SetGlobal("6W#ShithriNeeraRomanceActive","GLOBAL",3)
      ~
      EXIT
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__all_friends
    SAY @1000840 /* Friends, you say. Well. We definitely are that. */
    = 
    @1000841 /* I am just wondering... you know. */

    IF ~~ THEN
      REPLY @1000842 /* I was wondering the same. */
      GOTO 6W#romance_shithri_neera_8__wondering

    IF ~~ THEN
      REPLY @1000843 /* Neera. You're a good friend. And that's all you are. */
      GOTO 6W#romance_shithri_neera_8__simplifies
  END
  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__simplifies
    SAY @1000891 /* Oh. It simplifies a lot. Thanks, I guess? */
    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriNeeraRomanceActive","GLOBAL",2)
        SetGlobal("NeeraRomanceActive","GLOBAL",3)
      ~
      EXIT
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__wondering
    SAY @1000844 /* We have so much in common, haha! You know. */
    =
    @1000845 /* You think she's wondering that too? */

    IF ~~ THEN
      REPLY @1000846 /* Not really. She's just a friend. */
      GOTO 6W#romance_shithri_neera_8__not_really_just_a_friend

    IF ~~ THEN
      REPLY @1000847 /* She may, yes. */
      GOTO 6W#romance_shithri_neera_8__she_may
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__not_really_just_a_friend
    SAY @1000850 /* But you said we're all friends. */

    IF ~~ THEN
      REPLY @1000851 /* We are. I am your friend too. */
      GOTO 6W#romance_shithri_neera_8__all_just_friends

    IF ~~ THEN
      REPLY @1000852 /* Well, WE are REALLY good friends. */
      GOTO 6W#romance_shithri_neera_8__really_good_friends
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__she_may
    SAY @1000853 /* You're not helpiiing. */

    IF ~~ THEN
      REPLY @1000854 /* I think she likes you. */
      GOTO 6W#romance_shithri_neera_8__she_likes_you

    IF ~~ THEN
      REPLY @1000855 /* She's a great person, if that's what you're asking. */
      GOTO 6W#romance_shithri_neera_8__she_great_person

    IF ~
      Kit(Player1,Blackguard)
    ~ THEN
      REPLY @1000856 /* Well. She's a pirate... */
      GOTO 6W#romance_shithri_neera_8__she_pirate_i_blackguard

    IF ~
      !Kit(Player1,Blackguard)
      Alignment(Player1,CHAOTIC_EVIL)
    ~ THEN
      REPLY @1000856 /* Well. She's a pirate... */
      GOTO 6W#romance_shithri_neera_8__she_pirate_i_chevil

    IF ~
      !Kit(Player1,Blackguard)
      !Alignment(Player1,MASK_EVIL)
    ~ THEN
      REPLY @1000856 /* Well. She's a pirate... */
      GOTO 6W#romance_shithri_neera_8__she_pirate_i_ok
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__she_likes_you
    SAY @1000860 /* Does she? Well, obviously she does. If she didn't, she wouldn't do all of those things. But I mean... */
    =
    @1000861 /* Wow. That's a lot. That's... a lot. */

    IF ~~ THEN
      REPLY @1000862 /* ...but I like you more. */
      GOTO 6W#romance_shithri_neera_8__too_much

    IF ~~ THEN
      REPLY @1000863 /* I think she REALLY likes you. More so than me. */
      GOTO 6W#romance_shithri_neera_8__more_than_me
  END
  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__too_much
    SAY @1000864 /* Too much, too much, too much! Just leave me alone, both of you! */

    // congrats, you got Neera's brain to go stackoverflow
    // she wants no business with you two anymore
    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriNeeraRomanceActive","GLOBAL",3)
        SetGlobal("NeeraRomanceActive","GLOBAL",3)
      ~
      EXIT
  END
  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__more_than_me
    SAY @1000865 /* You really think that? That's a bit... unexpected. I thought you- well, you obviously know better. */
    =
    @1000866 /* Thank you. That really helped. */

    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriNeeraRomanceActive","GLOBAL",2)
        SetGlobal("NeeraRomanceActive","GLOBAL",3)
      ~
      EXIT
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__she_great_person
    SAY @1000867 /* She is. But you're not bad either. */
    =
    @1000868 /* My head... */
    =
    @1000869 /* I can't. I just can't. It's too much. */

    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriNeeraRomanceActive","GLOBAL",3)
        SetGlobal("NeeraRomanceActive","GLOBAL",3)
      ~
      EXIT
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__she_pirate_i_blackguard
    SAY @1000870 /* And you're no better, being a blackguard! */
    =
    @1000871 /* Actually... I think a pirate may be better after all. */

    IF ~~ THEN
      GOTO 6W#romance_shithri_neera_8__ugh
  END
  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__she_pirate_i_chevil
    SAY @1000872 /* Says who! At least she doesn't kill just for fun. */
    =
    @1000873 /* I think she doesn't? Not too often, at least. */

    IF ~~ THEN
      GOTO 6W#romance_shithri_neera_8__ugh
  END
  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__she_pirate_i_ok
    SAY @1000874 /* Yeah, I guess you're right. She may not seem like one, but she's done some pretty bad things. And by "bad" I mean like really bad. */
    =
    @1000875 /* Thanks, that helped. Let's get going! */

    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriNeeraRomanceActive","GLOBAL",3)
      ~
      EXIT
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__attached
    SAY @1000876 /* Yeah. I guess I did. */
    =
    @1000877 /* I... I guess I did. Thank you. Let's get going! */

    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriNeeraRomanceActive","GLOBAL",2)
        SetGlobal("NeeraRomanceActive","GLOBAL",3)
      ~
      EXIT
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__likes_you
    SAY @1000860 /* Does she? Well, obviously she does. If she didn't, she wouldn't do all of those things. But I mean... */
    =
    @1000880 /* Yeah. And you? What about you? */

    IF ~~ THEN
      REPLY @1000881 /* And I like you more. */
      GOTO 6W#romance_shithri_neera_8__too_much

    IF ~~ THEN
      REPLY @1000882 /* I like you too. As a friend. */
      GOTO 6W#romance_shithri_neera_8__simplifies
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__can_i_help
    SAY @1000883 /* Well, if you're asking. Yes, I think you could help. */

    IF ~~ THEN
      GOTO 6W#romance_shithri_neera_8__confused
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__lil_headache
    SAY @1000884 /* Yeah, thanks. It's not like you could help me with that. */

    IF ~~ THEN
      REPLY @1000885 /* ...or can I? */
      GOTO 6W#romance_shithri_neera_8__thanks_for_asking

    IF ~~ THEN
      REPLY @1000886 /* Good. Let's keep going. */
      GOTO 6W#romance_shithri_neera_8__actually_helped
  END
  IF ~~ THEN BEGIN 6W#romance_shithri_neera_8__thanks_for_asking
    SAY @1000887 /* Oh, thanks for asking! */

    IF ~~ THEN
      GOTO 6W#romance_shithri_neera_8__confused
  END
END


// LoveTalk18b (no 9)
// Neera asks CHARNAME about Shithri
// if Neera and CHARNAME aren't in a romantic relationship

APPEND BNEERA
  IF WEIGHT #1 ~
    Global("6W#ShithriNeeraLoveTalk","GLOBAL",18)
    Global("6W#ShithriNeeraChoice","GLOBAL",0)
    OR(2)
      Global("NeeraRomanceActive","GLOBAL",0)
      Global("NeeraRomanceActive","GLOBAL",3)
  ~ THEN BEGIN 6W#romance_shithri_neera_9
    SAY @1000900 /* <CHARNAME>? I wanted to ask you something. What do you think about Shithri? */

    IF ~~ THEN
      REPLY @1000901 /* A great friend. Why? */
      DO ~
        IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)
        SetGlobal("6W#ShithriNeeraChoice","GLOBAL",1)
      ~
      GOTO 6W#romance_shithri_neera_9__person

    IF ~~ THEN
      REPLY @1000902 /* Well, she's a pirate but she has her uses. */
      DO ~
        IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)
        SetGlobal("6W#ShithriNeeraChoice","GLOBAL",1)
      ~
      GOTO 6W#romance_shithri_neera_9__pirate_yeah

    IF ~~ THEN
      REPLY @1000903 /* She's pretty for a half-orc. */
      DO ~
        IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)
        SetGlobal("6W#ShithriNeeraChoice","GLOBAL",1)
      ~
      GOTO 6W#romance_shithri_neera_9__pretty

    IF ~~ THEN
      REPLY @1000904 /* We don't have time for chit-chat. */
      DO ~
        IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)
        SetGlobal("6W#ShithriNeeraChoice","GLOBAL",1)
      ~
      GOTO 6W#romance_shithri_neera_9__thanks_and_all
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_9__person
    SAY @1000910 /* I was thinking more of her as a person. */

    IF ~~ THEN
      REPLY @1000911 /* I think she's great. */
      GOTO 6W#romance_shithri_neera_9__you_do

    IF ~~ THEN
      REPLY @1000912 /* She's a pirate, you know. */
      GOTO 6W#romance_shithri_neera_9__pirate

    IF ~~ THEN
      REPLY @1000903 /* She's pretty for a half-orc. */
      GOTO 6W#romance_shithri_neera_9__pretty

    IF ~~ THEN
      REPLY @1000904 /* We don't have time for chit-chat. */
      GOTO 6W#romance_shithri_neera_9__thanks_and_all
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_9__you_do
    SAY @1000920 /* You do? Really? Well. That's a relief. I thought I was going crazy. */
    =
    @1000921 /* I mean... I'm having lots of fun with her and I just- I mean, if she was a bad person, I would better not and all. */

    IF ~~ THEN
      GOTO 6W#romance_shithri_neera_9__thank_you
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_9__thank_you
    SAY @1000922 /* Thank you, <CHARNAME>. */

    IF ~
      Gender(Player1,Male)
      Global("NeeraRomanceActive","GLOBAL",0)
    ~ THEN
      DO ~
        SetGlobal("6W#ShithriNeeraRomanceActive","GLOBAL",2)
        SetGlobal("NeeraRomanceActive","GLOBAL",3)
      ~
      EXIT

    IF ~
      OR(2)
        !Gender(Player1,Male)
        !Global("NeeraRomanceActive","GLOBAL",0)
    ~ THEN
      DO ~
        SetGlobal("6W#ShithriNeeraRomanceActive","GLOBAL",2)
      ~
      EXIT
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_9__pirate
    SAY @1000923 /* I guess you're right. She may not seem like one, but she's done some pretty bad things. And by "bad" I mean like really bad. */
    =
    @1000924 /* Thank you, <CHARNAME>. */

    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriNeeraRomanceActive","GLOBAL",3)
      ~
      EXIT
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_9__pretty
    SAY @1000930 /* Whoa, whoa, whoa! What are you suggesting? */

    IF ~~ THEN
      REPLY @1000931 /* I just noticed a fact. */
      GOTO 6W#romance_shithri_neera_9__pretty_indeed

    IF ~~ THEN
      REPLY @1000932 /* Well, you two grew quite attached recently, didn't you? */
      GOTO 6W#romance_shithri_neera_9__attached_indeed

    IF ~~ THEN
      REPLY @1000933 /* Relax, Neera. I'm joking. */
      GOTO 6W#romance_shithri_neera_9__very_funny
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_9__pretty_indeed
    SAY @1000940 /* Can't deny that. She's also a decent dancer. Not as good as me, of course, but... */

    IF ~~ THEN
      GOTO 6W#romance_shithri_neera_9__good_person_or_not
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_9__good_person_or_not
      SAY @1000941 /* But do you think she's, like, a good person? Generally? */

      IF ~~ THEN
        REPLY @1000942 /* Sure! */
        GOTO 6W#romance_shithri_neera_9__but_still

      IF ~~ THEN
        REPLY @1000943 /* I... don't know, really. */
        GOTO 6W#romance_shithri_neera_9__hmm

      IF ~~ THEN
        REPLY @1000944 /* Good person? Are you crazy? She's a pirate, for gods' sake! */
        GOTO 6W#romance_shithri_neera_9__pirate
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_9__but_still
    SAY @1000950 /* If you say so. But still. */

    IF ~~ THEN
      GOTO 6W#romance_shithri_neera_9__get_to_know_better
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_9__hmm
    SAY @1000951 /* Hmm. Hmmm... */

    IF ~~ THEN
      GOTO 6W#romance_shithri_neera_9__get_to_know_better
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_9__get_to_know_better
    SAY @1000952 /* Maybe. Just maybe! I need to get to know her better then. */

    IF ~~ THEN
      GOTO 6W#romance_shithri_neera_9__thank_you
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_9__attached_indeed
    SAY @1000953 /* I guess you could say we did. Anything wrong about it? */

    IF ~~ THEN
      REPLY @1000954 /* Quite the contrary, actually. */
      GOTO 6W#romance_shithri_neera_9__get_to_know_better

    IF ~~ THEN
      REPLY @1000912 /* She's a pirate, you know. */
      GOTO 6W#romance_shithri_neera_9__pirate

    IF ~~ THEN
      REPLY @1000955 /* Not my business, do what you want. */
      GOTO 6W#romance_shithri_neera_9__i_will
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_9__i_will
    SAY @1000954 /* I sure will. */

    IF ~
      Gender(Player1,Male)
      Global("NeeraRomanceActive","GLOBAL",0)
    ~ THEN
      DO ~
        SetGlobal("6W#ShithriNeeraRomanceActive","GLOBAL",2)
        SetGlobal("NeeraRomanceActive","GLOBAL",3)
      ~
      EXIT

    IF ~
      OR(2)
        !Gender(Player1,Male)
        !Global("NeeraRomanceActive","GLOBAL",0)
    ~ THEN
      DO ~
        SetGlobal("6W#ShithriNeeraRomanceActive","GLOBAL",2)
      ~
      EXIT
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_9__very_funny
    SAY @1000960 /* Haha. Ha. Ha. Very funny. */

    IF ~~ THEN
      GOTO 6W#romance_shithri_neera_9__good_person_or_not
  END

  IF ~~ THEN BEGIN 6W#romance_shithri_neera_9__thanks_and_all
    SAY @1000961 /* Yeah... right. Thanks and all. */

    IF ~~ THEN
      // hard to say, but she will probably not then
      // otherwise why does she even ask for your opinion
      DO ~
        SetGlobal("6W#ShithriNeeraRomanceActive","GLOBAL",3)
      ~
      EXIT
  END
  
  IF ~~ THEN BEGIN 6W#romance_shithri_neera_9__pirate_yeah
    SAY @1000962 /* Pirate. Yeah. */

    IF ~~ THEN
      GOTO 6W#romance_shithri_neera_9__pirate
  END
END


//
// Romance part 2 - comitted
//


// LoveTalk20 (no 10)

CHAIN IF WEIGHT #1 ~
  Global("6W#ShithriNeeraLoveTalk","GLOBAL",20)
~ THEN B6WSHIT 6W#romance_shithri_neera_10
  @1001000 /* Take it. Thought ye'll like that. */
  DO ~IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)~
  == BNEERA
  @1001001 /* What's that? Ok, let me guess - some kind of a drink? */
  == B6WSHIT
  @1001002 /* Nay. Keep guessin'. */
  == BNEERA
  @1001003 /* Hmm. It doesn't move, so it's neither a bird nor a cat. Nor a winged cat, for that matter. */
  =
  @1001004 /* Some rare gem? */
  =
  @1001005 /* It's... oh gods, it's cheese! I love cheese! */
  == B6WSHIT
  @1001006 /* *smirks* Ye always sayin' ye can't stand tacks 'n dried meat nah more. */
  == BNEERA
  @1001007 /* You have no idea just how much I missed it. It smells so good! */
EXIT


// LoveTalk22 (no 11)

CHAIN IF WEIGHT #1 ~
  Global("6W#ShithriNeeraLoveTalk","GLOBAL",22)
~ THEN BNEERA 6W#romance_shithri_neera_11
  @1001100 /* Shithri? Care for a draught? */
  DO ~
    IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)
    SetGlobal("6W#ShithriNeeraName","GLOBAL",1)
  ~
  == B6WSHIT
  @1001101 /* I do. */
  == BNEERA
  @1001102 /* I promise not to turn it into sea water this time. Well, into any water. To anything, really, it will just stay what it is. */
  == B6WSHIT
  @1001103 /* Sure. */
  =
  @1001104 /* Thank ye, Neera. Cheers. */
  == BNEERA
  @1001105 /* Wait. Since when do you call people by their names? */
  == B6WSHIT
  @1001106 /* *smirks* */
EXIT


// LoveTalk24 (no 12)

CHAIN IF WEIGHT #1 ~
  Global("6W#ShithriNeeraLoveTalk","GLOBAL",24)
~ THEN BNEERA 6W#romance_shithri_neera_12
  @1001200 /* So... I wanted to talk with you, Shithri. We obviously got pretty close lately. */
  DO ~IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)~
  == B6WSHIT
  @1001201 /* Aye. We be friends, Neera. */
  == BNEERA
  @1001202 /* Yeah, let's pretend you call everybody by their name. And use the word "friend" unironically. Anyway... */
  =
  @1001203 /* I'm not sure how I feel about you. */
  =
  @1001204 /* You're the best friend I ever had. I'm having lots of fun with you. I feel... you get me, I guess? You always seem to catch those little things about me and... */
  == B6WSHIT
  @1001205 /* Neera. Ye nah need t' call it. */
  == BNEERA
  @1001206 /* What? What do you mean? */
  == B6WSHIT
  @1001207 /* If ye enjoy it - 'tis enough fer me. Nah need t' call it. */
  =
  @1001208 /* I do enjoy it. */
  == BNEERA
  @1001209 /* But what if we... or what if you but not me... */
  == B6WSHIT
  @1001210 /* I be fine, Neera. This bucko nah so soft t' break that easily. */
  =
  @1001211 /* 'n ye nah so soft either. */
  == BNEERA
  @1001212 /* You think so? */
  == B6WSHIT
  @1001213 /* Aye! */
  == BNEERA
  @1001214 /* Hmm. Ok then. Off we go. */
EXIT


// LoveTalk26 (no 13)
// not in a forest - pretty challenging in ToB, so it's still SoA

// Shithri's shanty is based on "Spanish Ladies", a highly popular naval ballad
// in both English and Polish.
//
// Original lyrics' author is unknown
// Shithri's version by Udiknedormin
//
// Here is a good version of the original shanty
// In English:
// https://www.youtube.com/watch?v=I3wzlHYzsg8
// In Polish:
// https://www.youtube.com/watch?v=0Rdg6GUv-wQ
CHAIN IF WEIGHT #1 ~
  Global("6W#ShithriNeeraLoveTalk","GLOBAL",26)
~ THEN B6WSHIT 6W#romance_shithri_neera_13
  // shikhem - goodbye
  @1001300 /* "Farewell and shikhem, to you Cormyte ladies...
               Farewell and shikhem, to ones of Suzail...
               For we received orders to sail for Old Thargate
               But we hope, very soon, we shall see you again!" */
  DO ~IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)~
  =
  @1001301 /* "The taste of your lips, of you, Cormyte ladies..." */
  == BNEERA
  @1001302 /* "...In darkest of nights will bring us some smiles..." */
  == B6WSHIT
  @1001303 /* "...Until we strike shallows in swamp river of Moon Sea
              Ylraphon to Elmwood in one hundred miles!" */
  == BNEERA
  @1001304 /* Shithri? What ARE Cormyte ladies like? Obviously they must be very memorable, but what kind of memorable? */
  == B6WSHIT
  @1001305 /* Can't speak fer all o' them. But the one I remember best had very beautiful, neatly braided beard. */
  == BNEERA
  @1001306 /* Huh. I always liked beards, but rarely thought of how they'd look like on a woman. */
  == B6WSHIT
  @1001307 /* 'em lookin' well, be all I can tell. */
EXIT


//
// hic sunt ToB lovetalks
//

// LoveTalk28 (no 14)
CHAIN IF WEIGHT #1 ~
  Global("6W#ShithriNeeraLoveTalk","GLOBAL",28)
~ THEN B6WSHI25 6W#romance_shithri_neera_14
  @1001400 /* Neera. */
  DO ~IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)~
  == BNEERA25
  @1001401 /* Why do I feel a personal question will come now... Yes, Shithri? */
  == B6WSHI25
  @1001402 /* I be curious. Wha' it be like t' 'ave a wild surge. If that nah too personal o' a question fer ya. */
  == BNEERA25
  @1001403 /* Can't say it's not personal, but I'm good with that. You are... a friend, after all. */
  =
  @1001404 /* I see into chaos. It's like all nature combined. Full of terror. But also ecstatic beauty. */
  == B6WSHI25
  @1001405 /* Like a sea... */
  == BNEERA25
  @1001406 /* No. Yes. Maybe? I've never been a sailor, so I can't really say if it compares. */
  == B6WSHI25
  @1001407 /* Would ye like to? */
  == BNEERA25
  @1001408 /* One day. */
EXIT


// LoveTalk30 (no 15)
CHAIN IF WEIGHT #1 ~
  Global("6W#ShithriNeeraLoveTalk","GLOBAL",30)
~ THEN BNEERA25 6W#romance_shithri_neera_15
  @1001500 /* Shithri? I have kind of a personal question for you, too. */
  DO ~IncrementGlobal("6W#ShithriNeeraLoveTalk","GLOBAL",1)~
  == B6WSHI25
  @1001501 /* Aye, Neera? */
  == BNEERA25
  @1001502 /* ...for someone who rarely calls people by names, you're quite skilled at that, you know? */
  == B6WSHI25
  @1001503 /* I do, yarrr. That be yer question? */
  == BNEERA25
  @1001504 /* No, silly. You and I. Sinking Thayan slave ships. What would you say? */
  == B6WSHI25
  @1001505 /* Gladly. But I be 'avin' one condition. */
  == BNEERA25
  @1001506 /* What kind of condition? */
  == B6WSHI25
  @1001507 /* I be makin' our flag. If ye make it, it be nah good. */
  == BNEERA25
  @1001508 /* Ha. Ha. Very funny, Shithri. */
  == B6WSHI25
  @1001509 /* I know. *smirks* */
EXIT

//
// ...and then just the epilogue left!
//

