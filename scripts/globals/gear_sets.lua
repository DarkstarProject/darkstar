-----------------------------------
-- Author: Linkandentity
-- Gear sets
-- Allows the use of gear sets with modifiers
-----------------------------------

require("scripts/globals/status");

-----------------------------------


-- 5 peice sets with 1 mod only
-- The order of id's must be as follows:
-- Head, Body, Hands, Legs, Feet, Mod, Value 

item_set = {16084,{14546,14961,15625,15711,MOD_DOUBLE_ATTACK,5}, 	-- 	Ares's set (5% DA)
			16088,{14550,14965,15629,15715,MOD_CRITHITRATE,5}, 		--  Skadi's set (5% critrate is guess) 
			16092,{14554,14969,15633,15719,MOD_HASTE_GEAR,50},			--	Usukane's set (5% Haste)
			16107,{14569,14984,15648,15734,MOD_ACC,20}, 			--	Denali Jacket Set (Increases Accuracy +20)
			16106,{14568,14983,15647,15733,MOD_HPP,10}, 			--	Askar Korazin Set (Max HP Boost %10)	
			16069,{14530,14940,15609,15695,MOD_SUBTLE_BLOW,8}, 		-- 	Pahluwan Khazagand Set (8% is guess) 
			16100,{14562,14977,15641,15727,MOD_MATT,5}, 			-- 	Morrigan's Robe Set (+5 Magic. Atk Bonus) 			
			16096,{14558,14973,15637,15723,MOD_FASTCAST,5}, 		--	Marduk's Jubbah Set (5% fastcast) 						
			16108,{14570,14985,15649,15735,MOD_MDEF,10},			--  Goliard Saio Set - Total Set Bonus +10% Magic Def. Bonus
			16064,{14527,14935,15606,15690,MOD_REFRESH,1}, 			--  Yigit Gomlek Set (1mp per tick) Adds "Refresh" effect
			11503,{13759,12745,14210,11413,MOD_HASTE_GEAR,50}, 			--  Perle Hauberk Set 5% haste
			11504,{13760,12746,14257,11414,MOD_STORETP,8}, 			--  Aurore Doublet Set  store tp +8			
			11505,{13778,12747,14258,11415,MOD_FASTCAST,10}, 		--  Teal Saio Set  fastcast 10%			
			10890,{10462,10512,11980,10610,MOD_HASTE_GEAR,61}, 			--  Calma Armor Set haste%6	
			10892,{10464,10514,11982,10612,MOD_MACC,5}, 			--  Magavan Armor Set  magic accuracy +5
			10891,{10463,10513,11981,10611,MOD_CRITHITRATE,5}}; 	--  Mustela Harness Set  crit rate 5%

			
		

function checkForGearSet(player)

	local head = player:getEquipID(SLOT_HEAD);
	local body = player:getEquipID(SLOT_BODY);
	local hands = player:getEquipID(SLOT_HANDS);
	local legs = player:getEquipID(SLOT_LEGS);	
	local feet = player:getEquipID(SLOT_FEET);	
	
	playerGetMod = player:getVar("GearSetMod");
	
	if (playerGetMod > 0) then
		removeGearSetMod(player,playerGetMod);
	end
	
	for setIndex = 1, table.getn(item_set), 2 do
		if (head == item_set[setIndex]) then
			if (body == item_set[setIndex+1][1]) then
				if (hands == item_set[setIndex+1][2]) then
					if (legs == item_set[setIndex+1][3]) then
						if (feet == item_set[setIndex+1][4]) then
							player:setVar("GearSetMod",head);
							player:addMod(item_set[setIndex+1][5],item_set[setIndex+1][6]);
							-- print("---Gear set found!---\n"); -- these notes can be removed after all gear sets are complete
							return;
						end					
					end				
				end
			end
		end
	end
end;





function removeGearSetMod(player, itemid)
	
	for setIndex = 1, table.getn(item_set), 2 do
		if (itemid == item_set[setIndex]) then
			player:setVar("GearSetMod",0);
			player:delMod(item_set[setIndex+1][5],item_set[setIndex+1][6]);
			-- print("---Gear set mod removed!---\n"); -- these notes can be removed after all gear sets are complete
			return;
		end
	end
end;





