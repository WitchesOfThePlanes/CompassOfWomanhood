// CALY - party banters
//
BEGIN B6WCALY

//
// Edwin
//



//
// Imoen
//



//
// Jaheira
//

CHAIN IF ~
  IfValidForPartyDialogue("6WCALY")
  IfValidForPartyDialogue("Jaheira")
  CombatCounter(0)
  See("Jaheira")
  // their banters don't have any particular order
  Global("6W#banter_Caly_Jaheira_0","GLOBAL",0)
~ THEN B6WCALY 6W#banter_caly_jaheira_0
  @1020000 /* I consider every religion and every mindset important and worth listening to. */
  DO ~SetGlobal("6W#banter_Caly_Jaheira_0","GLOBAL",1)~
  == BJAHEIR
  @1020001 /* I consider you to have too much time on your hands, child. */
  == B6WCALY
  @1020002 /* But haven't you ever pondered the nature of things and the seed of truth in every faith and culture? */
  == BJAHEIR
  @1020003 /* You have much to learn about the harsh reality. */
  == B6WCALY
  @1020004 /* Truly, the world is harsh, but isn't it wonderful too? */
EXIT

CHAIN IF ~
  IfValidForPartyDialogue("6WCALY")
  IfValidForPartyDialogue("Jaheira")
  CombatCounter(0)
  See("Jaheira")
  // their banters don't have any particular order
  Global("6W#banter_Caly_Jaheira_1","GLOBAL",0)
~ THEN B6WCALY 6W#banter_caly_jaheira_1
  @1020100 /* My lady, I wanted to say that I really admire that you took our party under your wings. */
  DO ~SetGlobal("6W#banter_Caly_Jaheira_1","GLOBAL",1)~
  == BJAHEIR
  @1020101 /* I prefer a bear's paws rather than bird's wings, my child. And an embrace rather than flight. Like the Eartmother herself. */
  == B6WCALY
  @1020102 /* Oh. I never... that thought is so foreign to me. Like a different Plane, almost. */
  =
  @1020103 /* I will think about it. */
EXIT



//
// Minsc
//


CHAIN IF ~
  IfValidForPartyDialogue("6WCALY")
  IfValidForPartyDialogue("Minsc")
  CombatCounter(0)
  See("Minsc")
  Global("6W#banter_Caly_Minsc","GLOBAL",0)
~ THEN B6WCALY 6W#banter_caly_minsc_0
  @1030000 /* Oooh, what a lovely creature you have here! */
  DO ~SetGlobal("6W#banter_Caly_Minsc","GLOBAL",1)~
  == BMINSC
  @1030001 /* Boo is no ordinary hamster, Caly! */
  == B6WCALY
  @1030002 /* I have to say I respect your decision to have no ordinary hamster. */
  == BMINSC
  @1030003 /* Ah, of course, you can see Boo's might. Noone kicks butts of evil like he does! */
  == B6WCALY
  @1030004 /* It must be hard for other, closed minds to see the... unordinariness of your hamster. But don't worry, I assure you I respect your decision to keep and take care of Boo! */
  == BMINSC
  @1030005 /* It's Boo who takes care of Minsc with his wisdom. Always leading my blade to victory! */
  == B6WCALY
  @1030006 /* Uh, oh. Well... */
EXIT

CHAIN IF ~
  IfValidForPartyDialogue("6WCALY")
  IfValidForPartyDialogue("Minsc")
  CombatCounter(0)
  See("6WCALY")
  Global("6W#banter_Caly_Minsc","GLOBAL",1)
~ THEN BMINSC 6W#banter_caly_minsc_1
  @1030100 /* What happened, Boo? You seem anxious. */
  DO ~SetGlobal("6W#banter_Caly_Minsc","GLOBAL",2)~
  == B6WCALY
  @1030101 /* Traveling must be hard for such a fragile creature, I can imagine. */
  == BMINSC
  @1030102 /* Fragile? Boo is plenty strong! He's packed with goodness and might! He looks in the eyes of evil and squeaks in frenzy! */
  == B6WCALY
  @1030103 /* Yes, of course, the might must be strong in the creature of such... frame. */
  == BMINSC
  @1030104 /* He may be small, but... Hey, I thought you respected Boo! */
  == B6WCALY
  @1030105 /* But of course I did! */
  == BMINSC
  @1030106 /* ...did? */
