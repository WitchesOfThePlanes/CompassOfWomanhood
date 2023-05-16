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



//
// Hexxat
//



//
// Rasaad
//



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

