//
// Shithri joining quest
//
// Shithri wants to get to the Brynnlaw pirate island.
// She CANNOT be joined after you get there, so she must
// be joined before chapter 4.
//

// Shithri joining the party is in this file because it begins the quest,
// so it needs to be in the same translation file.

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

CHAIN IF ~
  NumberOfTimesTalkedTo(0)
  Global("6W#Shithri_SeaMan_Initial","Global",0)
~ THEN 6WSHIT SeaMan_initial
  @1000000 /* So ye nah sailin' t' Brynnlaw? */
  DO ~SetGlobal("6W#Shithri_SeaMan_Initial","Global",1)~
  == DSAILOR2
  @1000001 /* I'm a sailor, not a pirate, lass. *hic* Told ye already! Sailin' north now. */
  == 6WSHIT
  @1000002 /* Amn be 'avin' colonies in Maztica and ye sailin' north? */
  == DSAILOR2
  @1000003 /* Listen, I sail where me captain leads. Served me right until now! *hic* */
  == 6WSHIT
  @1000004 /* *gulp* Wha' a swab... */
END 6WSHIT DoYeGoToBrynnlaw

APPEND 6WSHIT
  IF ~~ THEN BEGIN DoYeGoToBrynnlaw
    SAY @1000005 /* Oy, ye there! Know a ship sailin' t' Brynnlaw? */
    IF ~GlobalGT("Chapter","GLOBAL",3)~ THEN
      REPLY @1000006 /* No. Not really. */
      GOTO NahShipToBrynnlaw
    IF ~GlobalLT("Chapter","GLOBAL",4)~ THEN
      REPLY @1000007 /* Brynnlaw? Never heard of it. */
      GOTO WhatBrynnlaw
    IF ~~ THEN
      REPLY @1000008 /* And who are you? */
      GOTO WhatBrynnlawImShithri
    IF ~~ THEN
      REPLY @1000009 /* You think I'm water traffic control functionary or what? */
      GOTO BrynnlawDeny
  END
  
  IF ~~ THEN BEGIN NahShipToBrynnlaw
    SAY @1000010 /* Huh. Noone "knows". I nah expected it t' be such issue. */
    IF ~~ THEN EXIT
  END
  
  IF ~~ THEN BEGIN WhatBrynnlaw
    SAY @1000011 /* Pirate Island, they call it. Or house o' madmen, until recently. Or so I hear. */
    IF ~~ THEN
      REPLY @1000012 /* House of madmen? Why? */
      GOTO WhatMadmenHouse
    IF ~~ THEN
      REPLY @1000013 /* Never heard of it. Sorry. */
      GOTO NahShipToBrynnlaw
  END
  IF ~~ THEN BEGIN WhatMadmenHouse
    SAY @1000014 /* Like... mad madmen, I hear. Mad wizards 'n other mageries, aye. 'Tis like a jail. */
    IF ~~ THEN
      REPLY @1000015 /* Do you mean Spellhold? */
      GOTO WhatSpellhold
    IF ~~ THEN
      REPLY @1000013 /* Never heard of it. Sorry. */
      GOTO NahShipToBrynnlaw
  END
  IF ~~ THEN BEGIN WhatSpellhold
    SAY @1000016 /* Aye! Spellhold. So ye know the island, aye? */
    IF ~~ THEN
      REPLY @1000017 /* I'm trying to get there myself. */
      GOTO GetThereMyself
    IF ~~ THEN
      REPLY @1000018 /* No. Still doesn't ring a bell. */
      GOTO NahShipToBrynnlaw
  END
  IF ~~ THEN BEGIN GetThereMyself
    SAY @1000019 /* Do ye? So who'll smuggle ye there? Nah. Nah need t' answer. Jus' tell if ye can get I there too. */
    IF ~~ THEN
      REPLY @1000020 /* Sure, welcome aboard. If you help me raise the money, that is. */
      GOTO SureWillHelpMoney
    IF ~~ THEN
      REPLY @1000021 /* I'd rather not. */
      GOTO BrynnlawDeny
    IF ~~ THEN
      REPLY @1000022 /* And who are you? */
      GOTO GetThereImShithri
  END
  
  IF ~~ THEN BEGIN SureWillHelpMoney
    SAY @1000023 /* Nah bad fer a lubber ye be! Lead the way then, "capt'n". */
    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriJoined","GLOBAL",1)
        JoinParty()
      ~
      UNSOLVED_JOURNAL @9000000 /* Getting Shithri to Brynnlaw

At the docks, I met a half-orc pirate called Shithri. She was looking for a ship to get to Brynnlaw - the same island Spellhold is located in, as it turns out. I agreed for her to join me and get there together. */
      EXIT
  END
  
  IF ~~ THEN BEGIN GetThereImShithri
    SAY @1000024 /* Name be Shithri. */
    IF ~~ THEN
      REPLY @1000025 /* Good. I'm <CHARNAME>. Welcome aboard, Shithri. */
      GOTO SureWillHelpMoney
    IF ~~ THEN
      REPLY @1000026 /* ...and? */
      GOTO ShithriWho0
  END
  IF ~~ THEN BEGIN ShithriWho0
    SAY @1000027 /* Huh. Ye be very curious, ain't ye? Fine then, I tell ye. */
    IF ~~ THEN GOTO ShithriWho1
  END
  IF ~~ THEN BEGIN ShithriWho1
    SAY @1000028 /* I be pirate. So I wanna get t' Pirate Island. Makes sense, aye? */
    IF ~~ THEN
      REPLY @1000029 /* It does. Glad you were honest with me, welcome aboard! */
      GOTO SureWillHelpMoney
    IF ~~ THEN
      REPLY @1000030 /* Pirate? No thanks. */
      GOTO BrynnlawDeny
    IF ~~ THEN
      REPLY @1000031 /* You have weird accent. You're from far away? */
      GOTO ShithriZentish
  END
  
  IF ~~ THEN BEGIN ShithriZentishOk
    SAY @1000035 /* Make up yer mind. Ye'll 'ave' I or nah? */
    IF ~~ THEN
      REPLY @1000036 /* Sure. Glad you were honest with me, welcome aboard! */
      GOTO SureWillHelpMoney
    IF ~~ THEN
      REPLY @1000037 /* A Zenth pirate? No thanks. */
      GOTO BrynnlawDeny
  END
  
  IF ~~ THEN BEGIN BrynnlawDeny
    SAY @1000038 /* Wha' a swab... */
    IF ~~ THEN EXIT
  END
  
  IF ~~ THEN BEGIN WhatBrynnlawImShithri
    SAY @1000039 /* Me name nah matter if ye nah know a ship t' Brynnlaw. Know some? */
    IF ~GlobalGT("Chapter","GLOBAL",3)~ THEN
      REPLY @1000006 /* No. Not really. */
      GOTO NahShipToBrynnlaw
    IF ~GlobalLT("Chapter","GLOBAL",4)~ THEN
      REPLY @1000007 /* Brynnlaw? Never heard of it. */
      GOTO WhatBrynnlaw
    IF ~~ THEN
      REPLY @1000009 /* You think I'm water traffic control functionary or what? */
      GOTO BrynnlawDeny
  END
