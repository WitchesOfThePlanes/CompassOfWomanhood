This file contains more detailed description of the mod, but does contain some spoilers.


## Mechanics

Shithri has a unique innate ability: Sea Shanty. It's somewhat of a weaker hybrid between bard song and enrage ability: it grants her +1 Luck bonus, as well as immunities to sleep, fear, confusion and stun - but forces her to be visible. It lasts a full turn, i.e. 10 rounds, 60 seconds.

What makes this ability truly unique, however, is the fact Shithri cannot use it in forest areas (due to [religious](#religion) reasons). Similarly to a bard song, Shithri hums each round, so if she moves to a forest area at any time, she till cease to hum until she comes back to a non-forest area. You can see how it works in Umar Hills - a forest area with a non-forest inn you can enter. While you cannot activate the ability at all while in Umar Hills, you can do so while in its inn - it will be put to hold if you go out of it.

Shithri can use Sea Shanty ability twice a day. Unlike berserker's Enrage ability, Sea Shanty can be reactivated immediately after it ends.

Implementation details: this ability is internally implemented as a spell loop (i.e. spelling calling itself with some delay, in this case - a round) with a short period of spell immunity for that spell added after some time (in this case - full turn).


## Banters

Shithri forms multiple relationships with her fellow companions. Below is the list of them. Note that Shithri talks with all the canon BG2:EE companions, but doesn't form meaningful relationships with all of them. Making fun of Edwina (like pretty much everyone) hardly counts.

Mostly spoiler-free list of how many banters she has with each companion:

 * Edwin: 2 (SoA) + 2 (SoA, as Edwina)
 * Imoen: 1 (SoA) + 2 (ToB)
 * Jaheira: 2 (SoA) + 1 (ToB)
 * Minsc: 3 (SoA) + 1 (SoA, Minsc & Korgan)
 * Viconia: 1 (SoA) + 1 (ToB)
 * Aerie: 2 (SoA) + 1 (ToB)
 * Anomen: 2 (SoA) + 1 (SoA, if Anomen failed) + 1 (ToB, if Anomen passed) + 1 (ToB, if Anomen failed)
 * Cernd: 4 (SoA) + 1 (ToB)
 * Haer'Dalis: 5 (SoA)
 * Jan Jansen: 1 (SoA) + 1 (ToB)
 * Keldorn: 1 (SoA) + 1 (ToB)
 * Korgan: 2 (SoA) + 1 (SoA, Minsc & Korgan) + 1 (ToB)
 * Mazzy: 2 (SoA) + 1 (ToB)
 * Nalia: 2 (SoA) + 3 (ToB)
 * Valygar: 3 (SoA) + 1 (ToB)
 * Yoshimo: 1 (SoA)
 * Sarevok: 1 (ToB)
 * Dorn: 3 (SoA) + 2 (ToB)
 * Neera: 14 (SoA) + 2 (ToB)
 * Hexxat: 2 (SoA) + 1 (ToB)
 * Rasaad: 1 (SoA)
 * Wilson: 1 (SoA)

HEAVY SPOILERS AHEAD

And here is the more detailed list of relationships:

 * Edwin - Shithri usually makes fun of his muttering. When he becomes Edwina, she takes making fun of him to a whole new level.
 * Imoen - standard Imoen stuff with her typical Socratic sense of humor.
 * Jaheira - Shithri calls Jaheira "sha'nru", orcish for "auntie". That should explain everything.
 * Minsc - initially suspicious, but convinced by Boo to give Shithri a chance. They become such good friends that the two of them can even have a drink with Korgan with no drama.
 * Viconia - mocks Shithri for allegedly being an half-elf, as well as for liking women (note that it's not that accepted among drow women).
 * Aerie - Shithri treats her like a child in SoA, but grows respect for her in ToB.
 * Anomen - he considers her a lowly person for many reasons and they may come to blows. She treats him well was he to fail his trial though, and they can become quite good friends as a result. If he passes, he won't try to fight her but will still look down on her.
 * Cernd - Shithri has much respect for him, treating him like the closest equivalent of her religion's priest.
 * Haer'Dalis - they share mutual respect of experienced swordmen, as well as share some stories and songs.
 * Jan Jansen - Shithri tries to write a perfect shanty about his uncle Scratchy.
 * Keldorn - treats Shithri as a sinful person, both for her piracy and rather casual sexual behaviours. Shithri, on the other hand, respects his knight morals but is amused by his prudeness.
 * Korgan - initially calls Shithri names, but quickly earns some respect and later they become drinking buddies. May even drink together with Shithri and Minsc.
 * Mazzy - typical Mazzy stuff about her height and dream of becoming a paladin. She would prefer for Shithri to stop being a pirate.
 * Nalia - in SoA, Nalia treats Shithri as a result of opressive class system etc, much to Shithri's irritation. In ToB though they start to develop friendship.
 * Valygar - irritated by Shithri's signing. Shithri respects him for his military experience.
 * Yoshimo - Shithri doesn't trust him.
 * Dorn - he questions Shithri's will to take what she wants. They argue once and have a few sparrings. Not very close, but on good terms.
 * Neera - develops a (romantic? not-really? not-sure?) relationship with Shithri, spanning through both SoA and ToB, affecting the Tree of Life talk as well as both Shithri's and Neera's epilogues.
 * Hexxat - Shithri is highly interested in Chult, but Hexxat, being herself, doesn't really talk about it. In ToB, however, when the party travels away from cities for long periodds of time, Shithri may offer her own blood to ease Hexxat's starving.
 * Rasaad - Shithri offers him a drink but he politely refuses, much to her irritation.
 * Wilson - is "employed" by Shithri to carry around her collection of fine liquors.


## In-Party Romance

Shithri may develop a relationship with Neera, although the exact nature of it is up to the interpretation of the player. At least some romantic flavor is implied multiple times though, so the authors of this mod do not consider it queerbaiting. The fact that the mutual feelings aren't named explicitly is partly due to both Neera and Shithri not being that open about their feelings.

At some point, Neera will ask the PC on his/her opinion on Shithri - whenever the relationship will grow or not depends on the outcome of this dialogue. If the PC is also in a non-comitted relationship with Neera, she struggles to choose which one she likes more. She may end up choosing one over the other or break both relationships.

Note: the romance may influence the Tree of Life talk as well as the epilogues. Shithri and Neera may also turn hostile if the other one is attacked or turns against the party for any other reason.


## SoA Quest

Shithri drinks much, but also knows much about various fine liquors from all around the Faerûn. Prompted by her, you can buy bottled liquors at the taverns and inns you visit, growing your collection. There are tons of lore-heavy descriptions of flavors, smells, colors, styles, places etc. Most of them are based on canon material, some are extrapolated based on vague description and knowledge of other alcoholic beverages in both Forgotten Realms and our worlds.

After you make a big enough of a collection, an old sailor will come to confront Shithri about her dealing with land-lubbers (i.e. non-sailors) who don't know a thing about fine drinks. You can prove him wrong in a drink tasting competition between the two of you.


## Orcish Culture

Banters, interjections and other dialogues elaborate on the culture of orcs of Zenthil Keep. Note that Shithri's mother is mixed race too, being half-[mountain orc](https://forgottenrealms.fandom.com/wiki/Mountain_orc?so=search) and half-[ondonti](https://forgottenrealms.fandom.com/wiki/Ondonti), and Shithri herself was raised to be a soldier (by Zentish law, orcs and half-orcs were breeded specifically to become soldiers), so her perspective may not be typical for orcs in general.


### Language

Shithri only uses a handful of orcish words. All of those are fan content, as the canon material has very few orcish words and phrases, and in a dialect than may be different from the one Zentish orcs likely use.

Here is the list of terms found in the mod:

 * garau - mother
 * gubuk (plural: gubar) - a category of certain humanoids such as humans, elves and halflings (but not dwarves or orcs). Literally: "soft-skinned". Humans often think it simply means "human".
 * pidhaggur - "little tusks", common and a little patronizing term for half-orcs
 * sha'nru - mother's sister, aunt. In orcish culture may be used to describe female healers, but it's a more cultural thing rather than linguistic, as a female healer is considered a sister to any female.
 * shatrag - witch, female mage
 * shikhem - goodbye, farewell
 * pulgor - "priest of nature", druid


### Religion

Large part of the material is canon, so the mod-exclusive parts will be mark with a star (`*`).

There are a few gods mentioned in the dialogues:
 * Luthic, Mother of Caves; Godly-Ma* (pl. bożematka) or simply (Great) Mother - the mother-goddess to all orcs, wife of king-of-gods Gruumsh and mother of skull-crusher Bahgtru, patron of healers, witches, females and fertility. Force of stability and life. Her favoured animals are bears, particularly bear mothers, and - to a lesser extend - boards. *Luthic has many traits of Mother Nature and indeed, Shithri considers some druids to be very close to Luthic priests. *Shithri never sings any sea songs while in forests, as - she claims - she "listens t' Mother's voice". *She is portrayed as a loving mother who forgets her children much of their wrong-doings.
 * Gruumsh, The One-Eyed God, He Who Never Sleeps - the king-of-gods in orcish pantheon, having only one, never-closing eye. Ruler of the storm, aspect of Talos. God of power, rule and destruction, patron of rulers worshipped by most of male orcs. *It is said he wouldn't approve Luthic using contraceptive herbal decoctions.
 * Bahgtru, The Leg Breaker, The Strong - son of Luthic and Gruumsh, god of physical strength and brutality, strong-but-dumb patron of "an average orc", as well as young males. Despite the patriarchy of the orcish societies, Bahgtru is known to pay more respect to his mother rather than his father, and when the two fight, he picks Luthic's side.
 * Ilneval, The War Maker (pl. Ojciec Wojny), War Master, Horde Leader - Gruumsh's soldiers' captain, god of strategy and tactics, patron of captains. *He's also a patron to Zenthilar orc and half-orc soldiers and god of military discipline, as opposed to Bahgtru, who is a god of individual strength and battle chaos. *Shithri's uncle, who served in the army, was a worshipper of Ilneval.

*Unlike in human cultures, comparing an orc to various animals is often not an insult, but rather a praise:
 * "bear" suggests lacking malice, being friendly
 * "boar" suggests dilligence
 * "dog" suggests loyality

*Example prayer to Luthic, in Common:

> _Only in caves of stone, only under clear skies. Only where the river flows. Can a bear raise her cubs._

