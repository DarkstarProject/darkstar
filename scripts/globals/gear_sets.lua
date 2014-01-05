-----------------------------------
-- Author: Linkandentity
-- Gear sets
-- Allows the use of gear sets with modifiers
-----------------------------------
require("scripts/globals/status");
-----------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 			 Id, Name, Head, Body, Hand, Legs, Feet, Main, Sub, Neck, Back, ear1, ear2, ring1, ring2, ranged, ammo, matches required
--------------------------------------------------------------------------------------------------------------------------------------------------------------
GearSets =  {{1, "Usukane",	16092,14554,14969,15633,15719,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5},			--	Usukane's set (5% Haste)
			 {2, "Skadi",	16088,14550,14965,15629,15715,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5}, 		--  Skadi's set (5% critrate is guess) 
			 {3, "Ares",	16084,14546,14961,15625,15711,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5}, 		--	Ares's set (5% DA)
			 {4, "Denali",	16107,14569,14984,15648,15734,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5}, 		--	Denali Jacket Set (Increases Accuracy +20)
			 {5, "Askar",	16106,14568,14983,15647,15733,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5}, 		--	Askar Korazin Set (Max HP Boost %10)	
		     {6, "Pahluwan",16069,14530,14940,15609,15695,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5}, 		-- 	Pahluwan Khazagand Set (8% is guess) 
			 {7, "Morrigan",16100,14562,14977,15641,15727,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5}, 		-- 	Morrigan's Robe Set (+5 Magic. Atk Bonus) 			
			 {8, "Marduk",	16096,14558,14973,15637,15723,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5}, 		--	Marduk's Jubbah Set (5% fastcast) 						
			 {9, "Goliard",	16108,14570,14985,15649,15735,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5},			--  Goliard Saio Set - Total Set Bonus +10% Magic Def. Bonus
			 {10, "Yigit",	16064,14527,14935,15606,15690,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5}, 		--  Yigit Gomlek Set (1mp per tick) Adds "Refresh" effect
			 {11, "Perle",	11503,13759,12745,14210,11413,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5}, 		--  Perle Hauberk Set 5% haste
			 {12, "Aurore",	11504,13760,12746,14257,11414,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5}, 		--  Aurore Doublet Set  store tp +8			
			 {13, "TealSaio",11505,13778,12747,14258,11415,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5}, 		--  Teal Saio Set  fastcast 10%			
			 {14, "Calma",	10890,10462,10512,11980,10610,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5}, 		--  Calma Armor Set haste%6	
			 {15, "Magavan",	10892,10464,10514,11982,10612,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5}, 		--  Magavan Armor Set  magic accuracy +5
			 {16, "Mustela",	10891,10463,10513,11981,10611,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5}, 		--  Mustela Harness Set  crit rate 5%
			 {17, "IronRamH",16146,14588,15009,16315,15755,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},			--  Iron Ram Haubert Set
			 {18, "FourthB", 16147,14589,15010,16316,15756,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2}, 		--  Fourth Division Brune Set
			 {19, "CobraH",  16148,14590,15011,16317,15757,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2}, 		--  Cobra Unit Harness Set
			 {20, "CobraR",  16149,14591,15012,16318,15758,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2}, 		--  Cobra Unit Robe Set
			 {21, "IronRamC",6141,14581,15005,16312,15749,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2}, 			--  Iron Ram Chainmail Set. Double mod here! It is why it has 2 IDs.	
			 {23, "FourthC", 16142,14582,15006,16313,15750,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2}, 		--  Fourth Division Cuirass Set
			 {24, "CobraC",  16143,14583,15007,16314,15751,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2}, 		--  Cobra Unit Coat Set		
			 {25, "Amir",    16062,14525,14933,15604,15688,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2}, 		--  Amir Korazin Set - Double mod here! It is why it has 2 IDs.
			 {27, "Hachiryu",-1,11281,15015,16337,11364,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2}, 			--  Hachiryu Haramaki Set - Store tp
			 {28, "Ravager", 11064,11084,11104,11124,11144,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5},			--  Ravager's Armor +2 Set - Double attack double damage chance			 
			 {29, "Fazheluo",11808,11850,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},					--  Fazheluo Mail Set. Set Bonus: "Double Attack"+5%. Active with any 2 pieces.
			 {29, "Fazheluo",11808,11858,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},					--  Fazheluo Mail Set. Set Bonus: "Double Attack"+5%. Active with any 2 pieces.
			 {29, "Fazheluo",11808,11857,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},					--  Fazheluo Mail Set. Set Bonus: "Double Attack"+5%. Active with any 2 pieces.
			 {29, "Fazheluo",11824,11850,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},					--  Fazheluo Mail Set. Set Bonus: "Double Attack"+5%. Active with any 2 pieces.
			 {29, "Fazheluo",11824,11858,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},					--  Fazheluo Mail Set. Set Bonus: "Double Attack"+5%. Active with any 2 pieces.
			 {29, "Fazheluo",11824,11857,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},					--  Fazheluo Mail Set. Set Bonus: "Double Attack"+5%. Active with any 2 pieces.		 
			 {30, "Cuauhtli",11809,11851,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},					--  Cuauhtli Harness Set. Set Bonus: Haste+8%. Active with any 2 pieces.
			 {30, "Cuauhtli",11809,11859,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},					--  Cuauhtli Harness Set. Set Bonus: Haste+8%. Active with any 2 pieces.
			 {30, "Cuauhtli",11825,11851,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},					--  Cuauhtli Harness Set. Set Bonus: Haste+8%. Active with any 2 pieces.
			 {30, "Cuauhtli",11825,11859,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},					--  Cuauhtli Harness Set. Set Bonus: Haste+8%. Active with any 2 pieces.			 
			 {31, "Hyskos",	11810,11852,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5},					--  Hyskos Robe Set. Set Bonus: Magic Accuracy+5. Active with any 2 pieces.
			 {31, "Hyskos",	11810,11860,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},					--  Hyskos Robe Set. Set Bonus: Magic Accuracy+5. Active with any 2 pieces.
			 {31, "Hyskos",	11826,11852,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},					--  Hyskos Robe Set. Set Bonus: Magic Accuracy+5. Active with any 2 pieces.	 
			 {31, "Hyskos",	11826,11860,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},					--  Hyskos Robe Set. Set Bonus: Magic Accuracy+5. Active with any 2 pieces.
			 {32, "Ogier", 	10876,10450,10500,11969,10600,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},			--  Ogier's Armor Set. Set Bonus: Adds "Refresh" Effect. Provides 1 mp/tick for 2-3 pieces worn, 2 mp/tick for 4-5 pieces worn.
			 {33, "Athos", 	10877,10451,10501,11970,10601,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},			--  Athos's Armor Set. Set Bonus: Increases rate of critical hits. Gives +3% for the first 2 pieces and +1% for every additional piece. 
			 {34, "Rubeus",	10878,10452,10502,11971,10602,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},			--  Rubeus Armor Set. Set Bonus: Enhances "Fast Cast" Effect. 2 or 3 pieces equipped: Fast Cast +4, 4 or 5 pieces equipped: Fast Cast +10 	
			 {35, "Navarch",	11080,11100,11120,11140,11160,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5},			--  Navarch's Attire +2 Set. Set Bonus: Augments "Quick Draw". Quick Draw will occasionally deal triple damage.
			 {36, "Charis",	11082,11102,11122,11142,11162,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},			--  Charis Attire +2 Set. Set Bonus: Augments "Samba". Occasionally doubles damage with Samba up. Adds approximately 1-2% per piece past the first. 		
			 {37, "Iga",		11076,11096,11116,11136,11156,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5},			--	Iga Garb +2 Set. Set Bonus: Augments "Dual Wield". Attacks made while dual wielding occasionally add an extra attack
			 {38, "Sylvan",	11074,11094,11114,11134,11154,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},			--	Sylvan Attire +2 Set. Set Bonus: Augments "Rapid Shot". Rapid Shots occasionally deal double damage.	 
			 {39, "Creed",	11070,11090,11110,11130,11150,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5},			--	Creed Armor +2 Set. Set Bonus: Occasionally absorbs damage taken. Set proc believed to be somewhere around 5%, more testing needed. Verification Needed Absorb rate likely varies with # of set pieces.  
			 {40, "Unkai",	11075,11095,11115,11135,11155,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5},			--	Unkai Domaru +2 Set. Set Bonus: Augments "Zanshin". Zanshin attacks will occasionally deal double damage.
			 {41, "Tantra",	11065,11085,11105,11125,11145,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5},			--	Tantra Attire +2 Set. Set Bonus: Augments "Kick Attacks". Occasionally allows a second Kick Attack during an attack round without the use of Footwork. 	
			 {42, "Raider",	11069,11089,11109,11129,11149,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2},			--	Raider's Attire +2 Set. Set Bonus: Augments "Triple Attack". Occasionally causes the second and third hits of a Triple Attack to deal triple damage.Verification Needed Requires a minimum of two pieces. 
			 {43, "Orison",	11066,11086,11106,11126,11146,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5},			--	Orison Attire +2 Set. Set Bonus: Augments elemental resistance spells. Bar Elemental spells will occasionally nullify damage of the same element.	 
			 {44, "Savant",	11083,11103,11123,11143,11163,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,5},			--	Savant's Attire +2 Set. Set Bonus: Augments Grimoire. Spells that match your current Arts will occasionally cast instantly, without recast. 
			 {45, "Paramount",-1,-1,-1,-1,-1,19112,-1,-1,-1,-1,16005,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,-1,19112,-1,-1,-1,16005,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,16005,-1,-1,19215,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,17962,-1,-1,-1,-1,16005,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,-1,17962,-1,-1,-1,16005,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,18596,-1,-1,-1,-1,16005,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,19271,-1,-1,-1,-1,16005,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,-1,19271,-1,-1,-1,16005,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,17756,-1,-1,-1,-1,16005,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,-1,17756,-1,-1,-1,16005,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,18760,-1,-1,-1,-1,16005,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,19156,-1,-1,-1,-1,16005,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,19112,-1,-1,-1,16005,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,-1,19112,-1,-1,16005,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,-1,-1,-1,-1,16005,-1,-1,-1,19215,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,17962,-1,-1,-1,16005,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,-1,17962,-1,-1,16005,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,18596,-1,-1,-1,16005,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,19271,-1,-1,-1,16005,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,-1,19271,-1,-1,16005,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,17756,-1,-1,-1,16005,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,-1,17756,-1,-1,16005,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,18760,-1,-1,-1,16005,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,19156,-1,-1,-1,16005,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
  			 {45, "Paramount",-1,-1,-1,-1,-1,19112,-1,-1,-1,-1,-1,-1,-1,19215,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)  	
			 {45, "Paramount",-1,-1,-1,-1,-1,19112,17962,-1,-1,-1,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,17962,19112,-1,-1,-1,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,19112,19271,-1,-1,-1,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,19271,19112,-1,-1,-1,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
 			 {45, "Paramount",-1,-1,-1,-1,-1,19112,17756,-1,-1,-1,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
			 {45, "Paramount",-1,-1,-1,-1,-1,17756,19112,-1,-1,-1,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
  			 {45, "Paramount",-1,-1,-1,-1,-1,17962,-1,-1,-1,-1,-1,-1,-1,19215,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
  			 {45, "Paramount",-1,-1,-1,-1,-1,-1,17962,-1,-1,-1,-1,-1,-1,19215,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
  			 {45, "Paramount",-1,-1,-1,-1,-1,18596,-1,-1,-1,-1,-1,-1,-1,19215,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
  			 {45, "Paramount",-1,-1,-1,-1,-1,19271,-1,-1,-1,-1,-1,-1,-1,19215,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
  			 {45, "Paramount",-1,-1,-1,-1,-1,-1,19271,-1,-1,-1,-1,-1,-1,19215,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
  			 {45, "Paramount",-1,-1,-1,-1,-1,17756,-1,-1,-1,-1,-1,-1,-1,19215,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
  			 {45, "Paramount",-1,-1,-1,-1,-1,-1,17756,-1,-1,-1,-1,-1,-1,19215,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
  			 {45, "Paramount",-1,-1,-1,-1,-1,18760,-1,-1,-1,-1,-1,-1,-1,19215,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
  			 {45, "Paramount",-1,-1,-1,-1,-1,19156,-1,-1,-1,-1,-1,-1,-1,19215,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
  			 {45, "Paramount",-1,-1,-1,-1,-1,17962,17756,-1,-1,-1,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
  			 {45, "Paramount",-1,-1,-1,-1,-1,17756,17962,-1,-1,-1,-1,-1,-1,-1,-1,2},					--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon) 
  			 {49, "Supremacy",-1,-1,-1,-1,-1,18761,-1,-1,-1,16004,-1,-1,-1,-1,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
  			 {49, "Supremacy",-1,-1,-1,-1,-1,18597,-1,-1,-1,16004,-1,-1,-1,-1,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
			 {49, "Supremacy",-1,-1,-1,-1,-1,17757,-1,-1,-1,16004,-1,-1,-1,-1,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
  			 {49, "Supremacy",-1,-1,-1,-1,-1,-1,17757,-1,-1,16004,-1,-1,-1,-1,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
  			 {49, "Supremacy",-1,-1,-1,-1,-1,18449,-1,-1,-1,16004,-1,-1,-1,-1,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
  			 {49, "Supremacy",-1,-1,-1,-1,-1,18128,-1,-1,-1,16004,-1,-1,-1,-1,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
  			 {49, "Supremacy",-1,-1,-1,-1,-1,18500,-1,-1,-1,16004,-1,-1,-1,-1,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
  			 {49, "Supremacy",-1,-1,-1,-1,-1,18951,-1,-1,-1,16004,-1,-1,-1,-1,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
  			 {49, "Supremacy",-1,-1,-1,-1,-1,-1,-1,-1,-1,16004,-1,-1,-1,19218,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)	 
  			 {49, "Supremacy",-1,-1,-1,-1,-1,18761,-1,-1,-1,-1,16004,-1,-1,-1,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
  			 {49, "Supremacy",-1,-1,-1,-1,-1,18597,-1,-1,-1,-1,16004,-1,-1,-1,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
			 {49, "Supremacy",-1,-1,-1,-1,-1,17757,-1,-1,-1,-1,16004,-1,-1,-1,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
  			 {49, "Supremacy",-1,-1,-1,-1,-1,-1,17757,-1,-1,-1,16004,-1,-1,-1,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
  			 {49, "Supremacy",-1,-1,-1,-1,-1,18449,-1,-1,-1,-1,16004,-1,-1,-1,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
  			 {49, "Supremacy",-1,-1,-1,-1,-1,18128,-1,-1,-1,-1,16004,-1,-1,-1,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
  			 {49, "Supremacy",-1,-1,-1,-1,-1,18500,-1,-1,-1,-1,16004,-1,-1,-1,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
  			 {49, "Supremacy",-1,-1,-1,-1,-1,18951,-1,-1,-1,-1,16004,-1,-1,-1,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
  			 {49, "Supremacy",-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,16004,-1,-1,19218,-1,2},					--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)		 
  			 {53, "Brilliant",-1,-1,-1,-1,-1,18499,-1,-1,-1,-1,16006,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,18499,-1,-1,-1,16006,-1,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)				 
  			 {53, "Brilliant",-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,16006,-1,-1,19217,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,-1,-1,-1,-1,16006,-1,-1,-1,19217,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)				 			 
  			 {53, "Brilliant",-1,-1,-1,-1,-1,18862,-1,-1,-1,-1,16006,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,18862,-1,-1,-1,16006,-1,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,-1,18862,-1,-1,-1,16006,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,-1,18862,-1,-1,16006,-1,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)						
  			 {53, "Brilliant",-1,-1,-1,-1,-1,18952,-1,-1,-1,-1,16006,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,18952,-1,-1,-1,16006,-1,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)		
  			 {53, "Brilliant",-1,-1,-1,-1,-1,18861,-1,-1,-1,-1,16006,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,18861,-1,-1,-1,16006,-1,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,-1,18861,-1,-1,-1,16006,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,-1,18861,-1,-1,16006,-1,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,18450,-1,-1,-1,-1,16006,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,18450,-1,-1,-1,16006,-1,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)				  			 
  			 {53, "Brilliant",-1,-1,-1,-1,-1,19111,-1,-1,-1,-1,16006,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,19111,-1,-1,-1,16006,-1,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,-1,19111,-1,-1,-1,16006,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,-1,19111,-1,-1,16006,-1,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,19272,-1,-1,-1,-1,16006,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,19272,-1,-1,-1,16006,-1,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,-1,19272,-1,-1,-1,16006,-1,-1,-1,-1,2},					--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)	
  			 {53, "Brilliant",-1,-1,-1,-1,-1,-1,19272,-1,-1,16006,-1,-1,-1,-1,-1,2}};				--  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)				 
			 -- Link: Next id must be 56.
			 
-- 			 Head, Body, Hand, Legs, Feet, Main, Sub, Neck, Back, ear1, ear2, ring1, ring2, ranged, ammo, matches-required	
	

	
-------------------------------------------
-- Checks for gear sets present on a player
-------------------------------------------
function checkForGearSet(player)

	-- print("---Removed exsisting gear set mods!---\n");	
	player:clearGearSetMods();
	
	local head = player:getEquipID(SLOT_HEAD);
	local body = player:getEquipID(SLOT_BODY);
	local hands = player:getEquipID(SLOT_HANDS);
	local legs = player:getEquipID(SLOT_LEGS);	
	local feet = player:getEquipID(SLOT_FEET);	
	local main = player:getEquipID(SLOT_MAIN);
	local sub = player:getEquipID(SLOT_SUB);	
	local neck = player:getEquipID(SLOT_NECK);
	local back = player:getEquipID(SLOT_BACK);	
	local ear1 = player:getEquipID(SLOT_EAR1);
	local ear2 = player:getEquipID(SLOT_EAR2);
	local ring1 = player:getEquipID(SLOT_RING1);	
	local ring2 = player:getEquipID(SLOT_RING2);
	local ranged = player:getEquipID(SLOT_RANGED);
	local ammo = player:getEquipID(SLOT_AMMO);	
	
    for index, gearset in pairs(GearSets) do
		local matches = 0;
		if (player:hasGearSetMod(gearset[1]) == false) then
			if (head == gearset[3]) then matches = matches + 1; end;
			if (body == gearset[4]) then matches = matches + 1; end;
			if (hands == gearset[5]) then matches = matches + 1; end;
			if (legs == gearset[6]) then matches = matches + 1; end;
			if (feet == gearset[7]) then matches = matches + 1; end;
			if (main == gearset[8]) then matches = matches + 1; end;
			if (sub == gearset[9]) then matches = matches + 1; end;
			if (neck == gearset[10]) then matches = matches + 1; end;
			if (back == gearset[11]) then matches = matches + 1; end;
			if (ear1 == gearset[12]) then matches = matches + 1; end;
			if (ear2 == gearset[13]) then matches = matches + 1; end;
			if (ring1 == gearset[14]) then matches = matches + 1; end;
			if (ring2 == gearset[15]) then matches = matches + 1; end;		
			if (ranged == gearset[16]) then matches = matches + 1; end;
			if (ammo == gearset[17]) then matches = matches + 1; end;		
			if (matches >= gearset[18]) then
				SearchMods(player, gearset[1], gearset[2], matches);
			end		
		end
	end
end;

---------------------------------------
-- Applys a gear set mod
---------------------------------------
function ApplyMod(player, modNameId, modId, modValue)

	player:addGearSetMod(modNameId, modId, modValue);
	-- print("Gear set! Mod applied: ModNameId:" .. modNameId .. " ModId:" .. modId .. " Value:" .. modValue .. "\n");
end;

---------------------------------------
-- Searchs for a gear set mod
---------------------------------------
function SearchMods(player, modNameId, name, matches)

	local extraDamageChance = 35;
	local extraAttackChance = 25;
	local nullDamageChance = 15;
	local instantCastChance = 15;
	
	if (name == "Ares" and matches == 5) then 		ApplyMod(player, modNameId, MOD_DOUBLE_ATTACK, 5); return; end
	if (name == "Skadi" and matches == 5) then 		ApplyMod(player, modNameId, MOD_CRITHITRATE, 5); return; end	
	if (name == "Usukane" and matches == 5) then 	ApplyMod(player, modNameId, MOD_HASTE_GEAR, 50); return; end		
	if (name == "Denali" and matches == 5) then		ApplyMod(player, modNameId, MOD_ACC, 20); return; end		
	if (name == "Askar" and matches == 5) then 		ApplyMod(player, modNameId, MOD_HPP, 10); return; end	
	if (name == "Pahluwan" and matches == 5) then 	ApplyMod(player, modNameId, MOD_SUBTLE_BLOW, 8); return; end	
	if (name == "Morrigan" and matches == 5) then 	ApplyMod(player, modNameId, MOD_MATT, 5); return; end		
	if (name == "Marduk" and matches == 5) then 	ApplyMod(player, modNameId, MOD_FASTCAST, 5); return; end		
	if (name == "Goliard" and matches == 5) then 	ApplyMod(player, modNameId, MOD_MDEF, 10); return; end		
	if (name == "Yigit" and matches == 5) then 		ApplyMod(player, modNameId, MOD_REFRESH, 1); return; end							
	if (name == "Perle" and matches == 5) then 		ApplyMod(player, modNameId, MOD_HASTE_GEAR, 50); return; end			
	if (name == "Aurore" and matches == 5) then 	ApplyMod(player, modNameId, MOD_STORETP, 8); return; end		
	if (name == "TealSaio" and matches == 5) then 	ApplyMod(player, modNameId, MOD_FASTCAST, 10); return; end		
	if (name == "Calma" and matches == 5) then 		ApplyMod(player, modNameId, MOD_HASTE_GEAR, 61); return; end		
	if (name == "Magavan" and matches == 5) then 	ApplyMod(player, modNameId, MOD_MACC, 5); return; end	
	if (name == "Mustela" and matches == 5) then 	ApplyMod(player, modNameId, MOD_CRITHITRATE, 5); return; end	
	if (name == "Ravager" and matches == 5) then 	ApplyMod(player, modNameId, MOD_DA_DOUBLE_DAMAGE, 5); return; end
	if (name == "CobraR" and matches > 1) then 		ApplyMod(player, modNameId, MOD_MACC, matches-1); return; end		
	if (name == "CobraH" and matches > 1) then 		ApplyMod(player, modNameId, MOD_COUNTER, matches-1); return; end	
	if (name == "FourthC" and matches > 1) then		ApplyMod(player, modNameId, MOD_HP, matches -1 * 10); return; end 	-- Bonus increases by +10 after the 2nd piece.
	if (name == "CobraC" and matches > 1) then 		ApplyMod(player, modNameId, MOD_MP, matches -1 * 10); return; end 	-- Bonus increases by +10 after the 2nd piece.			
	if (name == "FourthB" and matches > 2) then 	ApplyMod(player, modNameId, MOD_ATT, matches -2 * 5); return; end	-- increases in multiples of 5 after the 2nd piece.	
	if (name == "Fazheluo" and matches > 1) then 	ApplyMod(player, modNameId, MOD_DOUBLE_ATTACK, 5); return; end		-- Fazheluo Mail Set. Set Bonus: "Double Attack"+5%. Active with any 2 pieces.	
	if (name == "Cuauhtli" and matches > 1) then 	ApplyMod(player, modNameId, MOD_HASTE_GEAR, 80); return; end		-- Cuauhtli Harness Set. Set Bonus: Haste+8%. 2 peice set.
	if (name == "Hyskos" and matches > 1) then 		ApplyMod(player, modNameId, MOD_MATT, 5); return; end				-- Hyskos Robe Set. Set Bonus: Magic Accuracy+5. Active with any 2 pieces.		
	if (name == "Savant" and matches > 4) then		ApplyMod(player, modNameId, MOD_GRIMOIRE_INSTANT_CAST, instantCastChance); return; end		--	Savant's Attire +2 Set. Set Bonus: Augments Grimoire. Spells that match your current Arts will occasionally cast instantly, without recast. 				 
	if (name == "Orison" and matches > 4) then		ApplyMod(player, modNameId, MOD_BAR_ELEMENT_NULL_CHANCE, nullDamageChance);	return;	end		--	Orison Attire +2 Set. Set Bonus: Augments elemental resistance spells. Bar Elemental spells will occasionally nullify damage of the same element.		
	if (name == "Raider" and matches > 1) then		ApplyMod(player, modNameId, MOD_TA_TRIPLE_DAMAGE, extraDamageChance);	return;	end			--	Raider's Attire +2 Set. Set Bonus: Augments "Triple Attack". Occasionally causes the second and third hits of a Triple Attack to deal triple damage.Verification Needed Requires a minimum of two pieces. 	 
	if (name == "Tantra" and matches > 4) then		ApplyMod(player, modNameId, MOD_EXTRA_KICK_ATTACK, extraAttackChance); return; end			--	Tantra Attire +2 Set. Set Bonus: Augments "Kick Attacks". Occasionally allows a second Kick Attack during an attack round without the use of Footwork. 	
	if (name == "Unkai" and matches > 4) then		ApplyMod(player, modNameId, MOD_ZANSHIN_DOUBLE_DAMAGE, extraDamageChance); return; end		--	Unkai Domaru +2 Set. Set Bonus: Augments "Zanshin". Zanshin attacks will occasionally deal double damage.			
	if (name == "Sylvan" and matches > 4) then		ApplyMod(player, modNameId, MOD_RAPID_SHOT_DOUBLE_DAMAGE, extraDamageChance); return; end	--	Sylvan Attire +2 Set. Set Bonus: Augments "Rapid Shot". Rapid Shots occasionally deal double damage.
	if (name == "Iga" and matches > 4) then			ApplyMod(player, modNameId, MOD_EXTRA_DUAL_WIELD_ATTACK, extraAttackChance); return; end 	--  Iga Garb +2 Set. Set Bonus: Augments "Dual Wield". Attacks made while dual wielding occasionally add an extra attack
	if (name == "Navarch" and matches > 4) then		ApplyMod(player, modNameId, MOD_QUICK_DRAW_TRIPLE_DAMAGE, extraDamageChance); return; end	--  Navarch's Attire +2 Set. Set Bonus: Augments "Quick Draw". Quick Draw will occasionally deal triple damage.
	if (name == "Creed" and matches > 1) then		ApplyMod(player, modNameId, MOD_ABSORB_DMG_CHANCE, matches); return; end					--	Creed Armor +2 Set. Set Bonus: Occasionally absorbs damage taken. At least 2 peices needed. Each adds 1% (5% total)					
	
	--  Charis Attire +2 Set. Set Bonus: Augments "Samba". Occasionally doubles damage with Samba up. Adds approximately 1-2% per piece past the first. 
	if (name == "Charis" and matches > 1) then
		local chance = matches - 1;
		ApplyMod(player, modNameId, MOD_SAMBA_DOUBLE_DAMAGE, chance * 2); 
		return; 
	end
	
	--	Brilliant Earring Sets. Set Bonus: Evasion +10, HP Recovered whilst healing +10, Enmity -5. Active with any 2 items(Earring+Weapon)	
	if (name == "Brilliant" and matches > 1) then
		ApplyMod(player, modNameId, MOD_EVA, 10);
		ApplyMod(player, modNameId +1, MOD_HPHEAL, 10);
		ApplyMod(player, modNameId +2, MOD_ENMITY, -5);
		return;
	end	 	
	
	--	Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)	
	if (name == "Supremacy" and matches > 1) then
		ApplyMod(player, modNameId, MOD_STR, 6);
		ApplyMod(player, modNameId +1, MOD_ATT, 4);
		ApplyMod(player, modNameId +2, MOD_RATT, 4);
		ApplyMod(player, modNameId +3, MOD_MATT, 2);
		return;
	end	 	
	
	--	Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
	if (name == "Paramount" and matches > 1) then
		ApplyMod(player, modNameId, MOD_HP, 30);
		ApplyMod(player, modNameId +1, MOD_VIT, 6);
		ApplyMod(player, modNameId +2, MOD_ACC, 6);
		ApplyMod(player, modNameId +3, MOD_RACC, 6);
		return;
	end	 
	
	--  Rubeus Armor Set. Set Bonus: Enhances "Fast Cast" Effect. 2 or 3 pieces equipped: Fast Cast +4. 4 or 5 pieces equipped: Fast Cast +10 
	if (name == "Rubeus" and matches > 1) then
		local modValue = 0;
		if (matches > 1 and matches < 4) then modValue = 4;	end -- 2 or 3 peices
		if (matches > 3) then modValue = 10;	end -- 4 or 5 peices	
		ApplyMod(player, modNameId, MOD_FASTCAST, modValue);
		return;		
	end
	
	--  Athos's Armor Set. Set Bonus: Increases rate of critical hits. Gives +3% for the first 2 pieces and +1% for every additional piece. 
	if (name == "Athos" and matches > 1) then
		local modValue = 0;
		if (matches > 1) then modValue = 3;	end -- 2 peices
		if (matches > 2) then modValue = modValue+1; end -- 3 peices
		if (matches > 3) then modValue = modValue+1; end -- 4 peices
		if (matches > 4) then modValue = modValue+1; end -- 5 peices		
		ApplyMod(player, modNameId, MOD_CRITHITRATE, modValue);
		return;	
	end	
					
	--  Ogier's Armor Set. Set Bonus: Adds "Refresh" Effect. Provides 1 mp/tick for 2-3 pieces worn, 2 mp/tick for 4-5 pieces worn.
	if (name == "Ogier" and matches > 1) then
		local modValue = 0;
		if (matches > 1 and matches < 4) then modValue = 1;	end
		if (matches > 3) then modValue = 2; end
		ApplyMod(player, modNameId, MOD_REFRESH, modValue);
		return;
	end
						
	-- Each piece +5 resistance after the first one. Additional +10 for the whole set. Set Bonus: Increases resistance against all elements. (+30 Resist)
	if (name == "IronRamH" and matches > 1) then 
		local modValue = matches -1 * 5;
		if (matches == 5) then 
			modValue = modValue + 10; 
		end
		-- TODO: need the correct mod name for this
		-- ApplyMod(player, modNameId, MOD_ALL_ELEMENTAL_RESISTANCE, modValue);	
		return;
	end		
	
	-- Set Bonus: Increases Attack and Accuracy -- Bonus increases by 1 each after the 2nd piece. -- 2 Pieces: +1 Accuracy / +1 Attack -- 3 Pieces: +2 Accuracy / +2 Attack -- 4 Pieces: +3 Accuracy / +3 Attack -- 5 Pieces: +4 Accuracy / +4 Attack
	if (name == "IronRamC" and matches > 1) then
		ApplyMod(player, modNameId, MOD_ACC, matches-1);
		ApplyMod(player, modNameId +1, MOD_ATT, matches-1);
		return;		
	end			
	
	-- Set Bonus: Reduces magic and breath damage (10%)
	if (name == "Amir" and matches == 5) then
		-- TODO: find correct mod names. mod values are already correct
		-- ApplyMod(player, modNameId, MOD_REDUCE_BREATH_DAMAGE, matches-1);
		-- ApplyMod(player, modNameId+1, MOD_REDUCE MAGIC_DAMAGE, matches-1);
		return;		
	end		
	
	-- Set Bonus: Enhances "Store TP" Effect -- 2 pieces: +5 Store TP -- 3 pieces: +10 Store TP -- 4 pieces: +20 Store TP	
	if (name == "Hachiryu" and matches > 1) then
		local modValue = 0;		
		if (matches == 2) then modValue = 5; end
		if (matches == 3) then modValue = 10; end
		if (matches == 4) then modValue = 20; end				
		ApplyMod(player, modNameId, MOD_STORETP, modValue);
		return;	
	end	
	
end;


--[[ 	Unimplemented sets below

=======
Stronghold NM(WOTG)
=======

-- Molione's Sickle Set
-------------
18947 -- Molione's Sickle
15818 -- Molione's Ring
-- Set Bonus: +5 Accuracy
-- Set Bonus: Enhances "Souleater" Effect

=======
Abyssea (Shinryu)
=======
--Twilight Mail Set
-------------
11798 -- Twilight Helm
11362 -- Twilight Mail
-- Set Bonus: Auto-Reraise

=======
Empyrean +2
=======

--Aoidos' Attire +2 Set
-------------
11073 -- Aoidos' Calot+2
11093 -- Aoidos' Hongreline +2
11113 -- Aoidos' Manchettes +2
11133 -- Aoidos' Rhingrave +2
11153 -- Aoidos' Cothurnes +2
-- Set Bonus: Augments Songs
-- Enhancing songs add an attribute bonus that corresponds to the element of the song (i.e. Thunder-based songs add +DEX). The attribute bonus begins at +1 for 2 pieces, increases by 1 for each additional piece, up to +5 for the whole set. For Dark-based songs, there is a bonus of +10 MP for 2 pieces, and increases by 10 for each additional piece. 

--Ferine' Attire +2 Set
-------------
11072 -- Ferine Cabasset+2
11092 -- Ferine Gausape+2
11112 -- Ferine Manoplas+2
11132 -- Ferine Quijotes+2
11152 -- Ferine Ocreae+2
-- Set Bonus: Attack occ. varies with pet's HP
-- Occasionally increases damage in direct proportion to the percentage of pet's current HP. At 100% HP, damage is doubled when triggered, at 50% HP, damage increases by 50%, and so on. 
-- 5% Proc Rate

--Goetia Attire +2 Set
-------------
11067 -- Goetia Petasos+2
11087 -- Goetia Coat+2
11107 -- Goetia Gloves+2
11127 -- Goetia Chausses+2
11147 -- Goetia Sabots+2
-- Set Bonus: Augments "Conserve MP"
-- Occasionally increases damage of elemental spells when Conserve MP is triggered. Increased amount is proportional to twice the ratio of MP conserved. 

--Mavi Attire +2 Set
-------------
11079 -- Mavi Kavuk+2
11099 -- Mavi Mintan+2
11119 -- Mavi Bazubands+2
11139 -- Mavi Tayt+2
11159 -- Mavi Basmak+2
-- Set Bonus: Occ. augments blue magic spells.
-- no damn clue!


--Bale Armor +2 Set
-------------
11071 -- Bale Burgeonet+2
11091 -- Bale Cuirass+2
11111 -- Bale Gauntlets+2
11131 -- Bale Flanchard+2
11151 -- Bale Sollerets+2
-- Set Bonus: Attack occasionally varies with HP
-- Occasionally increases damage in direct proportion to the percentage of current HP. At 100% HP, damage is doubled when triggered, at 50% HP, damage increases by 50%, and so on. 

--Lancer's Armor +2 Set
-------------
11077 -- Lancer's Mezail+2
11097 -- Lancer's Plackart+2
11117 -- Lancer's Vambrace+2
11137 -- Lancer's Cuissots+2
11157 -- Lancer's Schynbalds+2
-- Set Bonus: Attack occasionally varies with wyvern's HP.
-- Damage increases proportionate to Wyvern's HP, at 100%, damage is doubled. 2+ pieces required, more pieces increase proc rate. Full +2 set is about a 10% proc rate. (Confirmation needed)


--Cirque Attire +2 Set
-------------
11081 -- Cirque Capello+2
11101 -- Cirque Farsetto+2
11121 -- Cirque Gaunti+2
11141 -- Cirque Pantaloni+2
11161 -- Cirque Scarpe+2
-- Set Bonus: Attack occasionally varies with automaton's HP.
-- Occasionally increases damage in direct proportion to the percentage of Automaton's current HP. At 100% HP, damage is doubled when triggered, at 50% HP, damage increases by 50%, and so on. 

--Estoqueur's Attire +2 Set
-------------
11068 -- Estoqueur's Chappel+2
11088 -- Estoqueur's Sayon+2
11108 -- Estoqueur's Gantherots+2
11128 -- Estoqueur's Fuseau+2
11148 -- Estoqueur's Houseaux+2
-- Set Bonus: Augments "Composure"
-- Enhances duration of Enhancing Magic cast on OTHERS while under the effect of Composure by 10% for the first 2 pieces, and 15% for any additional pieces thereafter, up to 35% increase for 4 pieces and 50% for all 5 pieces. The "Increases enhancing magic effect duration" of the Estoqueur's Cape, Estoqueur's Houseaux +1 and Estoqueur's Houseaux +2 is multiplicative to this total. 

--Caller's Attire +2 Set
-------------
11078 -- Caller's Horn+2
11098 -- Caller's Doublet+2
11118 -- Caller's Bracers+2
11138 -- Caller's Spats+2
11158 -- Caller's Pigaches+2
-- Set Bonus: Augments "Blood Boon"
-- Occasionally increases damage of Blood Pacts when Blood Boon is triggered. Increased amount is proportional to the ratio of MP conserved. 

]]--