END

CHAIN
  IF ~~ THEN 6WSHIT ShithriZentish
    @1000032 /* Aye. I be Zentish. */
    == JAHEIRAJ IF ~IsValidForPartyDialogue("JAHEIRA")~ THEN
    @1000033 /* A Zhent? I knew I heard that accent before... */
    == DORNJ IF ~IsValidForPartyDialogue("DORN")~ THEN
    @1000034 /* Zenthil Keep is hardly the best place to be a half-orc. */ 
END 6WSHIT ShithriZentishOk


//
// Maybe join?
//

APPEND 6WSHIT
  IF ~!NumberOfTimesTalkedTo(0)~ THEN BEGIN maybe_join
    SAY @1000040 /* Ahoy. Ye know a ship sailin' t' Brynnlaw? */
  
    IF ~GlobalGT("Chapter","GLOBAL",3)~ THEN
      REPLY @1000006 /* No. Not really. */
      GOTO NahShipToBrynnlaw
    IF ~GlobalLT("Chapter","GLOBAL",4)~ THEN
      REPLY @1000007 /* Brynnlaw? Never heard of it. */
      GOTO WhatBrynnlaw
    IF ~~ THEN
      REPLY @1000008 /* And who are you? */
      GOTO WhatBrynnlawImShithri
    IF ~~ THEN
      REPLY @1000009 /* You think I'm water traffic control functionary or what? */
      GOTO BrynnlawDeny
  END
END


//
// Getting to Brynnlaw
//

APPEND 6WSHITJ
  IF ~
    Global("6W#ShithriBrynnlaw","GLOBAL",1)
  ~ THEN BEGIN brynnlaw_arrived
    SAY @2000000 /* Ho! Here it be, Brynnlaw! Thanks, capt'n! */

    IF ~~ THEN
      REPLY @2000001 /* So... are you leaving the party? */
      DO ~SetGlobal("6W#ShithriBrynnlaw","GLOBAL",2)~
      GOTO brynnlaw_arrived__are_you_leaving

    IF ~~ THEN
      REPLY @2000002 /* My pleasure! Glad I could help you. */
      DO ~SetGlobal("6W#ShithriBrynnlaw","GLOBAL",2)~
      GOTO brynnlaw_arrived__are_you_leaving

    IF ~~ THEN
      REPLY @2000003 /* Finally! No more of those... ughm. "Songs". */
      DO ~SetGlobal("6W#ShithriBrynnlaw","GLOBAL",2)~
      GOTO brynnlaw_arrived__no_more_songs
  END

  IF ~~ THEN BEGIN brynnlaw_arrived__are_you_leaving
    SAY @2000010 /* This bucko has some business t' do. Yarrr. */

    IF ~~ THEN
      REPLY @2000011 /* Maybe I could help you with that too? */
      GOTO brynnlaw_arrived__could_i_help

    IF ~~ THEN
      REPLY @2000012 /* Good. If you decide to rejoin me later on, though - feel free to do so. */
      GOTO brynnlaw_arrived__you_can_rejoin__nah_know

    IF ~~ THEN
      REPLY @2000013 /* So it's a goodbye. */
      GOTO brynnlaw_arrived__goodbye
  END
  IF ~~ THEN BEGIN brynnlaw_arrived__no_more_songs
    SAY @2000030 /* Har har! Aye, capt'n, ye silly old swab. No more shanties fer ye. */
    IF ~~ THEN
      GOTO brynnlaw_arrived__are_you_leaving
  END

  IF ~~ THEN BEGIN brynnlaw_arrived__could_i_help
    SAY @2000040 /* Huh. Ye could, mayhaps. I be lookin' fer a man they call "the King o' Pirates". */

    IF ~~ THEN
      REPLY @2000041 /* So you want an audience with a king? */
      GOTO brynnlaw_arrived__audience

    IF ~~ THEN
      REPLY @2000042 /* I don't think I can help you with that. */
      GOTO brynnlaw_arrived__cant_help
  END

  IF ~~ THEN BEGIN brynnlaw_arrived__you_can_rejoin__nah_know
    SAY @2000050 /* Nah bad, yer idea. *gulp* Meet this bucko after ye leave the house o' madmen then. */

    IF ~
      OR(2)
        !Global("6W#ShithriNeeraRomanceActive","GLOBAL",2)
        !IsValidForPartyDialog("Neera")
    ~ THEN
      DO ~
        SetGlobal("6W#ShithriBrynnlawRejoin","GLOBAL",1)
        LeaveParty()
        SetLeavePartyDialogueFile()
        ChangeAIScript("",DEFAULT)
        EscapeAreaMove("AR1602",729,504,N)
        Deactivate(Myself)
      ~
      UNSOLVED_JOURNAL @9000003 /* Getting Shithri to Brynnlaw

We arrived at the Brynnlaw island, Shithri's destination. It seems like she has something to do here, but can rejoin me later. I promised to meet her after I come back from the Spellhold. */
      EXIT

    IF ~
      Global("6W#ShithriNeeraRomanceActive","GLOBAL",2)
      IsValidForPartyDialog("Neera")
    ~ THEN
      EXTERN ~NEERAJ~ brynnlaw_arrived__neera_shithri_rejoin
  END
  IF ~~ THEN BEGIN brynnlaw_arrived__you_can_rejoin__know
    SAY @2000050 /* Nah bad, yer idea. *gulp* Meet this bucko after ye leave the house o' madmen then. */

    IF ~
      OR(2)
        !Global("6W#ShithriNeeraRomanceActive","GLOBAL",2)
        !IsValidForPartyDialog("Neera")
    ~ THEN
      DO ~
        SetGlobal("6W#ShithriBrynnlawRejoin","GLOBAL",1)
        LeaveParty()
        SetLeavePartyDialogueFile()
        ChangeAIScript("",DEFAULT)
        EscapeAreaMove("AR1602",729,504,N)
        Deactivate(Myself)
      ~
      UNSOLVED_JOURNAL @9000004 /* Getting Shithri to Brynnlaw

We arrived at the Brynnlaw island, Shithri's destination. As it turns out, she's trying to get audience with the Pirate King himself. I promised to meet her after I come back from the Spellhold. */
      EXIT

    IF ~
      Global("6W#ShithriNeeraRomanceActive","GLOBAL",2)
      IsValidForPartyDialog("Neera")
    ~ THEN
      EXTERN ~NEERAJ~ brynnlaw_arrived__neera_shithri_rejoin
  END

  IF ~~ THEN BEGIN brynnlaw_arrived__cant_help
    SAY @2000060 /* Too bad. Off I go then. */

    IF ~~ THEN
      REPLY @2000061 /* Would you rejoin me when we're both done with our tasks? */
      GOTO brynnlaw_arrived__you_can_rejoin__know

    // Note: After that, Shithri will leave PERMANENTLY
    IF ~~ THEN
      REPLY @2000062 /* Goodbye then! */
      GOTO brynnlaw_arrived__goodbye
  END

  IF ~~ THEN BEGIN brynnlaw_arrived__audience
    SAY @2000070 /* Ye could call it that, aye. */

    IF ~~ THEN
      REPLY @2000071 /* Fine. I will help you then. */
      GOTO brynnlaw_arrived__accept

    IF ~~ THEN
      REPLY @2000042 /* I don't think I can help you with that. */
      GOTO brynnlaw_arrived__cant_help
  END

  IF ~~ THEN BEGIN brynnlaw_arrived__accept
    SAY @2000072 /* Good! Set sail fer the "Pirate King"! */
    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriBrynnlawKing","GLOBAL",1)
      ~
      UNSOLVED_JOURNAL @9000005 /* Getting Shithri to Brynnlaw

We arrived at the Brynnlaw island, Shithri's destination. As it turns out, she's trying to get audience with the Pirate King himself. I decided to help her. */
      EXIT
  END

  // Note: After that, Shithri will leave PERMANENTLY
  IF ~~ THEN BEGIN brynnlaw_arrived__goodbye
    SAY @2000080 /* Ne'er say "goodbye", capt'n. *gulp* */

    IF ~
      OR(2)
        !Global("6W#ShithriNeeraRomanceActive","GLOBAL",2)
        !IsValidForPartyDialog("Neera")
    ~ THEN
      DO ~
        AddExperienceParty(12000)
        LeaveParty()
        EscapeArea()
      ~
      SOLVED_JOURNAL @9000002 /* Getting Shithri to Brynnlaw

We arrived at the Brynnlaw island, Shithri's destination. Despite the companionship we shared, she didn't even say goodbye. */
      EXIT

    IF ~
      Global("6W#ShithriNeeraRomanceActive","GLOBAL",2)
      IsValidForPartyDialog("Neera")
    ~ THEN
      DO ~
        AddExperienceParty(12000)
        LeaveParty()
        EscapeArea()
      ~
      SOLVED_JOURNAL @9000002 /* Getting Shithri to Brynnlaw

We arrived at the Brynnlaw island, Shithri's destination. Despite the companionship we shared, she didn't even say goodbye. */
      EXTERN ~NEERAJ~ brynnlaw_arrived__goodbye
  END