--[[ 	Unimplemented sets below



-- Amir Korazin Set
-------------
16062 -- Amir Puggaree
14525 -- Amir Korazin
14933 -- Amir Kolluks
15604 -- Amir Dirs
15688 -- Amir Boots
-- Set Bonus: Reduces magic and breath damage
-- -8% magic and breath damage unconfirmed. Only active with full set. (!--'-10% would round value out better at 2x5)



=======
Campaign Allied Notes
=======

-- Iron Ram Haubert Set 
-------------
16146 -- Iron Ram Sallet
14588 -- Iron Ram Hauberk
15009 -- Iron Ram Dastanas
16315 -- Iron Ram Hose
15755 -- Iron Ram Greaves
-- Set Bonus: Increases resistance against all elements. (+30 Resist)
-- Each piece +5 resistance after the first one.
-- Additional +10 for the whole set.

-- Fourth Division Brune Set
-------------
16147 -- Fourth Division Haube
14589 -- Fourth Division Brunne
15010 -- Fourth Division Hentzes
16316 -- Fourth Division Schoss
15756 -- Fourth Division Schuhs
-- Set Bonus: Increases Attack
-- Set increases in multiples of 5 after the 2nd piece.
-- 2 pieces: Attack+1
-- 3 pieces: Attack+5
-- 4 Pieces: Attack+10
-- Full Set: Attack+15

-- Cobra Unit Harness Set
-------------
16148 -- Cobra Unit Cap
14590 -- Cobra Unit Harness
15011 -- Cobra Unit Mittens
16317 -- Cobra Unit Subligar
15757 -- Cobra Unit Leggings
-- Set Bonus: Enhances "Counter" effect
-- Counter +1 per piece after the first (+4 Counter)

-- Cobra Unit Robe Set
-------------
16149 -- Cobra Unit Cloche
14591 -- Cobra Unit Robe
15012 -- Cobra Unit Gloves
16318 -- Cobra Unit Trews
15758 -- Cobra Unit Crackows
-- Set Bonus: Increases Magic Accuracy
-- +1 each piece after the first. (+4 Magic Accuracy)

-- Iron Ram Chainmail Set
-------------
16141 -- Iron Ram Helm
14581 -- Iron Ram Chainmail
15005 -- Iron Ram Mufflers
16312 -- Iron Ram Breeches
15749 -- Iron Ram Sollerets
-- Set Bonus: Increases Attack and Accuracy
-- Bonus increases by 1 each after the 2nd piece.
-- 2 Pieces: +1 Accuracy / +1 Attack
-- 3 Pieces: +2 Accuracy / +2 Attack
-- 4 Pieces: +3 Accuracy / +3 Attack
-- 5 Pieces: +4 Accuracy / +4 Attack

-- Fourth Division Cuirass Set
-------------
16142 -- Fourth Division Armet
14582 -- Fourth Division Cuirass
15006 -- Fourth Division Gauntlets
16313 -- Fourth Division Cuisses
15750 -- Fourth Division Sabatons
-- Set Bonus: Increases HP
-- Bonus increases by +10 after the 2nd piece.
-- 2 pieces: +10 HP
-- 3 pieces: +20 HP
-- 4 pieces: +30 HP
-- 5 pieces: +40 HP

-- Cobra Unit Coat Set
-------------
16143 -- Cobra Unit Hat
14583 -- Cobra Unit Coat
15007 -- Cobra Unit Cuffs
16314 -- Cobra Unit Slops
15751 -- Cobra Unit Pigaches
-- Set Bonus: Increases MP
-- Bonus increases by +10 after the 2nd piece.
-- 2 pieces: +10 MP
-- 3 pieces: +20 MP
-- 4 pieces: +30 MP
-- 5 pieces: +40 MP

=======
Stronghold NM(WOTG)
=======

--Paramount Earring Sets
-------------
16005 -- Paramount Earring
19112 -- Farseer
19215 -- Amanokakoyumi
17962 -- Fleetwing
18596 -- Kebbie
19271 -- Osoraku
17756 -- Sinfender
18760 -- Useshi
19156 -- Balisarde
-- Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6
-- Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)

--Supremacy Earring Sets
-------------
16004 -- Supremacy Earring
18761 -- Acantha Shavers
18597 -- Catalyst
17757 -- Merveilleuse
18449 -- Namioyogi
18128 -- Skystrider
18500 -- Sparth
18951 -- Vendetta
19218 -- Murderer
-- Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2
-- Set Bonus is active with any 2 items(Earring+Weapon)

--Brilliant Earring Sets
-------------
16006 -- Brilliant Earring
18499 -- Alastor
19217 -- Basilisk
18862 -- Clearpath
18952 -- Faucheuse
18861 -- Grandeur
18450 -- Mukademaru
19111 -- Silktone
19272 -- Yagentoshiro
-- Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity
-- Set Bonus is active with any 2 items. (Earring+Weapon)
-- bonus values missing on wiki: acceptable filler would be +10 +10 -5 accurate for the other bonuses and level

-- Molione's Sickle Set
-------------
18947 -- Molione's Sickle
15818 -- Molione's Ring
-- Set Bonus: +5 Accuracy
-- Set Bonus: Enhances "Souleater" Effect

=======
ZNM
=======

--Hachiryu Haramaki Set
-------------
-- NO HEADPIECE
11281 -- Hachiryu Haramaki
15015 -- Hachiryu Kote
16337 -- Hachiryu Haidate
11364 -- Hachiryu Sune-Ate
-- Set Bonus: Enhances "Store TP" Effect
-- 2 pieces: +5 Store TP
-- 3 pieces: +10 Store TP
-- 4 pieces: +20 Store TP



--Fazheluo Mail Set
-------------
11808 -- Fazheluo Helm
11824 -- Fazleluo Helm+1
11850 -- Fazheluo Mail
11858 -- Fazheluo Mail+1
11857 -- Fazheluo Radiant Mail
-- Set Bonus: "Double Attack"+5%
-- active with any 2 pieces.

--Cuauhtli Harness Set
-------------
11809 -- Cuauhtli Headpiece
11825 -- Cuauhtli Headpiece+1
11851 -- Cuauhtli Harness
11859 -- Cuauhtli Harness+1
-- Set Bonus: Haste+8%
-- active with any 2 pieces.

--Hyskos Robe Set
-------------
11810 -- Hyksos Khat
11826 -- Hyksos Khat+1
11852 -- Hyksos Robe
11860 -- Hyksos Robe+1
-- Set Bonus: Magic Accuracy+5

=======
Abyssea (Shinryu)
=======
--Twilight Mail Set
-------------
11798 -- Twilight Helm
11362 -- Twilight Mail
-- Set Bonus: Auto-Reraise

=======
Voidwatch
=======

--Ogier's Armor Set
-------------
10876 -- Ogier's Helm
10450 -- Ogier's Surcoat
10500 -- Ogier's Gauntlets
11969 -- Ogier's Breeches
10600 -- Ogier's Leggings
-- Set Bonus: Adds "Refresh" Effect
-- Provides 1 mp/tick for 2-3 pieces worn, 2 mp/tick for 4-5 pieces worn.

--Athos's Armor Set
-------------
10877 -- Athos's Chapeau
10451 -- Athos's Tabard
10501 -- Athos's Gloves
11970 -- Athos's Tights
10601 -- Athos's Boots
-- Set Bonus: Increases rate of critical hits.
-- Gives +3% for the first 2 pieces and +1% for every additional piece. 

--Rubeus Armor Set
-------------
10878 -- Rubeus Bandeau
10452 -- Rubeus Jacket
10502 -- Rubeus Gloves
11971 -- Rubeus Spats
10602 -- Rubeus Boots
-- Set Bonus: Enhances "Fast Cast" Effect
-- 2 or 3 pieces equipped: Fast Cast +4
-- 4 or 5 pieces equipped: Fast Cast +10 




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

--Navarch's Attire +2 Set
-------------
11080 -- Navarch's Tricorne+2
11100 -- Navarch's Frac+2
11120 -- Navarch's Gants+2
11140 -- Navarch's Culottes+2
11160 -- Navarch's Bottes+2
-- Set Bonus: Augments "Quick Draw"
-- Quick Draw will occasionally deal triple damage.

--Charis Attire +2 Set
-------------
11082 -- Charis Tiara+2
11102 -- Charis Casaque+2
11122 -- Charis Bangles+2
11142 -- Charis Tights+2
11162 -- Charis Toeshoes+2
-- Set Bonus: Augments "Samba"
-- Occasionally doubles damage with Samba up. Adds approximately 1-2% per piece past the first. 

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

--Tantra Attire +2 Set
-------------
11065 -- Tantra Crown+2
11085 -- Tantra Cyclas+2
11105 -- Tantra Gloves+2
11125 -- Tantra Hose+2
11145 -- Tantra Gaiters+2
-- Set Bonus: Augments "Kick Attacks"
-- Occasionally allows a second Kick Attack during an attack round without the use of Footwork. 

--Iga Garb +2 Set
-------------
11076 -- Iga Zukin+2
11096 -- Iga Ningi+2
11116 -- Iga Tekko+2
11136 -- Iga Hakama+2
11156 -- Iga Kyahan+2
-- Set Bonus: Augments "Dual Wield"
-- Attacks made while dual wielding occasionally add an extra attack

--Creed Armor +2 Set
-------------
11070 -- Creed Armet+2
11090 -- Creed Cuirass+2
11110 -- Creed Gauntlets+2
11130 -- Creed Cuisses+2
11150 -- Creed Sabatons+2
-- Set Bonus: Occasionally absorbs damage taken.
-- Set proc believed to be somewhere around 5%, more testing needed. Verification Needed Absorb rate likely varies with # of set pieces. 

--Cirque Attire +2 Set
-------------
11081 -- Cirque Capello+2
11101 -- Cirque Farsetto+2
11121 -- Cirque Gaunti+2
11141 -- Cirque Pantaloni+2
11161 -- Cirque Scarpe+2
-- Set Bonus: Attack occasionally varies with automaton's HP.
-- Occasionally increases damage in direct proportion to the percentage of Automaton's current HP. At 100% HP, damage is doubled when triggered, at 50% HP, damage increases by 50%, and so on. 

--Sylvan Attire +2 Set
-------------
11074 -- Sylvan Gapette+2
11094 -- Sylvan Caban+2
11114 -- Sylvan Glovelettes+2
11134 -- Sylvan Bragues+2
11154 -- Sylvan Bottillons+2
-- Set Bonus: Augments "Rapid Shot"
-- Rapid Shots occasionally deal double damage. 

--Estoqueur's Attire +2 Set
-------------
11068 -- Estoqueur's Chappel+2
11088 -- Estoqueur's Sayon+2
11108 -- Estoqueur's Gantherots+2
11128 -- Estoqueur's Fuseau+2
11148 -- Estoqueur's Houseaux+2
-- Set Bonus: Augments "Composure"
-- Enhances duration of Enhancing Magic cast on OTHERS while under the effect of Composure by 10% for the first 2 pieces, and 15% for any additional pieces thereafter, up to 35% increase for 4 pieces and 50% for all 5 pieces. The "Increases enhancing magic effect duration" of the Estoqueur's Cape, Estoqueur's Houseaux +1 and Estoqueur's Houseaux +2 is multiplicative to this total. 

--Unkai Domaru +2 Set
-------------
11075 -- Unkai Kabuto+2
11095 -- Unkai Domaru+2
11115 -- Unkai Kote+2
11135 -- Unkai Haidate+2
11155 -- Unkai Sune-Ate+2
-- Set Bonus: Augments "Zanshin"
-- Zanshin attacks will occasionally deal double damage. 

--Savant's Attire +2 Set
-------------
11083 -- Savant's Bonnet+2
11103 -- Savant's Gown+2
11123 -- Savant's Bracers+2
11143 -- Savant's Pants+2
11163 -- Savant's Loafers+2
-- Set Bonus: Augments Grimoire
-- Spells that match your current Arts will occasionally cast instantly, without recast. 

--Caller's Attire +2 Set
-------------
11078 -- Caller's Horn+2
11098 -- Caller's Doublet+2
11118 -- Caller's Bracers+2
11138 -- Caller's Spats+2
11158 -- Caller's Pigaches+2
-- Set Bonus: Augments "Blood Boon"
-- Occasionally increases damage of Blood Pacts when Blood Boon is triggered. Increased amount is proportional to the ratio of MP conserved. 

--Raider's Attire +2 Set
-------------
11069 -- Raider's Bonnet+2
11089 -- Raider's Vest+2
11109 -- Raider's Armlets+2
11129 -- Raider's Culottes+2
11149 -- Raider's Poulaines+2
-- Set Bonus: Augments "Triple Attack"
-- "Triple Attack" - Occasionally causes the second and third hits of a Triple Attack to deal triple damage.Verification Needed Requires a minimum of two pieces. 

--Ravager's Armor +2 Set
-------------
11064 -- Ravager's Mask+2
11084 -- Ravager's Lorica+2
11104 -- Ravager's Mufflers+2
11124 -- Ravager's Cuisses+2
11144 -- Ravager's Calligae+2
-- Set Bonus: Augments "Double Attack"
-- Causes Double Attacks to occasionally deal double damage. 

--Orison Attire +2 Set
-------------
11066 -- Orison Cap+2
11086 -- Orison Bliaud+2
11106 -- Orison Mitts+2
11126 -- Orison Pantaloons+2
11146 -- Orison Duckbills+2
-- Set Bonus: Augments elemental resistance spells
-- Bar Elemental spells will occasionally nullify damage of the same element.



]]--