EXIT

CHAIN IF ~
  IfValidForPartyDialogue("6WCALY")
  IfValidForPartyDialogue("Minsc")
  CombatCounter(0)
  See("Minsc")
  Global("6W#banter_Caly_Minsc","GLOBAL",2)
~ THEN B6WCALY 6W#banter_caly_minsc_2
  @1030200 /* Greetings, oh mighty Boo! Greetings to you too, Minsc. */
  DO ~SetGlobal("6W#banter_Caly_Minsc","GLOBAL",3)~
  == BMINSC
  @1030201 /* I know you're mocking Boo. I am quite used to it, it doesn't bother any of us. */
  == B6WCALY
  @1030202 /* I'm not mocking him, truly! I came to tell you that I realized my mistake. I let my better judgment cloud my vision, and my prejudice spoke for me. */
  == BMINSC
  @1030203 /* Your words are strange. But Minsc is not so good with words. */
  == B6WCALY
  @1030204 /* What I mean is - Boo is truly an amazing and powerful warrior. And you must be grateful that he took you under his care. */
  == BMINSC
  @1030205 /* So... you respect Boo now? */
  == B6WCALY
  @1030206 /* I do. And I'm happy I joined you both on this adventure. */
EXIT


//
// Viconia
//



//
// Aerie
//



//
// Anomen
//




//
// Cernd
//



//
// Haer'Dalis
//



//
// Jan Jansen
//



//
// Keldorn
//



//
// Korgan
//

CHAIN
  IfValidForPartyDialogue("6WCALY")
  IfValidForPartyDialogue("Korgan")
  See("6WCALY")
  Global("6W#banter_Caly_Korgan","GLOBAL",0)
~ THEN B6WCALY 6W#banter_caly_korgan_0
  @1110000 /* Oh Korgan, that enormous axe of yours is indeed very impressive. Is it some form of compensation? */
  DO ~SetGlobal("6W#banter_Caly_Korgan","GLOBAL",1)~
  == BKORGAN
  @1110001 /* Har har, it's a promise! */
  == B6WCALY
  @1110002 /* Let me make a guess. Does it symbolize how you like to finish your undertakings in one stroke? */
  == BKORGAN
  @1110003 /* It's nae about how many there are, but what a stroke that is makes all the difference. If it makes blood run hot, it's good. */
  == B6WCALY
  @1110004 /* “Fleeting” might be the word you are looking for. */
  == BKORGAN
  @1110005 /* Oh, ye're sayin' it as if wenches nae like that! */
  == B6WCALY
  @1110006 /* They surely do. As do many women who enjoy the gloss of coins. */
  == BKORGAN
  @1110007 /* As do I! Fast strokes, shining gold. And nae wasting me time. */
  == B6WCALY
  @1110008 /* Wasting time... I can see it could be called that in your case, indeed. Thank you for an exhaustive lecture. */
  == BKORGAN
  @1110009 /* Any time, lass! */
EXIT

CHAIN
  IfValidForPartyDialogue("6WCALY")
  IfValidForPartyDialogue("Korgan")
  See("6WCALY")
  Global("6W#Caly_chose_light","GLOBAL",1)
  Global("6W#banter_Caly_Korgan_light","GLOBAL",0)
~ THEN B6WCALY 6W#banter_caly_korgan_light_0
  @1111000 /* If I speak with devas and unicorns kneel before me, but do not have love, I am only a clanging copper. */
  DO ~SetGlobal("6W#banter_Caly_Korgan","GLOBAL",1)~
  == BKORGAN
  @1111001 /* Yer face ain't yellow enough fer ye t' speak like that. */
  == B6WCALY
  @1111002 /* I was but quoting psalm 21:37, for the glory of our Lady, Selûne. */
  == BKORGAN
  @1111003 /* That goddess o' yers knows nah business. */
  == B6WCALY
  @1111004 /* She has no need to, you simpleton. */