END

// If Neera is in relationship with Shithri, she will leave PERMANENTLY too
APPEND NEERAJ
  IF ~~ THEN brynnlaw_arrived__goodbye
    SAY @2000090 /* Well, <CHARNAME>... I'm not really good at saying goodbyes either. So, um, grateful for everything you did for me. For us? Anyway... bye! */

    IF ~~ THEN
      DO ~
        LeaveParty()
        EscapeArea()
      ~
      EXIT
  END
END

// Shithri wants to rejoin later - what about Neera?
CHAIN NEERAJ brynnlaw_arrived__neera_shithri_rejoin
  @2000091 /* Wait, Shithri! I will go with you. */
  == 6WSHITJ
  @2000092 /* Nah need t'. Betta watch fer capt'n t' come back fer this bucko, har har! */
  == NEERAJ
  @2000093 /* I... what? */
  =
  @2000094 /* *sigh* Okay, you're right. <CHARNAME> needs someone dependable on <PRO_HISHER> side while you're gone. */
  =
  @2000095 /* Just- be back safely. */

  // Implementation Note:
  // putting the last Shithri's state here causes the game to crash
  // for some reason - so factoring it out
EXTERN ~6WSHITJ~ brynnlaw_arrived__shithri_gives_neera_her_word

APPEND 6WSHITJ
  IF ~~ THEN brynnlaw_arrived__shithri_gives_neera_her_word
    SAY @2000096 /* *smirk* This bucko gives ye her word. */

    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriBrynnlawRejoin","GLOBAL",1)
        LeaveParty()
        SetLeavePartyDialogueFile()
        ChangeAIScript("",DEFAULT)
        EscapeAreaMove("AR1602",729,504,N)
        Deactivate(Myself)
      ~
      UNSOLVED_JOURNAL @9000003 /* Getting Shithri to Brynnlaw

We arrived at the Brynnlaw island, Shithri's destination. It seems like she has something to do here, but can rejoin me later. I promised to meet her after I come back from the Spellhold. */
      EXIT
  END
END


//
// Shithri needs a draught before speaking to the Pirate King
//

APPEND 6WSHITJ
  IF ~
    Global("6W#ShithriBrynnlawKingDoor","GLOBAL",1)
  ~ THEN shithri_desharik_door
    SAY @2000100 /* Ho! Behind this door be "the King 'o Pirates". */
    =
    @2000101 /* *gulp* *gulp* *gulp* Ha... */
    =
    @2000102 /* Aye. I be ready now. */
    =
    @2000103 /* Nay. *gulp* *gulp* Ha... Now I be ready. */

    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriBrynnlawKingDoor","GLOBAL",2)
        SetGlobal("6W#ShithriBrynnlawDrunk","GLOBAL",1)

        // slightly less than 9000 - for the reason, see the .baf file
        SetGlobalTimer("6W#ShithriBrynnlawSobering","GLOBAL",88000)

        ReallyForceSpellRES("6W#DRUNK", Myself)
      ~
      EXIT
  END
END


//
// Shithri is "healed" from intoxication
//

