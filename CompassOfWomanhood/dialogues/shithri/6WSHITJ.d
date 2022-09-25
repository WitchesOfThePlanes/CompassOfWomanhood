// Shithri - in-party dialogues
//
BEGIN 6WSHITJ


//
// Cernd and his house
//

// triggered by Global("CerndBeggar","GLOBAL",2) in Shithri's script
CHAIN IF ~
  IfValidForPartyDialogue("6WSHITHRI")
  IfValidForPartyDialogue("Cernd")
  See("Cernd")
  Global("6W#Shithri_Cernd_House","GLOBAL",3)
  // either before house talks, or after they're resolved
~ THEN 6WSHITJ 6W#shithri_cernd_house_0
  // pulgor - druid, "priest of the forest"
  @1070200 /* 'Tis... 'tis yer house? In... city o' bricks 'n marbles? Wit'... servants? Wit' wife? */
  DO ~SetGlobal("6W#Shithri_Cernd_House","GLOBAL",4)~
  = 
  @1070201 /* Ye nah pulgor. Ye- ye HUMAN! */
  == CERNDJ
  @1070202 /* It is but the past, my dear. But everything changes. And so do I. My call to nature... */
  == 6WSHITJ
  @1070203 /* Avast, human. No more words from ye. No more. */
EXIT

// triggered by Global("CerndSpawnAfterBabyDelivered","GLOBAL",2) in Shithri's script
CHAIN IF ~
  IfValidForPartyDialogue("6WSHITHRI")
  IfValidForPartyDialogue("Cernd")
  See("Cernd")
  Global("6W#Shithri_Cernd_House","GLOBAL",5)
  // either before house talks, or after they're resolved
~ THEN 6WSHITJ 6W#shithri_cernd_house_1
  @1070300 /* Ho, hu- me matey! */
  DO ~SetGlobal("6W#Shithri_Cernd_House","GLOBAL",6)~
  == CERNDJ
  @1070301 /* I do listen, oh child of mountains. */
  == 6WSHITJ
  @1070302 /* Me matey... nah. Pulgor. I be sorry. */
  =
  @1070303 /* Yer past nah define ye. 'tis nah about city even. */
  =
  // gubuk - humanoid such as human, elf or halfling, lit. "soft-skinned"
  @1070304 /* Pulgor. I be angry at another gubuk. */
  == CERNDJ
  @1070305 /* I thought he was an elf, not human. */
  == 6WSHITJ
  @1070306 /* ... */
  =
  // gubar - plural of gubuk
  @1070307 /* (damn 'em, gubar, always thinkin' they so cunnin') */
EXIT

// triggered by Global("LavokDead","GLOBAL",1) in Shithri's script
CHAIN IF ~
  IfValidForPartyDialogue("6WSHITHRI")
  IfValidForPartyDialogue("Valygar")
  See("Valygar")
  Global("6W#Shithri_Valygar_lavok","GLOBAL",1)
  // either before house talks, or after they're resolved
~ THEN 6WSHITJ 6W#shithri_valygar_lavok
  @1140300 /* Let's splice the mainbrace fer yer success, me hearty. */
  DO ~SetGlobal("6W#Shithri_Valygar_lavok","GLOBAL",2)~
  == VALYGARJ
  @1140301 /* Thank you. */
  == 6WSHITJ
  @1140302 /* Shanties? */
  == VALYGARJ
  @1140303 /* No. */
EXIT