EXIT


//
// Mazzy
//



//
// Nalia
//



//
// Valygar
//



//
// Yoshimo
//



//
// Dorn
//



//
// Neera
//

CHAIN IF ~
  IfValidForPartyDialogue("6WCALY")
  IfValidForPartyDialogue("Neera")
  See("6WCALY")
  Global("6W#banter_Caly_Neera","GLOBAL",0)
~ THEN BNEERA 6W#banter_caly_neera_0
  @1170000 /* Caly, Caly, Caly. Hmm... And Caly of Calimshan at that! Doesn't it sound weird? Not really your typical name, more like a nickname, really. */
  =
  @1170001 /* But if so, what was it before? Kali? Khali? Kaliii? */
  DO ~SetGlobal("6W#banter_Caly_Neera","GLOBAL",1)~

  BRANCH ~IfValidForPartyDialog("Rasaad")~
    == BRASAAD
    @1170010 /* Khalifa would be my guess. */
  BEGIN

  == B6WCALY
  @1170020 /* Caly is all you need, my dear. */
  == BNEERA
  @1170021 /* But... */
  == B6WCALY
  @1170022 /* Please respect my life choices, Neera. */
  == BNEERA
  @1170023 /* Ok ok, I was just curious! Why so serious... */
EXIT

CHAIN IF ~
  IfValidForPartyDialogue("6WCALY")
  IfValidForPartyDialogue("Neera")
  See("Neera")
  Global("6W#Caly_chose_dark","GLOBAL",1)
  Global("6W#banter_Caly_Neera_dark","GLOBAL",0)
~ THEN 6WCALY 6W#banter_caly_neera_dark_0
  @1171000 /* We are not so different, Neera. Both of us have been touched by cosmic forces feared by many. And both of us embraced them dearly as a part of ourselves. */
  DO ~SetGlobal("6W#banter_Caly_Neera_dark","GLOBAL",0)~
  == BNEERA
  @1171001 /* Isn't yours more, you know, dark? I'm pretty sure it IS darkness, literally. Or shadows. I'm not sure what's the exact difference. */
  == B6WCALY
  @1171002 /* Shadow is when the light meets the dark. Pleasure meets pain. It's like being born and dying. And hearing the sound of silence. */
  == BNEERA
  @1171003 /* Hmm. Not THAT different then, yeah. Except for the last part. And also the first part. Not sure if I'd put the second one that way. It's more like dread and euphoria. */
  == B6WCALY
  @1171004 /* It is that too, in a way. */
  == BNEERA
  @1171005 /* How about wild surges? */
  == B6WCALY
  @1171006 /* I don't know how those feel. How could shadows devour me if I'm one with them? */
  == BNEERA
  @1171007 /* Not so similar then. */
  == B6WCALY
  @1171008 /* Perhaps. Perhaps not. */
EXIT


//
// Hexxat
//

CHAIN IF ~
  IfValidForPartyDialogue("6WCALY")
  IfValidForPartyDialogue("Hexxat")
  See("Hexxat")
  CombatCounter(0)
  // their banters don't have any particular order
  Global("6W#banter_Caly_Hexxat_0","GLOBAL",0)
~ THEN B6WCALY 6W#banter_caly_hexxat_0
  @1180000 /* Oh, come on. Don't be shy. */
  DO ~SetGlobal("6W#banter_Caly_Hexxat_0","GLOBAL",1)~
  == BHEXXAT
  @1180001 /* What do you mean? */
  == B6WCALY
  @1180002 /* Hexxat, will you be giving me those looks all day or will we... fight patriarchy together? */
  == BHEXXAT
  @1180003 /* I didn't... Caly, I don't think you and I share the same priorities in life. */
  == B6WCALY
  @1180004 /* Well, I know we don't. But we might share them in death. */
  == BHEXXAT
  @1180005 /* Stop. */
EXIT