APPEND 6WSHITJ
  IF ~
    Global("6W#ShithriBrynnlawDrunk","GLOBAL",3)
  ~ THEN shithri_desharik_intoxication_healed
    SAY @2000110 /* Wha'? Blimey, I be sober as a mackerel! */
    =
    @2000111 /* Capt'n, wha' the... */

    IF ~~ THEN
      REPLY @2000112 /* You can't be drunk when talking to a king, can you? */
      GOTO shithri_desharik_intoxication_healed__cant_be_drunk

    IF ~~ THEN
      REPLY @2000113 /* Side-effect of healing spells. */
      GOTO shithri_desharik_intoxication_healed__side_effect
  END

  IF ~~ THEN shithri_desharik_intoxication_healed__cant_be_drunk
    SAY @2000120 /* Hmm. Mayhaps, aye. Thanks, capt'n! */

    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriBrynnlawDrunk","GLOBAL",4)
      ~
      EXIT
  END

  IF ~~ THEN shithri_desharik_intoxication_healed__side_effect
    SAY @2000130 /* Ayyy, could've warned this bucko, ye could. */
    =
    @2000131 /* *gulp* *gulp* *gulp* Ha... A moment. */
    =
    @2000132 /* *gulp* *gulp* Ha... I be ready! */

    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriBrynnlawDrunk","GLOBAL",1)

        // slightly less than 9000 - for the reason, see the .baf file
        SetGlobalTimer("6W#ShithriBrynnlawSobering","GLOBAL",88000)

        ReallyForceSpellRES("6W#DRUNK", Myself)
      ~
      EXIT
  END
END


//
// Shithri talks to Desharik when completely drunk
//

EXTEND_BOTTOM PPDESH 1
  IF ~
    Global("6W#ShithriBrynnlawKing","GLOBAL",1)
    IsValidForPartyDialog("6WSHITHRI")
    CheckStatGT("6WSHITHRI",49,INTOXICATION)
  ~ THEN
    EXTERN ~6WSHITJ~ shithri_desharik
END
EXTEND_BOTTOM PPDESH 3
  IF ~
    Global("6W#ShithriBrynnlawKing","GLOBAL",1)
    IsValidForPartyDialog("6WSHITHRI")
    CheckStatGT("6WSHITHRI",49,INTOXICATION)
  ~ THEN
    EXTERN ~6WSHITJ~ shithri_desharik
END
EXTEND_BOTTOM PPDESH 4
  IF ~
    Global("6W#ShithriBrynnlawKing","GLOBAL",1)
    IsValidForPartyDialog("6WSHITHRI")
    CheckStatGT("6WSHITHRI",49,INTOXICATION)
  ~ THEN
    EXTERN ~6WSHITJ~ shithri_desharik
END

CHAIN 6WSHITJ shithri_desharik
  @2000300 /* Ahoy, ye old sea dog! */
  == PPDESH
  @2000301 /* Do we know each other? */
  == 6WSHITJ
  @2000302 /* Do we? Oh do we? Ho, ye betta know that, me tar. *gulp* Here ye be, talkin' like a fancy lubber 'n these rapscallions o'er here callin' ye the King o' the Pirates, har har! Good one! */
  == PPDESH
  @2000303 /* You're drunk, girl. Get out. */
  //TODO: here Yoshimo could say it's not necessary etc?
  == 6WSHITJ
  @2000304 /* Sileeence! Silence! Ye. Ye think ye betta than I, aye? Huh! Ye sittin' in yer fancy office, wearin' yer long clothes. But this bucko nah be fooled so easily! Nay, nay! */
  == PPDESH
  @2000305 /* Could you ask your friend here to stop spilling that slop on me? */
  == 6WSHITJ
  @2000306 /* Slop? SLOP?! Here ye be, nah e'en knowin' the buccaneers' finest grog there be! Ye know wha'? Ye know wha'? */
  =
  @2000307 /* I be the one who'll be Queen o' Pirates! */
  DO ~
    SetGlobal("6W#ShithriQueen","GLOBAL",1) // 1 represents the "drunk" version
    SetGlobal("6W#ShithriBrynnlawKing","GLOBAL",2)
    AddExperienceParty(32000)
    // cannot use standard SOLVED_JOURNAL here
    AddJournalEntry(@9000010, QUEST_DONE) /* Getting Shithri to Brynnlaw

Shithri talked to the Pirate Lord Desharik and declared to him that it's her who will become the Queen of Pirates. It looks like that is all she had to say to him. */
  ~
  == PPDESH
  @2000308 /* What you will be is yet another mad woman throw into the asylum. Get. Out. NOW. */
END
  IF ~~ THEN
    REPLY @2000310 /* Is that how you adress your queen?! Kneel before her majesty, fool! */
    EXTERN ~PPDESH~ shithri_desharik__kneel
  IF ~~ THEN
    REPLY @2000311 /* May I add that I am a child of god? */
    EXTERN ~PPDESH~ shithri_desharik__child_of_god
  IF ~~ THEN
    REPLY @2000312 /* I'm terribly sorry for this situation, but I really need to get to Spellhold. */
    EXTERN ~PPDESH~ 5 /* Spellhold? Why would you want to go there? Hardly a sociable place for decent folk. */

APPEND PPDESH
  IF ~~ THEN shithri_desharik__kneel
    SAY @2000320 /* I can see there are more of you sick ones. Get them all out of my sight, all of them. I swear to gods, new silky shirt, already stained... */

    IF ~~ THEN
      DO ~SetGlobal("PPdeshSend","GLOBAL",1)
        EraseJournalEntry(11681)
        EraseJournalEntry(15715)
        EraseJournalEntry(15760)
        EraseJournalEntry(19364)
        EraseJournalEntry(3362)
        EraseJournalEntry(9982)
        EraseJournalEntry(11681)
        EraseJournalEntry(11686)
        EraseJournalEntry(11884)
        EraseJournalEntry(15783)
        EraseJournalEntry(15794)
        EraseJournalEntry(16541)
        EraseJournalEntry(16677)
        EraseJournalEntry(23512)
        EraseJournalEntry(5059)
        EraseJournalEntry(6934)
        EraseJournalEntry(7235)
        EraseJournalEntry(10106)
        EraseJournalEntry(10107)
        EraseJournalEntry(10670)
        EraseJournalEntry(10671)
        EraseJournalEntry(10933)
        EraseJournalEntry(11689)
        EraseJournalEntry(11755)
        EraseJournalEntry(11904)
        EraseJournalEntry(15698)
        EraseJournalEntry(15703)
        EraseJournalEntry(15801)
        EraseJournalEntry(16558)
        EraseJournalEntry(20367)
        EraseJournalEntry(23504)
        EraseJournalEntry(23530)
        EraseJournalEntry(11661)
        SetGlobal("PirateAsylum","GLOBAL",11)
        SetGlobal("AsylumPlot","GLOBAL",11)
        StartCutSceneMode()
        StartCutScene("Cut41f")
      ~
      SOLVED_JOURNAL @9000011 /* Getting inside the asylum

Drunk and brutally honest Shithri was more than enough to convince Desharik to have us thrown in the asylum. I am to be admitted forthwith, and then I shall find out what has happened to Imoen and Irenicus both! */
      EXIT
  END
  IF ~~ THEN shithri_desharik__child_of_god
    SAY @2000321 /* Oh, don't worry. They have plenty of queens and gods in the Spellhold. Get them all out of my sight, all of them. I swear to gods, new silky shirt, already stained... */

    IF ~~ THEN
      DO ~SetGlobal("PPdeshSend","GLOBAL",1)
        EraseJournalEntry(11681)
        EraseJournalEntry(15715)
        EraseJournalEntry(15760)
        EraseJournalEntry(19364)
        EraseJournalEntry(3362)
        EraseJournalEntry(9982)
        EraseJournalEntry(11681)
        EraseJournalEntry(11686)
        EraseJournalEntry(11884)
        EraseJournalEntry(15783)
        EraseJournalEntry(15794)
        EraseJournalEntry(16541)
        EraseJournalEntry(16677)
        EraseJournalEntry(23512)
        EraseJournalEntry(5059)
        EraseJournalEntry(6934)
        EraseJournalEntry(7235)
        EraseJournalEntry(10106)
        EraseJournalEntry(10107)
        EraseJournalEntry(10670)
        EraseJournalEntry(10671)
        EraseJournalEntry(10933)
        EraseJournalEntry(11689)
        EraseJournalEntry(11755)
        EraseJournalEntry(11904)
        EraseJournalEntry(15698)
        EraseJournalEntry(15703)
        EraseJournalEntry(15801)
        EraseJournalEntry(16558)
        EraseJournalEntry(20367)
        EraseJournalEntry(23504)
        EraseJournalEntry(23530)
        EraseJournalEntry(11661)
        SetGlobal("PirateAsylum","GLOBAL",11)
        SetGlobal("AsylumPlot","GLOBAL",11)
        StartCutSceneMode()
        StartCutScene("Cut41f")
      ~
      SOLVED_JOURNAL @9000011 /* Getting inside the asylum

Drunk and brutally honest Shithri was more than enough to convince Desharik to have us thrown in the asylum. I am to be admitted forthwith, and then I shall find out what has happened to Imoen and Irenicus both!~ */
      EXIT
  END
END


//
// Shithri talks to Desharik when sober
//

EXTEND_BOTTOM PPDESH 1
  IF ~
    Global("6W#ShithriBrynnlawKing","GLOBAL",1)
    IsValidForPartyDialog("6WSHITHRI")
    CheckStatLT("6WSHITHRI",50,INTOXICATION)
  ~ THEN
    REPLY @2000400 /* My friend Shithri wanted to speak with you. */
    EXTERN ~6WSHITJ~ shithri_desharik_sober
END
EXTEND_BOTTOM PPDESH 3
  IF ~
    Global("6W#ShithriBrynnlawKing","GLOBAL",1)
    IsValidForPartyDialog("6WSHITHRI")
    CheckStatLT("6WSHITHRI",50,INTOXICATION)
  ~ THEN
    REPLY @2000400 /* My friend Shithri wanted to speak with you. */
    EXTERN ~6WSHITJ~ shithri_desharik_sober
END
EXTEND_BOTTOM PPDESH 4
  IF ~
    Global("6W#ShithriBrynnlawKing","GLOBAL",1)
    IsValidForPartyDialog("6WSHITHRI")
    CheckStatLT("6WSHITHRI",50,INTOXICATION)
  ~ THEN
    REPLY @2000400 /* My friend Shithri wanted to speak with you. */
    EXTERN ~6WSHITJ~ shithri_desharik_sober
END

CHAIN 6WSHITJ shithri_desharik_sober
  @2000401 /* Ahoy. */
  == PPDESH
  @2000402 /* Do we know each other? */
  == 6WSHITJ
  @2000403 /* *smirk* Nay. Prolly nah. But that o' nah importance. I be here to jus' tell ye two things. */
  =
  @2000404 /* First. Whate'er those rapscallions call ye - ye nah "king" o' this bucko. Nah in a thousand years I consider a half-lubber me king. */
  =
  @2000405 /* Second. I, Shithri o' Zenthil Keep, gonna be Queen o' Pirates. */
  =
  @2000406 /* That be all. */
  == PPDESH
  @2000407 /* Consider me mildly amused, girl, by your efforts to speak proper Common. As for the contents - you think how many pirates declared me exactly that? I couldn't care less for you calling me "your king". I care for the actual power. */
  == 6WSHITJ
  @2000408 /* That be why ye'll ne'er truly be the king. */
  DO ~
    SetGlobal("6W#ShithriQueen","GLOBAL",2) // 2 represents the "sober" version
    SetGlobal("6W#ShithriBrynnlawKing","GLOBAL",2)
    AddExperienceParty(48000)
    // cannot use standard SOLVED_JOURNAL here
    AddJournalEntry(@9000010, QUEST_DONE) /* Getting Shithri to Brynnlaw

Shithri talked to the Pirate Lord Desharik and declared to him that it's her who will become the Queen of Pirates. It looks like that is all she had to say to him. */
  ~
  == PPDESH
  @2000409 /* Is that all you came here for? */
END COPY_TRANS PPDESH 1
  IF ~~ THEN
    REPLY @2000410 /* Yes. That's all. */
    EXIT


//
// If Shithri didn't get to talk to Desharik before getting to Spellhold.
//