CHAIN IF ~
  IfValidForPartyDialogue("6WCALY")
  IfValidForPartyDialogue("Hexxat")
  See("6WCALY")
  CombatCounter(0)
  Global("6W#Caly_chose_light","GLOBAL",0)
  !Global("HexxatRomanceActive","GLOBAL",2)
  Global("6W#banter_Caly_Hexxat_1","GLOBAL",0)
~ THEN BHEXXAT 6W#banter_caly_hexxat_1
  @1180100 /* I noticed you expose your neck a lot, lately. */
  DO ~SetGlobal("6W#banter_Caly_Hexxat_1","GLOBAL",1)~
  == B6WCALY
  @1180101 /* And I noticed you are a very observant woman. Or shall I say inquisitive? */
  == BHEXXAT
  @1180102 /* I'm not. Stop it. */
  == B6WCALY
  // In the Polish version, Caly uses an alliteration rather than a rhyme: ,,ekskursje w dyskursie''
  // (meaning similar as English "excursions in the discourse", but sounds much more sophisticated),
  // which is also the name of a blog by a Polish writer and journalist Wojciech Orliński. It's probably
  // one of the oldest Polish blogs that are still active in 2023 (it was started in 2006).
  @1180103 /* My dear, you know I cannot refuse myself the pleasure of exploration in a conversation? */
  == BHEXXAT
  @1180104 /* I meant your neck. */
  == B6WCALY
  @1180105 /* Oh. Did I make you intrigued? */
  == BHEXXAT
  @1180106 /* No. You made yourself unsafe. */
EXIT

CHAIN IF ~
  IfValidForPartyDialogue("6WCALY")
  IfValidForPartyDialogue("Hexxat")
  See("Hexxat")
  CombatCounter(0)
  Global("6W#Caly_chose_light","GLOBAL",0)
  !Global("HexxatRomanceActive","GLOBAL",2)
  OR(2)
    Global("6W#banter_Caly_Hexxat_0","GLOBAL",1)
    Global("6W#banter_Caly_Hexxat_1","GLOBAL",1)
  Global("6W#banter_Caly_Hexxat_2","GLOBAL",0)
~ THEN B6WCALY 6W#banter_caly_hexxat_2
  @1180200 /* Tell me, Hexxat. Is that true? */
  DO ~SetGlobal("6W#banter_Caly_Hexxat_2","GLOBAL",1)~
  == BHEXXAT
  @1180201 /* I don't read minds, Caly. */
  == B6WCALY
  @1180202 /* About the vampires. Or, more precisely, vampiresses. Are they like piratesses? */

  BRANCH ~IfValidForPartyDialog("6WSHIT")~
    == B6WSHIT
    @1180210 /* Piratess...es? */
  BEGIN

  == BHEXXAT
  @1180220 /* Some of them. Perhaps. */
  == B6WCALY
  @1180221 /* But not you. You are special. */
  == BHEXXAT
  @1180222 /* I may be, yes. */
  == B6WCALY
  @1180223 /* And I don't dislike that. */
  == BHEXXAT
  @1180224 /* Good. */
EXIT

CHAIN IF ~
  IfValidForPartyDialogue("6WCALY")
  IfValidForPartyDialogue("Hexxat")
  See("Hexxat")
  CombatCounter(0)
  Global("6W#Caly_chose_light","GLOBAL",1)
  Global("6W#banter_Caly_Hexxat_light_0","GLOBAL",0)
~ THEN B6WCALY 6W#banter_caly_hexxat_5
  @1181000 /* My Lady, lead me not into temptation. If you are willing, take this cup from me. */
  DO ~SetGlobal("6W#banter_Caly_Hexxat_light_0","GLOBAL",1)~
  == BHEXXAT
  @1181001 /* Can I help you, Caly? */
  == B6WCALY
  @1181002 /* May I not stare at her because she is dark. Because she is cursed to never see the sun. And like a rose's, her beauty lies among thorns. */
  == BHEXXAT
  @1181003 /* Flattering. */
EXIT


//
// Rasaad
//