APPEND 6WSHITJ
  IF ~
    Global("6W#ShithriKing","GLOBAL",3)
  ~ THEN shithri_no_talk_to_desharik
    SAY @2000500 /* Ho, me capt'n! Nahbody that dumb. */
    =
    @2000501 /* Ye promised t' help this bucko speak t' Pirate King. 'n yet here we be - inside o' that house o' madmen. */

    IF ~~ THEN
      REPLY @2000502 /* Well, I intended to go back to help you later... */
      GOTO shithri_no_talk_to_desharik__later

    IF ~~ THEN
      REPLY @2000503 /* I assume you already know I'm here for Imoen. Don't you think rescuing her is more important than your "business" with the Pirate King? */
      GOTO shithri_no_talk_to_desharik__my_thing_more_important

    IF ~~ THEN
      REPLY @2000504 /* I'm here for my revenge on Irenicus. Unless the Pirate King tortured until it drives you mad - I think my business is more important than yours. */
      GOTO shithri_no_talk_to_desharik__my_thing_more_important

    IF ~~ THEN
      REPLY @2000505 /* I'm sorry. That's all I can say. */
      GOTO shithri_no_talk_to_desharik__sorry
  END

  // PERMANENT leave
  IF ~~ THEN shithri_no_talk_to_desharik__later
    SAY@2000520 /* Then ye betta nah wasted me time, yarrr. Off I go. */

    IF ~~ THEN
      DO ~
        AddExperienceParty(12000)
        LeaveParty()
        EscapeArea()
      ~
      SOLVED_JOURNAL @9000020 /* Getting Shithri to Brynnlaw

We went to the asylum before helping Shithri talk to the Pirate King. She wasn't too happy about it. Despite the companionship we shared, she didn't even say goodbye. */
      EXIT
  END

  // PERMANENT leave
  IF ~~ THEN shithri_no_talk_to_desharik__my_thing_more_important
    SAY @2000530 /* Then ye do yer thing, I do me thing. Off I go. */ 

    IF ~~ THEN
      DO ~
        AddExperienceParty(12000)
        LeaveParty()
        EscapeArea()
      ~
      SOLVED_JOURNAL @9000020 /* Getting Shithri to Brynnlaw

We went to the asylum before helping Shithri talk to the Pirate King. She wasn't too happy about it. Despite the companionship we shared, she didn't even say goodbye. */
      EXIT
  END

  // PERMANENT leave
  IF ~~ THEN shithri_no_talk_to_desharik__sorry
    SAY @2000540 /* Why should I care? Ye do yer thing, I do me thing. Off I go. */

    IF ~~ THEN
      DO ~
        AddExperienceParty(12000)
        LeaveParty()
        EscapeArea()
      ~
      SOLVED_JOURNAL @9000020 /* Getting Shithri to Brynnlaw

We went to the asylum before helping Shithri talk to the Pirate King. She wasn't too happy about it. Despite the companionship we shared, she didn't even say goodbye. */
      EXIT
  END
END


//
// Lonk shouldn't say you're in the asylum on your own wish if it's due
// to Shithri's behaviour.
//
// Implementation Note:
//
// Adding a new condition on the existing state transition and adding another
// one, that has a different condition and leads to a new state.
//
// Not the best for compatibility, as WeiDU has no (?) way of copying
// the transition perfectly and keep it synchronized with just a few
// differences.

ALTER_TRANS PPWORKER
BEGIN 0 END
BEGIN 1 END
BEGIN
  "TRIGGER" ~!Global("6W#ShithriQueen","GLOBAL",1)~
END

EXTEND_BOTTOM PPWORKER 0
  IF ~~ THEN REPLY #44123 /* ~No, I don't belong here. I'm just here looking for someone else.~ */
  DO ~
    SetGlobalTimer("JonDoesKill","GLOBAL",360)
    EraseJournalEntry(15760)
  ~
  GOTO shithri_was_drunk
END

APPEND PPWORKER
  IF ~~ THEN BEGIN shithri_was_drunk
    SAY @3000000 /* You really have no idea how often I hear that, do you? Of course you belong here. We have lots of self-proclaimed kings, queens and gods here, after all. There once was an Elminster even. */
    IF ~~ THEN GOTO 2
  END
END


//
// If you promised to join Shithri later on, she will be drinking in Vulgar Monkey
//
// What Shithri talks about with pirpir01 depends on her state of Neera romance.
//

CHAIN IF WEIGHT #-1 ~
  Global("6W#ShithriBrynnlawRespawn","GLOBAL",2)
  !Dead("pirpir01")
  InMyArea("pirpir01")
~ THEN 6WSHITP shithri_brynnlaw_respawn
  @2000700 /* Ho, me matey... Ho, ho, ye there? */
  DO ~
    SetGlobal("6W#ShithriBrynnlawRespawn","GLOBAL",3)
  ~
  == PIRPIR01
  @2000701 /* Huh? Wh-wha'? Shiri? Har har, me hear-ty! *hic* Me prtty, prrtty hear-ty! */
  == 6WSHITP
  @2000702 /* Oy, get yerself together, matey! Nah wanna leave this island nahmore? */
END
  IF ~
    OR(2)
      Global("6W#ShithriNeeraRomanceActive","GLOBAL",0)
      Global("6W#ShithriNeeraRomanceActive","GLOBAL",3)
  ~
  EXTERN PIRPIR01 ask_captn

  IF ~
    Global("6W#ShithriNeeraRomanceActive","GLOBAL",1)
  ~
  EXTERN PIRPIR01 ask_pretty_elven_lady

  IF ~
    Global("6W#ShithriNeeraRomanceActive","GLOBAL",2)
  ~
  EXTERN PIRPIR01 ask_yer_lady

CHAIN PIRPIR01 ask_captn
  @2000710 /* *hic* Wit' that... that... capt'n o' yers? */
  == 6WSHITP
  @2000711 /* Aye! Ye gettin' outta here wit' this bucko and <PRO_HIMHER>, ain't ye? */
EXTERN PIRPIR01 asleep

CHAIN PIRPIR01 ask_pretty_elven_lady
  @2000720 /* *hic* Wit' that... prtty, prtty elvn lady o' yers? */
  == 6WSHITP
  @2000721 /* Half-elven. 'n she nah "lady 'o I". She jus'... */
  =
  @2000722 /* She jus' a... friend. */
EXTERN PIRPIR01 asleep

CHAIN PIRPIR01 ask_yer_lady
  // maybe some languages need a different wording here or sth
  @2000730 /* *hic* Wit' that... prtty, prtty elvn lady o' yers? */
  == 6WSHITP
  @2000731 /* *smirk* ...half-elven. */
EXTERN PIRPIR01 asleep

CHAIN PIRPIR01 asleep
  @2000740 /* zzzZZzzz... */
  == 6WSHITP
  @2000741 /* Ho, me matey! Me matey! Blimey... *gulp* */
EXIT

//
// Add re-join dialogue
//
APPEND 6WSHITP
  IF WEIGHT #-1 ~
    Global("6W#ShithriBrynnlawRespawn","GLOBAL",3)
  ~ THEN shithri_brynnlaw_rejoin
    SAY @2000800 /* Ho, me capt'n! Ahoy! */

    IF ~
      Global("6W#ShithriBrynnlawRespawnNeera","GLOBAL",1)
      IsValidForPartyDialog("Neera")
    ~
      DO ~
        SetGlobal("6W#ShithriBrynnlawRespawn","GLOBAL",4)
        SetGlobal("6W#ShithriBrynnlawRespawnNeera","GLOBAL",2)
      ~
      EXTERN ~NEERAJ~ shithri_brynnlaw_rejoin__neera

    IF ~
      OR(2)
        !Global("6W#ShithriBrynnlawRespawnNeera","GLOBAL",1)
        !IsValidForPartyDialog("Neera")
    ~
      DO ~
        SetGlobal("6W#ShithriBrynnlawRespawn","GLOBAL",4)
      ~
      GOTO shithri_brynnlaw_rejoin__pls_decide
  END
END

APPEND NEERAJ
  IF ~~ THEN shithri_brynnlaw_rejoin__neera
    SAY @2000810 /* ...and "your half-elven lady". Hi. */

    IF ~
      !Global("6W#ShithriNeeraRomanceActive","GLOBAL",2)
    ~ THEN
      EXTERN ~6WSHITP~ shithri_brynnlaw_rejoin__friend1

    IF ~
      Global("6W#ShithriNeeraRomanceActive","GLOBAL",2)
    ~ THEN
      EXTERN ~6WSHITP~ shithri_brynnlaw_rejoin__friend2
  END
END

APPEND 6WSHITP
  IF ~~ THEN shithri_brynnlaw_rejoin__friend1
    SAY @2000811 /* *gulp* I said "friend". */

    IF ~~ THEN
      GOTO shithri_brynnlaw_rejoin__pls_decide
  END

  IF ~~ THEN shithri_brynnlaw_rejoin__friend2
    SAY @2000812 /* Well. Hullo, Neera. */

    IF ~~ THEN
      GOTO shithri_brynnlaw_rejoin__pls_decide
  END

  IF ~~ THEN shithri_brynnlaw_rejoin__pls_decide
    SAY @2000820 /* So, me capt'n. Ye came as promised. */

    IF ~
      !Global("6W#ShithriSaemonBosun","GLOBAL",1)
    ~ THEN
      REPLY @2000821 /* Indeed! Please join me again. */
      GOTO shithri_brynnlaw_rejoin__ok

    IF ~
      Global("6W#ShithriSaemonBosun","GLOBAL",1)
    ~ THEN
      REPLY @2000821 /* Indeed! Please join me again. */
      GOTO shithri_brynnlaw_rejoin__bosun

    IF ~~ THEN
      REPLY @2000822 /* In fact... I wanted to say goodbye. */
      GOTO shithri_brynnlaw_rejoin__goodbye
  END

  IF ~~ THEN shithri_brynnlaw_rejoin__ok
    SAY @2000830 /* Aye aye, capt'n! Gladly! */

    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriBrynnlawRejoin","GLOBAL",2)
        SetGlobal("KickedOut","LOCALS",0)
        JoinParty()
        AddExperienceParty(32000)
      ~
      SOLVED_JOURNAL @9000012 /* Getting Shithri to Brynnlaw

I came back for Shithri, as promised. She seems to be done with her "business" now. */
      EXIT
  END
  IF ~~ THEN shithri_brynnlaw_rejoin__bosun
    SAY @2000831 /* Aye, I heard ye got this bosun a job, har har. Good thinkin'. */

    IF ~~ THEN
      DO ~
        SetGlobal("6W#ShithriBrynnlawRejoin","GLOBAL",2)
        SetGlobal("KickedOut","LOCALS",0)
        JoinParty()
        AddExperienceParty(32000)
      ~
      SOLVED_JOURNAL @9000012 /* Getting Shithri to Brynnlaw

I came back for Shithri, as promised. She seems to be done with her "business" now. */
      EXIT
  END

  IF ~~ THEN shithri_brynnlaw_rejoin__goodbye
    SAY @2000840 /* Huh. As ye wish. *gulp* */

    IF ~
      IsValidForPartyDialog("Neera")
      Global("6W#ShithriNeeraRomanceActive","GLOBAL",2)
    ~ THEN
      DO ~
        SetGlobal("6W#ShithriBrynnlawRejoin","GLOBAL",2)
        SetGlobal("KickedOut","LOCALS",1)
        AddExperienceParty(32000)
      ~
      SOLVED_JOURNAL @9000013 /* Getting Shithri to Brynnlaw

I met with Shithri to say my goodbye. Despite the companionship we shared, she didn't even answer it. */
      EXTERN ~NEERAJ~ shithri_brynnlaw_rejoin__goodbye_neera

    IF ~
      OR(2)
        !IsValidForPartyDialog("Neera")
        !Global("6W#ShithriNeeraRomanceActive","GLOBAL",2)
    ~ THEN
      DO ~
        SetGlobal("6W#ShithriBrynnlawRejoin","GLOBAL",2)
        SetGlobal("KickedOut","LOCALS",1)
        AddExperienceParty(32000)
      ~
      SOLVED_JOURNAL @9000013 /* Getting Shithri to Brynnlaw

I met with Shithri to say my goodbye. Despite the companionship we shared, she didn't even answer it. */
      EXIT
  END
END

APPEND NEERAJ
  IF ~~ THEN shithri_brynnlaw_rejoin__goodbye_neera
    SAY @2000841 /* Thanks for making it clear, <CHARNAME>. You did keep your word... kinda. Anyway. Bye! */

    IF ~~ THEN
      DO ~
        SetGlobal("KickedOut","LOCALS",1)
        LeaveParty()
        SetLeavePartyDialogFile()
        ChangeAIScript("",DEFAULT)
        MoveToObjectOffset("6WSHITHRI", [55.-45])
      ~
      EXIT
  END
END


//
// Some extra interjections here and there, coded as @201....
//

// Saemon says he saw Irenicus's journal and overall acts cooperative
//
// Implementation Note:
// No particular in-universe reason, but I (Udiknedormin) just love
// the Jan Jansen's interjection too much for Shithri to speak instead
// of him, so she'll be the second one in priority order:
// 1. Jan
// 2. Shithri
// 3. Imoen
// 4. Nalia
INTERJECT PPSAEM2 21 6W#ShithriSaemonJournalNahTrust
  == 6WSHITJ IF ~
    !IsValidForPartyDialog("Jan")
    IsValidForPartyDialog("6WSHITHRI")
  ~
  @2010000 /* This bucko nah believe one bit o' yer pretty words, corsair. At least that mage keeps his mug shut well. */
END PPSAEM2 22

// Saemon says he expects nothing in return and offers to run away via his ship.
// Shithri doesn't trust him, but feels better about the sea than the Underdark.
//
// Implementation Note:
// It's all-speak situation, so it's easier to implement for Shithri to come first.
// Plot-wise it fits ok too, as she may be more eager than Korgan. Also works well that
// Shithri is pro-ship and right after her is Korgan, who is strongly anti-ship.
//
// Order:
// 1. Shithri
// 2. Korgan
// 3. Viconia
// 4. Aerie
// 5. Imoen
INTERJECT_COPY_TRANS PPSAEM2 19 6W#ShithriSaemonNoCondition
  == 6WSHITJ IF ~
    IsValidForPartyDialog("6WSHITHRI")
  ~
    @2010100 /* Me capt'n, this rapscallion has a point. 'n on the sea, this bosun can keep an eye on 'im. */