CHAIN IF ~
  IfValidForPartyDialogue("6WCALY")
  IfValidForPartyDialogue("Rasaad")
  See("6WCALY")
  CombatCounter(0)
  Global("6W#Caly_chose_dark","GLOBAL",0)
  Global("6W#banter_Caly_Rasaad","GLOBAL",0)
~ THEN BRASAAD 6W#banter_caly_rasaad_0
  @1190000 /* Seeing a fellow Selûnite at my side fills my heart with... */
  DO ~SetGlobal("6W#banter_Caly_Rasaad","GLOBAL",1)~
  == B6WCALY
  @1190001 /* Joy? */
  == BRASAAD
  @1190002 /* Would you call it joy if it's a darkness darker than dark, grasping my soul like a moonless night sky? */
  == B6WCALY
  @1190003 /* There are many ways to feel joy. All of them valid. */
  == BRASAAD
  @1190004 /* It's not joy, Caly. */
  == B6WCALY
  @1190005 /* I do hope it's not shame, at the very least. */
  == BRASAAD
  @1190006 /* No. Some day you may understand. But I hope you won't. */
EXIT

CHAIN IF ~
  IfValidForPartyDialogue("6WCALY")
  IfValidForPartyDialogue("Rasaad")
  See("Rasaad")
  CombatCounter(0)
  Global("6W#Caly_chose_dark","GLOBAL",0)
  Global("6W#banter_Caly_Rasaad","GLOBAL",1)
~ THEN B6WCALY 6W#banter_caly_rasaad_1
  @1190100 /* Pray tell, oh my brother in faith, why are your eyes following my movements so meticulously? */
  DO ~SetGlobal("6W#banter_Caly_Rasaad","GLOBAL",2)~
  == BRASAAD
  @1190101 /* I was wondering. I rarely saw female monks of my order... */
  == B6WCALY
  @1190102 /* Oh my, oh my. I didn't expect you to be that late of a bloomer. */
  == BRASAAD
  @1190103 /* ...but I think I would still recognize their robes. Yet yours strike me as strange and unfamiliar. */
  == B6WCALY
  @1190104 /* So it's about the way I dress. What else could it have been? */
  == BRASAAD
  @1190105 /* I didn't want to upset you. */
  == B6WCALY
  @1190106 /* I am not upset. It was to be expected. */
  == BRASAAD
  @1190107 /* I am sorry, Caly. It wasn't my intention to offend you. */
  == B6WCALY
  @1190108 /* Oh, please! You're a man and nothing manly is alien to you. As we can all see. */
  == BRASAAD
  @1190109 /* I am truly sorry and that is all I can do. I will leave now. */
EXIT

CHAIN IF ~
  IfValidForPartyDialogue("6WCALY")
  IfValidForPartyDialogue("Rasaad")
  See("Rasaad")
  CombatCounter(0)
  Global("6W#Caly_chose_dark","GLOBAL",1)
  Global("6W#banter_Caly_Rasaad_dark","GLOBAL",0)
~ THEN BRASAAD 6W#banter_caly_rasaad_dark_0
  @1191000 /* Please, think it through. */
  DO ~SetGlobal("6W#banter_Caly_Rasaad_dark","GLOBAL",1)~
  == B6WCALY
  @1191001 /* Look who's saying that. */
  == BRASAAD
  @1191002 /* I know. But maybe it's not too late for you? */
  == B6WCALY
  @1191003 /* You seem misguided. I didn't abandon the moon. */
  == BRASAAD
  @1191004 /* You didn't? */
  == B6WCALY
  @1191005 /* No. For darkness is my moon. */
  =
  @1191006 /* You won't be whole until you cast shadow. Like a candle. */
  =
  @1991007 /* Silent? I thought so. You wouldn't dare disturb the sound of silence. Unlike a candle. */
EXIT


//
// Wilson
//
// Note: in vanilla BG2:EE, Wilson has no banter file (no bwilson.dlg),
// so the banters need to be initiated by the other characters
// and Wilson's answers - added in wilsonj.dlg.
//
// While it is possible to add bwilson.dlg instead, it's simpler to do it
// this way. Especially considering how adding a bwilson.dlg file may be
// incompatible with WilsonChronicles mod.