END

// Can demand for Shithri to be the bosun if she's either present
// or you promised to rejoin her later on.
EXTEND_BOTTOM PPSAEM2 20
  IF ~
    OR(2)
      InParty("6WSHITHRI")
      Global("6W#ShithriBrynnlawRejoin","GLOBAL",1)
  ~
    REPLY @2010101 /* I have one condition: my friend Shithri will be the ship's bosun. */
    GOTO shithri_bosun_condition
END
APPEND PPSAEM2
  IF ~~ THEN shithri_bosun_condition
    SAY @2010102 /* That pirate girl? I can agree to that, she's a fine sailor. */

    IF ~~ THEN
      // copied from the previously-existing answer
      REPLY #45271 /* Very well. Lead the way out, and we shall take your ship. */
      DO ~
        SetGlobal("6W#ShithriSaemonBosun","GLOBAL",1)
      ~
      GOTO 27
  END
END

// Desharik adds siding with Shithri to Saemon's list of sins
INTERJECT_COPY_TRANS PPDESH2 3 6W#ShithriDesharikSaemon
  == PPDESH2 IF ~
    InParty("6WSHITHRI")
  ~
  @2010200 /* And you even sided with that self-proclaimed "pirate queen", I can see! */
END

// Saemon comments on how <CHARNAME> is not his henchmen. But Shithri may be.
ADD_STATE_TRIGGER PPSAEM3 41 ~
  !InParty("6WSHITHRI")
~
APPEND PPSAEM3
  IF ~
    Global("AsylumPlot","GLOBAL",78)
    InParty("6WSHITHRI")
  ~ THEN 6W#SaemonSetSail
    SAY @2010300 /* Cast off the mains! We are away! Set sights on the mainland! Shithri, sails! [PPSAEM27] */

    IF ~~ THEN SOLVED_JOURNAL #15701 /* ~Leaving the island

Af  ter I stole the horn to open up the sea gates and a brief battle with Desharik's men, we have taken to the open sea. I dislike being used in this fashion, although Saemon did reward me with the sword that he said he would. It is a beautiful silver and valuable-looking. I do not understand why he was so put off by it. Regardless, it will serve me well. Now hopefully there are no more surprises awaiting me on the sea.~ */ GOTO 68
    END
END

//
// Saemon & Githyanki - Shithri obviously comments the betrayal,
// especially considering how she was supposed to keep an eye on him.
//
// Implementation Note:
// No other companion comments it, but the PC does. Shithri can comment
// instead.
INTERJECT PPSAEM3 55 6W#ShithriSaemonGithyanki
  == 6WSHITJ IF ~IsValidForPartyDialog("6WSHITHRI")~
  @2010400 /* Ye rapscallion, I could watch the upperdeck all day 'n still fail t' notice... */
END PPSAEM 56


//
// Some pirates at Vulgar Monkey should react to Shithri
//

// Implementation Note:
// Pirate Bill tells a pirate joke - if Shithri's in the party,
// she can guess the answer to his "riddle".
//
// Problem being: some language versions (e.g. Polish) have the joke
// mistranslated:
//
// The original riddle: "Aye, mate, bend yer ear fer a secon'... Whaddaya call a fish wit' no eyes?"
// Answer would be: "Fsh". Like "fish" but with no "i" (eye).
//
// Polish version (aside from not sounding any "piratey") is translated literally though,
// while that joke doesn't work in Polish. Weird, considering the next string contains the answer,
// but maybe the translator still didn't get it or simply had no idea how to translate it.
//
// Because it doesn't seem probable for another mod to modify this particular
// character's state 0, this one will "fix" the joke by assigning it a new
// string that will be translated so that the joke holds.
//
// It's implemented simply by appending a state with weight.
//
// Note: yeah, could use a variable to use the original string for English
// and some other for Polish or something, but that's a compatibility nightmare
// for a relatively minor advantage of not including the original text here.
APPEND PIRPIR07
  IF WEIGHT #-1 ~True()~ pirate_bill_joke
    SAY @3000100 /* Aye, mate, bend yer ear fer a secon'... Whaddaya call a fish wit' no eyes? */

    IF ~~ THEN
      GOTO pirate_bill_joke__land_lubber

    IF ~IsValidForPartyDialog("6WSHITHRI")~
      EXTERN ~6WSHITJ~ pirate_bill_joke__answer
  END

  IF ~~ THEN pirate_bill_joke__land_lubber
    SAY @3000101 /* Fssshhh! Har, har, har, ye're a landlubber if e'er I saw one, mate! */
    IF ~~ THEN
      EXIT
  END

  IF ~~ THEN pirate_bill_joke__good_answer_shithri
    SAY @3000103 /* Har har! I see ye're a fine bucko, mate! */
    IF ~~ THEN
      EXIT
  END
END

APPEND 6WSHITJ
  IF ~~ THEN pirate_bill_joke__answer
    SAY @3000102 /* I know that one! Fssshhh! */

    IF ~~ THEN
      EXTERN ~PIRPIR07~ pirate_bill_joke__good_answer_shithri
  END
END


// Implementation Note:
// Pirate Jimmy's song seems to be a reference
// to "I lobster, never flounder" from 1992.
//
// Despite the translations not really being accurate, Shithri
// can still answer them with the next line of the song just fine,
// so it doesn't seem necessary to do the same as with pirate Bill.
EXTEND_BOTTOM PIRPIR09 0
  IF ~IsValidForPartyDialog("6WSHITHRI")~ THEN
    EXTERN ~6WSHITJ~ pirate_jimmy_song__next_line
END

APPEND 6WSHITJ
  IF ~~ THEN pirate_jimmy_song__next_line
    SAY @3000200 /* Oh cod, I love 'er, I do! */

    IF ~~ THEN
      EXIT
  END
END


// Pirates Scotty and Paul sing self-contained songs,
// no need for Shithri's answer.


// Pirate Newt - sings "I'se The B'y" - a Newfoundland folk ballad
// Shithri answers with the last line of the chorus
EXTEND_BOTTOM PIRPIR12 0
  IF ~IsValidForPartyDialog("6WSHITHRI")~ THEN
    EXTERN ~6WSHITJ~ pirate_newf_song__next_line
END

APPEND 6WSHITJ
  IF ~~ THEN pirate_newf_song__next_line
    SAY @3000300 /* ...All around the circle! */

    IF ~~ THEN
      EXIT
  END
END

