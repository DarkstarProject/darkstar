---------------------------------------------------------------------------------------------------
-- func: special.lua
-- auth: Tagban/Ninji
-- desc: Individual shops for players
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};
function onTrigger(player)
    player:PrintToPlayer("Job Shop for BNET.cc Players.", 0xF);
    if(player:getMainJob() == 1) then -- WAR
        local stock =
        {
			-- AF1
			11988,35000, -- Fighter's Torque
			16678,35000, -- Razor Axe
			12511,45000, -- Fighter's Mask
			12638,45000, -- Fighter's Lorica
			13961,45000, -- Fighter's Mufflers
			14214,45000, -- Fighter's Cuisses
			14089,45000, -- Fighter's Calligae
			-- AF+1
			15225,75000, -- Fighter's Mask+1
			14473,75000, -- Fighter's Lorica+1
			14890,75000, -- Fighter's Mufflers+1
			15561,75000, -- Fighter's Cuisses+1
			15352,75000, -- Fighter's Calligae+1
			-- Relic
			15871,85000, -- Warrior's Stone
			15072,125000, -- Warrior's Mask
			15087,125000, -- Warrior's Lorica
			15102,125000, -- Warrior's Mufflers
			15117,125000, -- Warrior's Cuisses
			15132,125000, -- Warrior's Calligae
			-- Relic +1
			15245,185000, -- Warrior's Mask+1
			14500,185000, -- Warrior's Lorica+1
			14909,185000, -- Warrior's Mufflers+1
			15580,185000, -- Warrior's Cuisses+1
			15665,185000, -- Warrior's Calligae+1
			-- Relic +2
			10650,235000, -- Warrior's Mask+2
			10670,235000, -- Warrior's Lorica+2
			10690,235000, -- Warrior's Mufflers+2
			10710,235000, -- Warrior's Cuisses+2
			10730,235000, -- Warrior's Calligae+2
			-- Empyrean
			11591,125000, -- Ravager's Gorget
			19253,125000, -- Ravager's Orb
			11703,125000, -- Ravager's Earring
			12008,185000, -- Ravager's Mask
			12028,185000, -- Ravager's Lorica
			12048,185000, -- Ravager's Mufflers
			12068,185000, -- Ravager's Cuisses
			12088,185000, -- Ravager's Calligae
			-- Empyrean +1
			11164,235000, -- Ravager's Mask+1
			11184,235000, -- Ravager's Lorica+1
			11204,235000, -- Ravager's Mufflers+1
			11224,235000, -- Ravager's Cuisses+1
			11244,235000, -- Ravager's Calligae+1
			-- Empyrean +2
			11064,325000, -- Ravager's Mask+2
			11084,325000, -- Ravager's Lorica+2
			11104,325000, -- Ravager's Mufflers+2
			11124,325000, -- Ravager's Cuisses+2
			11144,325000, -- Ravager's Calligae+2
        }
		showShop(player, STATIC, stock);
    elseif(player:getMainJob() == 2) then -- MNK
        local stock =
        {
			-- AF1
			11989,35000, -- Temple Torque
			17478,35000, -- Beat Cesti
			12512,45000, -- Temple Crown
			12639,45000, -- Temple Cyclas
			13962,45000, -- Temple Gloves
			14215,45000, -- Temple Hose
			14090,45000, -- Temple Gaiters
			-- AF+1
			15226,75000, -- Temple Crown+1
			14474,75000, -- Temple Cyclas+1
			14891,75000, -- Temple Gloves+1
			15562,75000, -- Temple Hose+1
			15353,75000, -- Temple Gaiters+1
			-- Relic
			15478,85000, -- Melee Cape
			15073,125000, -- Melee Crown
			15088,125000, -- Melee Cyclas
			15103,125000, -- Melee Gloves
			15118,125000, -- Melee Hose
			15133,125000, -- Melee Gaiters
			-- Relic +1
			15246,185000, -- Melee Crown+1
			14501,185000, -- Melee Cyclas+1
			14910,185000, -- Melee Gloves+1
			15581,185000, -- Melee Hose+1
			15666,185000, -- Melee Gaiters+1
			-- Relic +2
			10651,235000, -- Melee Crown+2
			10671,235000, -- Melee Cyclas+2
			10691,235000, -- Melee Gloves+2
			10711,235000, -- Melee Hose+2
			10731,235000, -- Melee Gaiters+2
			-- Empyrean
			11592,125000, -- Tantra Necklace
			19254,125000, -- Tantra Tathlum
			11704,125000, -- Tantra Earring
			12009,185000, -- Tantra Crown
			12029,185000, -- Tantra Cyclas
			12049,185000, -- Tantra Gloves
			12069,185000, -- Tantra Hose
			12089,185000, -- Tantra Gaiters
			-- Empyrean +1
			11165,235000, -- Tantra Crown+1
			11185,235000, -- Tantra Cyclas+1
			11205,235000, -- Tantra Gloves+1
			11225,235000, -- Tantra Hose+1
			11245,235000, -- Tantra Gaiters+1
			-- Empyrean +2
			11065,325000, -- Tantra Crown+2
			11085,325000, -- Tantra Cyclas+2
			11105,325000, -- Tantra Gloves+2
			11125,325000, -- Tantra Hose+2
			11145,325000, -- Tantra Gaiters+2
        }
		showShop(player, STATIC, stock);
    elseif(player:getMainJob() == 3) then -- WHM
        local stock =
        {
			-- AF1
			11990,35000, -- Healer's Torque
			17422,35000, -- Blessed Hammer
			13855,45000, -- Healer's Cap
			12640,45000, -- Healer's Briault
			13963,45000, -- Healer's Mitts
			14216,45000, -- Healer's Pantaloons
			14091,45000, -- Healer's Duckbills
			-- AF+1
			15227,75000, -- Healer's Cap+1
			14475,75000, -- Healer's Briault+1
			14892,75000, -- Healer's Mitts+1
			15563,75000, -- Healer's Pantaloons+1
			15354,75000, -- Healer's Duckbills+1
			-- Relic
			15872,85000, -- Cleric's Belt
			15074,125000, -- Cleric's Cap
			15089,125000, -- Cleric's Briault
			15104,125000, -- Cleric's Mitts
			15119,125000, -- Cleric's Pantaloons
			15134,125000, -- Cleric's Duckbills
			-- Relic +1
			15247,185000, -- Cleric's Cap+1
			14502,185000, -- Cleric's Briault+1
			14911,185000, -- Cleric's Mitts+1
			15582,185000, -- Cleric's Pantaloons+1
			15667,185000, -- Cleric's Duckbills+1
			-- Relic +2
			10652,235000, -- Cleric's Cap+2
			10672,235000, -- Cleric's Briault+2
			10692,235000, -- Cleric's Mitts+2
			10712,235000, -- Cleric's Pantaloons+2
			10732,235000, -- Cleric's Duckbills+2
			-- Empyrean
			11554,125000, -- Orison Cape
			11615,125000, -- Orison Locket
			11705,125000, -- Orison Earring
			12010,185000, -- Orison Cap
			12030,185000, -- Orison Briault
			12050,185000, -- Orison Mitts
			12070,185000, -- Orison Pantaloons
			12090,185000, -- Orison Duckbills
			-- Empyrean +1
			11166,235000, -- Orison Cap+1
			11186,235000, -- Orison Briault+1
			11206,235000, -- Orison Mitts+1
			11226,235000, -- Orison Pantaloons+1
			11246,235000, -- Orison Duckbills+1
			-- Empyrean +2
			11066,325000, -- Orison Cap+2
			11086,325000, -- Orison Briault+2
			11106,325000, -- Orison Mitts+2
			11126,325000, -- Orison Pantaloons+2
			11146,325000, -- Orison Duckbills+2
        }
		showShop(player, STATIC, stock);
    elseif(player:getMainJob() == 4) then -- BLM
        local stock =
        {
			-- AF1
			11991,35000, -- Wizard's Torque
			17423,35000, -- Casting Wand
			13856,45000, -- Wizard's Petasos
			12641,45000, -- Wizard's Coat
			13964,45000, -- Wizard's Gloves
			14217,45000, -- Wizard's Tonban
			14092,45000, -- Wizard's Sabots
			-- AF+1
			15228,75000, -- Wizard's Petasos+1
			14476,75000, -- Wizard's Coat+1
			14893,75000, -- Wizard's Gloves+1
			15564,75000, -- Wizard's Tonban+1
			15355,75000, -- Wizard's Sabots+1
			-- Relic
			15874,85000, -- Sorcerer's Belt
			15075,125000, -- Sorcerer's Petasos
			15090,125000, -- Sorcerer's Coat
			15105,125000, -- Sorcerer's Gloves
			15120,125000, -- Sorcerer's Tonban
			15135,125000, -- Sorcerer's Sabots
			-- Relic +1
			15248,185000, -- Sorcerer's Petasos+1
			14503,185000, -- Sorcerer's Coat+1
			14912,185000, -- Sorcerer's Gloves+1
			15583,185000, -- Sorcerer's Tonban+1
			15668,185000, -- Sorcerer's Sabots+1
			-- Relic +2
			10653,235000, -- Sorcerer's Petasos+2
			10673,235000, -- Sorcerer's Coat+2
			10693,235000, -- Sorcerer's Gloves+2
			10713,235000, -- Sorcerer's Tonban+2
			10733,235000, -- Sorcerer's Sabots+2
			-- Empyrean
			11593,125000, -- Goetia Chain
			16203,125000, -- Goetia Mantle
			11706,125000, -- Goetia Earring
			12011,185000, -- Goetia Petasos
			12031,185000, -- Goetia Coat
			12051,185000, -- Goetia Gloves
			12071,185000, -- Goetia Tonban
			12091,185000, -- Goetia Sabots
			-- Empyrean +1
			11167,235000, -- Goetia Petasos+1
			11187,235000, -- Goetia Coat+1
			11207,235000, -- Goetia Gloves+1
			11227,235000, -- Goetia Tonban+1
			11247,235000, -- Goetia Sabots+1
			-- Empyrean +2
			11067,325000, -- Goetia Petasos+2
			11087,325000, -- Goetia Coat+2
			11107,325000, -- Goetia Gloves+2
			11127,325000, -- Goetia Tonban+2
			11147,325000, -- Goetia Sabots+2
        }
		showShop(player, STATIC, stock);
	elseif(player:getMainJob() == 5) then -- RDM
        local stock =
        {
			-- AF1
			11992,35000, -- Warlock Torque
			16829,35000, -- Fencing Degen
			12513,45000, -- Warlock Chapeau
			12642,45000, -- Warlock Tabard
			13965,45000, -- Warlock Gloves
			14218,45000, -- Warlock Tights
			14093,45000, -- Warlock Boots
			-- AF+1
			15229,75000, -- Warlock Chapeau+1
			14477,75000, -- Warlock Tabard+1
			14894,75000, -- Warlock Gloves+1
			15565,75000, -- Warlock Tights+1
			15356,75000, -- Warlock Boots+1
			-- Relic
			15873,85000, -- Duelist's Belt
			15076,125000, -- Duelist's Chapeau
			15091,125000, -- Duelist's Tabard
			15106,125000, -- Duelist's Gloves
			15121,125000, -- Duelist's Tights
			15136,125000, -- Duelist's Boots
			-- Relic +1
			15249,185000, -- Duelist's Chapeau+1
			14504,185000, -- Duelist's Tabard+1
			14913,185000, -- Duelist's Gloves+1
			15584,185000, -- Duelist's Tights+1
			15669,185000, -- Duelist's Boots+1
			-- Relic +2
			10654,235000, -- Duelist's Chapeau+2
			10674,235000, -- Duelist's Tabard+2
			10694,235000, -- Duelist's Gloves+2
			10714,235000, -- Duelist's Tights+2
			10734,235000, -- Duelist's Boots+2
			-- Empyrean
			11594,125000, -- Estoqueur's Collar
			16204,125000, -- Estoqueur's Cape
			11707,125000, -- Estoqueur's Earring
			12012,185000, -- Estoqueur's Chappel
			12032,185000, -- Estoqueur's Sayon
			12052,185000, -- Estoqueur's Gantherots
			12072,185000, -- Estoqueur's Fuseau
			12092,185000, -- Estoqueur's Houseaux
			-- Empyrean +1
			11168,235000, -- Estoqueur's Chappel+1
			11188,235000, -- Estoqueur's Sayon+1
			11208,235000, -- Estoqueur's Gantherots+1
			11228,235000, -- Estoqueur's Fuseau+1
			11248,235000, -- Estoqueur's Houseaux+1
			-- Empyrean +2
			11068,325000, -- Estoqueur's Chappel+2
			11088,325000, -- Estoqueur's Sayon+2
			11108,325000, -- Estoqueur's Gantherots+2
			11128,325000, -- Estoqueur's Fuseau+2
			11148,325000, -- Estoqueur's Houseaux+2
        }
		showShop(player, STATIC, stock);
    elseif(player:getMainJob() == 6) then -- THF
        local stock =
        {
			-- AF1
			11993,35000, -- Rogue's Torque
			16764,35000, -- Marauder's Knife
			12514,45000, -- Rogue's Bonnet
			12643,45000, -- Rogue's Vest
			13966,45000, -- Rogue's Armlets
			14219,45000, -- Rogue's Culottes
			14094,45000, -- Rogue's Poulaines
			-- AF+1
			15230,75000, -- Rogue's Bonnet+1
			14478,75000, -- Rogue's Vest+1
			14895,75000, -- Rogue's Armlets+1
			15566,75000, -- Rogue's Culottes+1
			15357,75000, -- Rogue's Poulaines+1
			-- Relic
			15480,85000, -- Assassin's Cape
			15077,125000, -- Assassin's Bonnet
			15092,125000, -- Assassin's Vest
			15107,125000, -- Assassin's Armlets
			15122,125000, -- Assassin's Culottes
			15137,125000, -- Assassin's Poulaines
			-- Relic +1
			15250,185000, -- Assassin's Bonnet+1
			14505,185000, -- Assassin's Vest+1
			14914,185000, -- Assassin's Armlets+1
			15585,185000, -- Assassin's Culottes+1
			15670,185000, -- Assassin's Poulaines+1
			-- Relic +2
			10655,235000, -- Assassin's Bonnet+2
			10675,235000, -- Assassin's Vest+2
			10695,235000, -- Assassin's Armlets+2
			10715,235000, -- Assassin's Culottes+2
			10735,235000, -- Assassin's Poulaines+2
			-- Empyrean
			11736,125000, -- Raider's Belt
			19260,125000, -- Raider's Boomerang
			11708,125000, -- Raider's Earring
			12013,185000, -- Raider's Bonnet
			12033,185000, -- Raider's Vest
			12053,185000, -- Raider's Armlets
			12073,185000, -- Raider's Culottes
			12093,185000, -- Raider's Poulaines
			-- Empyrean +1
			11169,235000, -- Raider's Bonnet+1
			11189,235000, -- Raider's Vest+1
			11209,235000, -- Raider's Armlets+1
			11229,235000, -- Raider's Culottes+1
			11249,235000, -- Raider's Poulaines+1
			-- Empyrean +2
			11069,325000, -- Raider's Bonnet+2
			11089,325000, -- Raider's Vest+2
			11109,325000, -- Raider's Armlets+2
			11129,325000, -- Raider's Culottes+2
			11149,325000, -- Raider's Poulaines+2
        }
		showShop(player, STATIC, stock);
	elseif(player:getMainJob() == 7) then -- PLD
        local stock =
        {
			-- AF1
			11994,35000, -- Gallant Torque
			17643,35000, -- War Hoop
			12515,45000, -- Gallant Coronet
			12644,45000, -- Gallant Surcoat
			13967,45000, -- Gallant Gauntlets
			14220,45000, -- Gallant Breeches
			14095,45000, -- Gallant Leggings
			-- AF+1
			15231,75000, -- Gallant Coronet+1
			14479,75000, -- Gallant Surcoat+1
			14896,75000, -- Gallant Gauntlets+1
			15567,75000, -- Gallant Breeches+1
			15358,75000, -- Gallant Leggings+1
			-- Relic
			15481,85000, -- Valor Cape
			15078,125000, -- Valor Coronet
			15093,125000, -- Valor Surcoat
			15108,125000, -- Valor Gauntlets
			15123,125000, -- Valor Breeches
			15138,125000, -- Valor Leggings
			-- Relic +1
			15251,185000, -- Valor Coronet+1
			14506,185000, -- Valor Surcoat+1
			14915,185000, -- Valor Gauntlets+1
			15586,185000, -- Valor Breeches+1
			15671,185000, -- Valor Leggings+1
			-- Relic +2
			10656,235000, -- Valor Coronet+2
			10676,235000, -- Valor Surcoat+2
			10696,235000, -- Valor Gauntlets+2
			10716,235000, -- Valor Breeches+2
			10736,235000, -- Valor Leggings+2
			-- Empyrean
			11595,125000, -- Creed Collar
			11750,125000, -- Creed Baudrier
			11709,125000, -- Creed Earring
			12014,185000, -- Creed Armet
			12034,185000, -- Creed Cuirass
			12054,185000, -- Creed Gauntlets
			12074,185000, -- Creed Cuisses
			12094,185000, -- Creed Sabatons
			-- Empyrean +1
			11170,235000, -- Creed Armet+1
			11190,235000, -- Creed Cuirass+1
			11210,235000, -- Creed Gauntlets+1
			11230,235000, -- Creed Cuisses+1
			11250,235000, -- Creed Sabatons+1
			-- Empyrean +2
			11070,325000, -- Creed Armet+2
			11090,325000, -- Creed Cuirass+2
			11110,325000, -- Creed Gauntlets+2
			11130,325000, -- Creed Cuisses+2
			11150,325000, -- Creed Sabatons+2
        }
		showShop(player, STATIC, stock);
    elseif(player:getMainJob() == 8) then -- DRK
        local stock =
        {
			-- AF1
			11995,35000, -- Chaos Torque
			16798,35000, -- Raven Scythe
			12516,45000, -- Chaos Burgeonet
			12645,45000, -- Chaos Cuirass
			13968,45000, -- Chaos Gauntlets
			14221,45000, -- Chaos Flanchard
			14096,45000, -- Chaos Sollerets
			-- AF+1
			15232,75000, -- Chaos Burgeonet+1
			14480,75000, -- Chaos Cuirass+1
			14897,75000, -- Chaos Gauntlets+1
			15568,75000, -- Chaos Flanchard+1
			15359,75000, -- Chaos Sollerets+1
			-- Relic
			15479,85000, -- Abyss Cape
			15079,125000, -- Abyss Burgeonet
			15094,125000, -- Abyss Cuirass
			15109,125000, -- Abyss Gauntlets
			15124,125000, -- Abyss Flanchard
			15139,125000, -- Abyss Sollerets
			-- Relic +1
			15252,185000, -- Abyss Burgeonet+1
			14507,185000, -- Abyss Cuirass+1
			14916,185000, -- Abyss Gauntlets+1
			15587,185000, -- Abyss Flanchard+1
			15672,185000, -- Abyss Sollerets+1
			-- Relic +2
			10657,235000, -- Abyss Burgeonet+2
			10677,235000, -- Abyss Cuirass+2
			10697,235000, -- Abyss Gauntlets+2
			10717,235000, -- Abyss Flanchard+2
			10737,235000, -- Abyss Sollerets+2
			-- Empyrean
			11737,125000, -- Bale Belt
			11616,125000, -- Bale Choker
			11710,125000, -- Bale Earring
			12015,185000, -- Bale Burgeonet
			12035,185000, -- Bale Cuirass
			12055,185000, -- Bale Gauntlets
			12075,185000, -- Bale Flanchard
			12095,185000, -- Bale Sollerets
			-- Empyrean +1
			11171,235000, -- Bale Burgeonet+1
			11191,235000, -- Bale Cuirass+1
			11211,235000, -- Bale Gauntlets+1
			11231,235000, -- Bale Flanchard+1
			11251,235000, -- Bale Sollerets+1
			-- Empyrean +2
			11071,325000, -- Bale Burgeonet+2
			11091,325000, -- Bale Cuirass+2
			11111,325000, -- Bale Gauntlets+2
			11131,325000, -- Bale Flanchard+2
			11151,325000, -- Bale Sollerets+2
        }
		showShop(player, STATIC, stock);
	elseif(player:getMainJob() == 9) then -- BST
        local stock =
        {
			-- AF1
			11996,35000, -- Beast Torque
			16680,35000, -- Barbaroi Axe
			12517,45000, -- Beast Helm
			12646,45000, -- Beast Jackcoat
			14958,45000, -- Beast Gloves
			14222,45000, -- Beast Trousers
			14097,45000, -- Beast Gaiters
			-- AF+1
			15233,75000, -- Beast Helm+1
			14481,75000, -- Beast Jackcoat+1
			14898,75000, -- Beast Gloves+1
			15569,75000, -- Beast Trousers+1
			15360,75000, -- Beast Gaiters+1
			-- Relic
			15875,85000, -- Monster Belt
			15080,125000, -- Monster Helm
			15095,125000, -- Monster Jackcoat
			15110,125000, -- Monster Gloves
			15125,125000, -- Monster Trousers
			15140,125000, -- Monster Gaiters
			-- Relic +1
			15253,185000, -- Monster Helm+1
			14508,185000, -- Monster Jackcoat+1
			14917,185000, -- Monster Gloves+1
			15588,185000, -- Monster Trousers+1
			15673,185000, -- Monster Gaiters+1
			-- Relic +2
			10658,235000, -- Monster Helm+2
			10678,235000, -- Monster Jackcoat+2
			10698,235000, -- Monster Gloves+2
			10718,235000, -- Monster Trousers+2
			10738,235000, -- Monster Gaiters+2
			-- Empyrean
			11555,125000, -- Ferine Mantle
			11617,125000, -- Ferine Necklace
			11711,125000, -- Ferine Earring
			12016,185000, -- Ferine Cabasset
			12036,185000, -- Ferine Gausape
			12056,185000, -- Ferine Manoplas
			12076,185000, -- Ferine Quijotes
			12096,185000, -- Ferine Ocreae
			-- Empyrean +1
			11172,235000, -- Ferine Cabasset+1
			11192,235000, -- Ferine Gausape+1
			11212,235000, -- Ferine Manoplas+1
			11232,235000, -- Ferine Quijotes+1
			11252,235000, -- Ferine Ocreae+1
			-- Empyrean +2
			11072,325000, -- Ferine Cabasset+2
			11092,325000, -- Ferine Gausape+2
			11112,325000, -- Ferine Manoplas+2
			11132,325000, -- Ferine Quijotes+2
			11152,325000, -- Ferine Ocreae+2
        }
		showShop(player, STATIC, stock);
    elseif(player:getMainJob() == 10) then -- BRD
        local stock =
        {
			-- AF1
			11997,35000, -- Choral Torque
			16766,35000, -- Paper Knife
			13857,45000, -- Choral Roundlet
			12647,45000, -- Choral Justaucorps
			13970,45000, -- Choral Cuffs
			14223,45000, -- Choral Cannions
			14098,45000, -- Choral Slippers
			-- AF+1
			15234,75000, -- Choral Roundlet+1
			14482,75000, -- Choral Justaucorps+1
			14899,75000, -- Choral Cuffs+1
			15570,75000, -- Choral Cannions+1
			15361,75000, -- Choral Slippers+1
			-- Relic
			15482,85000, -- Bard's Cape
			15081,125000, -- Bard's Roundlet
			15096,125000, -- Bard's Justaucorps
			15111,125000, -- Bard's Cuffs
			15126,125000, -- Bard's Cannions
			15141,125000, -- Bard's Slippers
			-- Relic +1
			15254,185000, -- Bard's Roundlet+1
			14509,185000, -- Bard's Justaucorps+1
			14918,185000, -- Bard's Cuffs+1
			15589,185000, -- Bard's Cannions+1
			15674,185000, -- Bard's Slippers+1
			-- Relic +2
			10659,235000, -- Bard's Roundlet+2
			10679,235000, -- Bard's Justaucorps+2
			10699,235000, -- Bard's Cuffs+2
			10719,235000, -- Bard's Cannions+2
			10739,235000, -- Bard's Slippers+2
			-- Empyrean
			11738,125000, -- Aoidos' Belt
			11618,125000, -- Aoidos' Matinee
			11712,125000, -- Aoidos' Earring
			12017,185000, -- Aoidos' Calot
			12037,185000, -- Aoidos' Hongreline
			12057,185000, -- Aoidos' Manchettes
			12077,185000, -- Aoidos' Rhingrave
			12097,185000, -- Aoidos' Cothurnes
			-- Empyrean +1
			11173,235000, -- Aoidos' Calot+1
			11193,235000, -- Aoidos' Hongreline+1
			11213,235000, -- Aoidos' Manchettes+1
			11233,235000, -- Aoidos' Rhingrave+1
			11253,235000, -- Aoidos' Cothurnes+1
			-- Empyrean +2
			11073,325000, -- Aoidos' Calot+2
			11093,325000, -- Aoidos' Hongreline+2
			11113,325000, -- Aoidos' Manchettes+2
			11133,325000, -- Aoidos' Rhingrave+2
			11153,325000, -- Aoidos' Cothurnes+2
        }
		showShop(player, STATIC, stock);
		elseif(player:getMainJob() == 11) then -- RNG
        local stock =
        {
			-- AF1
			11998,35000, -- Hunter's Torque
			17188,35000, -- Sniping Bow
			12518,45000, -- Hunter's Beret
			12648,45000, -- Hunter's Jerkin
			13971,45000, -- Hunter's Bracers
			14224,45000, -- Hunter's Braccae
			14099,45000, -- Hunter's Socks
			-- AF+1
			15235,75000, -- Hunter's Beret+1
			14483,75000, -- Hunter's Jerkin+1
			14900,75000, -- Hunter's Bracers+1
			15571,75000, -- Hunter's Braccae+1
			15362,75000, -- Hunter's Socks+1
			-- Relic
			15876,85000, -- Scout's Belt
			15082,125000, -- Scout's Beret
			15097,125000, -- Scout's Jerkin
			15112,125000, -- Scout's Bracers
			15127,125000, -- Scout's Braccae
			15142,125000, -- Scout's Socks
			-- Relic +1
			15255,185000, -- Scout's Beret+1
			14510,185000, -- Scout's Jerkin+1
			14919,185000, -- Scout's Bracers+1
			15590,185000, -- Scout's Braccae+1
			15675,185000, -- Scout's Socks+1
			-- Relic +2
			10660,235000, -- Scout's Beret+2
			10680,235000, -- Scout's Jerkin+2
			10700,235000, -- Scout's Bracers+2
			10720,235000, -- Scout's Braccae+2
			10740,235000, -- Scout's Socks+2
			-- Empyrean
			11596,125000, -- Sylvan Scarf
			16205,125000, -- Sylvan Chlamys
			11713,125000, -- Sylvan Earring
			12018,185000, -- Sylvan Gapette
			12038,185000, -- Sylvan Caban
			12058,185000, -- Sylvan Glovelettes
			12078,185000, -- Sylvan Bragues
			12098,185000, -- Sylvan Bottillons
			-- Empyrean +1
			11174,235000, -- Sylvan Gapette+1
			11194,235000, -- Sylvan Caban+1
			11214,235000, -- Sylvan Glovelettes+1
			11234,235000, -- Sylvan Bragues+1
			11254,235000, -- Sylvan Bottillons+1
			-- Empyrean +2
			11074,325000, -- Sylvan Gapette+2
			11094,325000, -- Sylvan Caban+2
			11114,325000, -- Sylvan Glovelettes+2
			11134,325000, -- Sylvan Bragues+2
			11154,325000, -- Sylvan Bottillons+2
        }
		showShop(player, STATIC, stock);
	elseif(player:getMainJob() == 12) then -- SAM
        local stock =
        {
			11999,35000, -- Myochin Torque
			17812,35000, -- Magoroku
			13868,45000, -- Myochin Kabuto
			13781,45000, -- Myochin Domaru
			13972,45000, -- Myochin Kote
			14225,45000, -- Myochin Haidate
			14100,45000, -- Myochin Sune-Ate
			-- AF+1
			15236,75000, -- Myochin Kabuto+1
			14484,75000, -- Myochin Domaru+1
			14901,75000, -- Myochin Kote+1
			15572,75000, -- Myochin Haidate+1
			15363,75000, -- Myochin Sune-Ate+1
			-- Relic
			15879,85000, -- Saotome Koshi-Ate
			15083,125000, -- Saotome Kabuto
			15098,125000, -- Saotome Domaru
			15113,125000, -- Saotome Kote
			15128,125000, -- Saotome Haidate
			15143,125000, -- Saotome Sune-Ate
			-- Relic +1
			15256,185000, -- Saotome Kabuto+1
			14511,185000, -- Saotome Domaru+1
			14920,185000, -- Saotome Kote+1
			15591,185000, -- Saotome Haidate+1
			15676,185000, -- Saotome Sune-Ate+1
			-- Relic +2
			10661,235000, -- Saotome Kabuto+2
			10681,235000, -- Saotome Domaru+2
			10701,235000, -- Saotome Kote+2
			10721,235000, -- Saotome Haidate+2
			10741,235000, -- Saotome Sune-Ate+2
			-- Empyrean
			11597,125000, -- Unkai Nodowa
			16206,125000, -- Unkai Sugemino
			11714,125000, -- Unkai Mimikazari
			12019,185000, -- Unkai Kabuto
			12039,185000, -- Unkai Domaru
			12059,185000, -- Unkai Kote
			12079,185000, -- Unkai Haidate
			12099,185000, -- Unkai Sune-Ate
			-- Empyrean +1
			11175,235000, -- Unkai Kabuto+1
			11195,235000, -- Unkai Domaru+1
			11215,235000, -- Unkai Kote+1
			11235,235000, -- Unkai Haidate+1
			11255,235000, -- Unkai Sune-Ate+1
			-- Empyrean +2
			11075,325000, -- Unkai Kabuto+2
			11095,325000, -- Unkai Domaru+2
			11115,325000, -- Unkai Kote+2
			11135,325000, -- Unkai Haidate+2
			11155,325000, -- Unkai Sune-Ate+2
        }
		showShop(player, STATIC, stock);
    elseif(player:getMainJob() == 13) then -- NIN
        local stock =
        {
			-- AF1
			12000,35000, -- Ninja Shusa
			17771,35000, -- Anju
			17772,35000, -- Zushio
			13869,45000, -- Ninja Hatsuburi
			13782,45000, -- Ninja Chainmail
			13973,45000, -- Ninja Tekko
			14226,45000, -- Ninja Hakama
			14101,45000, -- Ninja Kyahan
			-- AF+1
			15237,75000, -- Ninja Hatsuburi+1
			14485,75000, -- Ninja Chainmail+1
			14902,75000, -- Ninja Tekko+1
			15573,75000, -- Ninja Hakama+1
			15364,75000, -- Ninja Kyahan+1
			-- Relic
			15877,85000, -- Koga Sarashi
			15084,125000, -- Koga Hatsuburi
			15099,125000, -- Koga Chainmail
			15114,125000, -- Koga Tekko
			15129,125000, -- Koga Hakama
			15144,125000, -- Koga Kyahan
			-- Relic +1
			15257,185000, -- Koga Hatsuburi+1
			14512,185000, -- Koga Chainmail+1
			14921,185000, -- Koga Tekko+1
			15592,185000, -- Koga Hakama+1
			15677,185000, -- Koga Kyahan+1
			-- Relic +2
			10662,235000, -- Koga Hatsuburi+2
			10682,235000, -- Koga Chainmail+2
			10702,235000, -- Koga Tekko+2
			10722,235000, -- Koga Hakama+2
			10742,235000, -- Koga Kyahan+2
			-- Empyrean
			11598,125000, -- Iga Erimaki
			16207,125000, -- Iga Dochugappa
			11715,125000, -- Iga Mimikazari
			12020,185000, -- Iga Zukin
			12040,185000, -- Iga Chainmail
			12060,185000, -- Iga Tekko
			12080,185000, -- Iga Hakama
			12100,185000, -- Iga Kyahan
			-- Empyrean +1
			11176,235000, -- Iga Zukin+1
			11196,235000, -- Iga Chainmail+1
			11216,235000, -- Iga Tekko+1
			11236,235000, -- Iga Hakama+1
			11256,235000, -- Iga Kyahan+1
			-- Empyrean +2
			11076,325000, -- Iga Zukin+2
			11096,325000, -- Iga Chainmail+2
			11116,325000, -- Iga Tekko+2
			11136,325000, -- Iga Hakama+2
			11156,325000, -- Iga Kyahan+2
        }
		showShop(player, STATIC, stock);
	elseif(player:getMainJob() == 14) then -- DRG
        local stock =
        {
			-- AF1
			12001,35000, -- Drachen Torque
			16887,35000, -- Peregrine
			12519,45000, -- Drachen Armet
			12649,45000, -- Drachen Mail
			13974,45000, -- Drachen Finger Gauntlets
			14227,45000, -- Drachen Brais
			14102,45000, -- Drachen Greaves
			-- AF+1
			15238,75000, -- Drachen Armet+1
			14486,75000, -- Drachen Mail+1
			14903,75000, -- Drachen Finger Gauntlets+1
			15574,75000, -- Drachen Brais+1
			15365,75000, -- Drachen Greaves+1
			-- Relic
			15878,85000, -- Wyrm Belt
			15085,125000, -- Wyrm Armet
			15100,125000, -- Wyrm Mail
			15115,125000, -- Wyrm Finger Gauntlets
			15130,125000, -- Wyrm Brais
			15145,125000, -- Wyrm Greaves
			-- Relic +1
			15258,185000, -- Wyrm Armet+1
			14513,185000, -- Wyrm Mail+1
			14922,185000, -- Wyrm Finger Gauntlets+1
			15593,185000, -- Wyrm Brais+1
			15678,185000, -- Wyrm Greaves+1
			-- Relic +2
			10663,235000, -- Wyrm Armet+2
			10683,235000, -- Wyrm Mail+2
			10703,235000, -- Wyrm Finger Gauntlets+2
			10723,235000, -- Wyrm Brais+2
			10743,235000, -- Wyrm Greaves+2
			-- Empyrean
			11599,125000, -- Lancer's Torque
			16208,125000, -- Lancer's Pelerine
			11716,125000, -- Lancer's Earring
			12021,185000, -- Lancer's Mezail
			12041,185000, -- Lancer's Plackart
			12061,185000, -- Lancer's Vambraces
			12081,185000, -- Lancer's Cuissots
			12101,185000, -- Lancer's Schynbalds
			-- Empyrean +1
			11177,235000, -- Lancer's Mezail+1
			11197,235000, -- Lancer's Plackart+1
			11217,235000, -- Lancer's Vambraces+1
			11237,235000, -- Lancer's Cuissots+1
			11257,235000, -- Lancer's Schynbalds+1
			-- Empyrean +2
			11077,325000, -- Lancer's Mezail+2
			11097,325000, -- Lancer's Plackart+2
			11117,325000, -- Lancer's Vambraces+2
			11137,325000, -- Lancer's Cuissots+2
			11157,325000, -- Lancer's Schynbalds+2
        }
		showShop(player, STATIC, stock);
    elseif(player:getMainJob() == 15) then -- SMN
        local stock =
        {
			-- AF1
			12002,35000, -- Evoker's Torque
			17532,35000, -- Kukulcan's Staff
			12520,45000, -- Evoker's Horn
			12650,45000, -- Evoker's Doublet
			13975,45000, -- Evoker's Bracers
			14228,45000, -- Evoker's Spats
			14103,45000, -- Evoker's Pigaches
			-- AF+1
			15239,75000, -- Evoker's Horn+1
			14487,75000, -- Evoker's Doublet+1
			14904,75000, -- Evoker's Bracers+1
			15575,75000, -- Evoker's Spats+1
			15366,75000, -- Evoker's Pigaches+1
			-- Relic
			15484,85000, -- Summoner's Cape
			15086,125000, -- Summoner's Horn
			15101,125000, -- Summoner's Doublet
			15116,125000, -- Summoner's Bracers
			15131,125000, -- Summoner's Spats
			15146,125000, -- Summoner's Pigaches
			-- Relic +1
			15259,185000, -- Summoner's Horn+1
			14514,185000, -- Summoner's Doublet+1
			14923,185000, -- Summoner's Bracers+1
			15594,185000, -- Summoner's Spats+1
			15679,185000, -- Summoner's Pigaches+1
			-- Relic +2
			10664,235000, -- Summoner's Horn+2
			10684,235000, -- Summoner's Doublet+2
			10704,235000, -- Summoner's Bracers+2
			10724,235000, -- Summoner's Spats+2
			10744,235000, -- Summoner's Pigaches+2
			-- Empyrean
			11739,125000, -- Caller's Sash
			11619,125000, -- Caller's Pendant
			11717,125000, -- Caller's Earring
			12022,185000, -- Caller's Horn
			12042,185000, -- Caller's Doublet
			12062,185000, -- Caller's Bracers
			12082,185000, -- Caller's Spats
			12102,185000, -- Caller's Pigaches
			-- Empyrean +1
			11178,235000, -- Caller's Horn+1
			11198,235000, -- Caller's Doublet+1
			11218,235000, -- Caller's Bracers+1
			11238,235000, -- Caller's Spats+1
			11258,235000, -- Caller's Pigaches+1
			-- Empyrean +2
			11078,325000, -- Caller's Horn+2
			11098,325000, -- Caller's Doublet+2
			11118,325000, -- Caller's Bracers+2
			11138,325000, -- Caller's Spats+2
			11158,325000, -- Caller's Pigaches+2
        }
		showShop(player, STATIC, stock);
	elseif(player:getMainJob() == 16) then -- BLU
        local stock =
        {
			-- AF1
			12003,35000, -- Magus Torque
			17717,35000, -- Immortal's Scimitar
			15265,45000, -- Magus Keffiyeh
			14521,45000, -- Magus Jubbah
			14928,45000, -- Magus Bazubands
			15600,45000, -- Magus Shalwar
			15684,45000, -- Magus Charuqs
			-- AF+1
			11464,75000, -- Magus Keffiyeh+1
			11291,75000, -- Magus Jubbah+1
			15024,75000, -- Magus Bazubands+1
			16345,75000, -- Magus Shalwar+1
			11381,75000, -- Magus Charuqs+1
			-- Relic
			16244,85000, -- Mirage Mantle
			11465,125000, -- Mirage Keffiyeh
			11292,125000, -- Mirage Jubbah
			15025,125000, -- Mirage Bazubands
			16346,125000, -- Mirage Shalwar
			11382,125000, -- Mirage Charuqs
			-- Relic +1
			11466,185000, -- Mirage Keffiyeh+1
			11293,185000, -- Mirage Jubbah+1
			15026,185000, -- Mirage Bazubands+1
			16347,185000, -- Mirage Shalwar+1
			11383,185000, -- Mirage Charuqs+1
			-- Relic +2
			10665,235000, -- Mirage Keffiyeh+2
			10685,235000, -- Mirage Jubbah+2
			10705,235000, -- Mirage Bazubands+2
			10725,235000, -- Mirage Shalwar+2
			10745,235000, -- Mirage Charuqs+2
			-- Empyrean
			11600,125000, -- Mavi Scarf
			19255,125000, -- Mavi Tathlum
			11718,125000, -- Mavi Earring
			12023,185000, -- Mavi Kavuk
			12043,185000, -- Mavi Mintan
			12063,185000, -- Mavi Bazubands
			12083,185000, -- Mavi Tayt
			12103,185000, -- Mavi Basmak
			-- Empyrean +1
			11179,235000, -- Mavi Kavuk+1
			11199,235000, -- Mavi Mintan+1
			11219,235000, -- Mavi Bazubands+1
			11239,235000, -- Mavi Tayt+1
			11259,235000, -- Mavi Basmak+1
			-- Empyrean +2
			11079,325000, -- Mavi Kavuk+2
			11099,325000, -- Mavi Mintan+2
			11119,325000, -- Mavi Bazubands+2
			11139,325000, -- Mavi Tayt+2
			11159,325000, -- Mavi Basmak+2
        }
		showShop(player, STATIC, stock);
    elseif(player:getMainJob() == 17) then -- COR
        local stock =
        {
			-- AF1
			12004,35000, -- Corsair's Torque
			18702,35000, -- Trump Gun
			15266,45000, -- Corsair's Tricorne
			14522,45000, -- Corsair's Frac
			14929,45000, -- Corsair's Gants
			15601,45000, -- Corsair's Culottes
			15685,45000, -- Corsair's Bottes
			-- AF+1
			11467,75000, -- Corsair's Tricorne+1
			11294,75000, -- Corsair's Frac+1
			15027,75000, -- Corsair's Gants+1
			16348,75000, -- Corsair's Culottes+1
			11384,75000, -- Corsair's Bottes+1
			-- Relic
			15920,85000, -- Commodore Belt
			11468,125000, -- Commodore Tricorne
			11295,125000, -- Commodore Frac
			15028,125000, -- Commodore Gants
			16349,125000, -- Commodore Culottes
			11385,125000, -- Commodore Bottes
			-- Relic +1
			11469,185000, -- Commodore Tricorne+1
			11296,185000, -- Commodore Frac+1
			15029,185000, -- Commodore Gants+1
			16350,185000, -- Commodore Culottes+1
			11386,185000, -- Commodore Bottes+1
			-- Relic +2
			10666,235000, -- Commodore Tricorne+2
			10686,235000, -- Commodore Frac+2
			10706,235000, -- Commodore Gants+2
			10726,235000, -- Commodore Culottes+2
			10746,235000, -- Commodore Bottes+2
			-- Empyrean
			11601,125000, -- Navarch's Choker
			16209,125000, -- Navarch's Mantle
			11719,125000, -- Navarch's Earring
			12024,185000, -- Navarch's Tricorne
			12044,185000, -- Navarch's Frac
			12064,185000, -- Navarch's Gants
			12084,185000, -- Navarch's Culottes
			12104,185000, -- Navarch's Bottes
			-- Empyrean +1
			11180,235000, -- Navarch's Tricorne+1
			11200,235000, -- Navarch's Frac+1
			11220,235000, -- Navarch's Gants+1
			11240,235000, -- Navarch's Culottes+1
			11260,235000, -- Navarch's Bottes+1
			-- Empyrean +2
			11080,325000, -- Navarch's Tricorne+2
			11100,325000, -- Navarch's Frac+2
			11120,325000, -- Navarch's Gants+2
			11140,325000, -- Navarch's Culottes+2
			11160,325000, -- Navarch's Bottes+2
        }
		showShop(player, STATIC, stock);
	elseif(player:getMainJob() == 18) then -- PUP
        -- local stock =
        -- {
			-- AF1
		-- 12005,35000, -- Puppetry Torque
		-- 17858,35000, -- Turbo Animator
		-- 15267,45000, -- Puppetry Taj
		-- 14523,45000, -- Puppetry Tobe
		-- 14930,45000, -- Puppetry Dastanas
		-- 15602,45000, -- Puppetry Churidars
		-- 15686,45000, -- Puppetry Babouches
		-- AF+1
		-- 11470,75000, -- Puppetry Taj+1
		-- 11297,75000, -- Puppetry Tobe+1
		-- 15030,75000, -- Puppetry Dastanas+1
		-- 16351,75000, -- Puppetry Churidars+1
		-- 11387,75000, -- Puppetry Babouches+1
		-- Relic
		-- 16245,85000, -- Pantin Cape
		-- 11471,125000, -- Pantin Taj
		-- 11298,125000, -- Pantin Tobe
		-- 15031,125000, -- Pantin Dastanas
		-- 16352,125000, -- Pantin Churidars
		-- 11388,125000, -- Pantin Babouches
		-- Relic +1
		-- 11472,185000, -- Pantin Taj+1
		-- 11299,185000, -- Pantin Tobe+1
		-- 15032,185000, -- Pantin Dastanas+1
		-- 16353,185000, -- Pantin Churidars+1
		-- 11389,185000, -- Pantin Babouches+1
		-- Relic +2
		-- 10667,235000, -- Pantin Taj+2
		-- 10687,235000, -- Pantin Tobe+2
		-- 10707,235000, -- Pantin Dastanas+2
		-- 10727,235000, -- Pantin Churidars+2
		-- 10747,235000, -- Pantin Babouches+2
		-- Empyrean
		-- 11602,125000, -- Cirque Necklace
		-- 11751,125000, -- Cirque Sash
		-- 11720,125000, -- Cirque Earring
		-- 12025,185000, -- Cirque Cappello
		-- 12045,185000, -- Cirque Farsetto
		-- 12065,185000, -- Cirque Guanti
		-- 12085,185000, -- Cirque Pantaloni
		-- 12105,185000, -- Cirque Scarpe
		-- Empyrean +1
		-- 11181,235000, -- Cirque Cappello+1
		-- 11201,235000, -- Cirque Farsetto+1
		-- 11221,235000, -- Cirque Guanti+1
		-- 11241,235000, -- Cirque Pantaloni+1
		-- 11261,235000, -- Cirque Scarpe+1
		-- Empyrean +2
		-- 11081,325000, -- Cirque Cappello+2
		-- 11101,325000, -- Cirque Farsetto+2
		-- 11121,325000, -- Cirque Guanti+2
		-- 11141,325000, -- Cirque Pantaloni+2
		-- 11161,325000, -- Cirque Scarpe+2	
        -- }
		-- showShop(player, STATIC, stock);
	player:PrintToPlayer("PUP is Broken, don't get banned!!!");
    elseif(player:getMainJob() == 19) then -- DNC
        local stock =
        {
			-- AF1 Male
		12006,35000, -- Dancer's Torque
		19203,35000, -- War Hoop
		16138,45000, -- Dancer's Tiara
		14578,45000, -- Dancer's Casaque
		15002,45000, -- Dancer's Bangles
		15659,45000, -- Dancer's Tights
		15746,45000, -- Dancer's Shoes
		-- AF+1 Male
		11475,75000, -- Dancer's Tiara+1
		11302,75000, -- Dancer's Casaque+1
		15035,75000, -- Dancer's Bangles+1
		16357,75000, -- Dancer's Tights+1
		11393,75000, -- Dancer's Shoes+1
		-- AF1 Female
		16139,45000, -- Dancer's Tiara
		14579,45000, -- Dancer's Casaque
		15003,45000, -- Dancer's Bangles
		15660,45000, -- Dancer's Tights
		15747,45000, -- Dancer's Shoes
		-- AF+1 Female
		11476,75000, -- Dancer's Tiara+1
		11303,75000, -- Dancer's Casaque+1
		15036,75000, -- Dancer's Bangles+1
		16358,75000, -- Dancer's Tights+1
		11394,75000, -- Dancer's Shoes+1
		-- Relic
		16248,85000, -- Etoile Cape
		11478,125000, -- Etoile Tiara
		11305,125000, -- Etoile Casaque
		15038,125000, -- Etoile Bangles
		16360,125000, -- Etoile Tights
		11396,125000, -- Etoile Shoes
		-- Relic +1
		11479,185000, -- Etoile Tiara+1
		11306,185000, -- Etoile Casaque+1
		15039,185000, -- Etoile Bangles+1
		16361,185000, -- Etoile Tights+1
		11397,185000, -- Etoile Shoes+1
		-- Relic +2
		10668,235000, -- Etoile Tiara+2
		10688,235000, -- Etoile Casaque+2
		10708,235000, -- Etoile Bangles+2
		10728,235000, -- Etoile Tights+2
		10748,235000, -- Etoile Shoes+2
		-- Empyrean
		11603,125000, -- Charis Necklace
		19256,125000, -- Charis Feather
		11721,125000, -- Charis Earring
		12026,185000, -- Charis Tiara
		12046,185000, -- Charis Casaque
		12066,185000, -- Charis Bangles
		12086,185000, -- Charis Tights
		12106,185000, -- Charis Shoes
		-- Empyrean +1
		11182,235000, -- Charis Tiara+1
		11202,235000, -- Charis Casaque+1
		11222,235000, -- Charis Bangles+1
		11242,235000, -- Charis Tights+1
		11262,235000, -- Charis Shoes+1
		-- Empyrean +2
		11082,325000, -- Charis Tiara+2
		11102,325000, -- Charis Casaque+2
		11122,325000, -- Charis Bangles+2
		11142,325000, -- Charis Tights+2
		11162,325000, -- Charis Shoes+2	
        }
		showShop(player, STATIC, stock);
	elseif(player:getMainJob() == 20) then -- SCH
        local stock =
        {
			-- AF1
		12007,35000, -- Scholar's Torque
		6058,35000, -- Klimaform
		16140,45000, -- Scholar's Mortarboard
		14580,45000, -- Scholar's Gown
		15004,45000, -- Scholar's Bracers
		16311,45000, -- Scholar's Pants
		15748,45000, -- Scholar's Loafers
		-- AF+1
		11477,75000, -- Scholar's Mortarboard+1
		11304,75000, -- Scholar's Gown+1
		15037,75000, -- Scholar's Bracers+1
		16359,75000, -- Scholar's Pants+1
		11395,75000, -- Scholar's Loafers+1
		-- Relic
		15925,85000, -- Argute Belt
		11480,125000, -- Argute Mortarboard
		11307,125000, -- Argute Gown
		15040,125000, -- Argute Bracers
		16362,125000, -- Argute Pants
		11398,125000, -- Argute Loafers
		-- Relic +1
		11481,185000, -- Argute Mortarboard+1
		11308,185000, -- Argute Gown+1
		15041,185000, -- Argute Bracers+1
		16363,185000, -- Argute Pants+1
		11399,185000, -- Argute Loafers+1
		-- Relic +2
		10669,235000, -- Argute Mortarboard+2
		10689,235000, -- Argute Gown+2
		10709,235000, -- Argute Bracers+2
		10729,235000, -- Argute Pants+2
		10749,235000, -- Argute Loafers+2
		-- Empyrean
		19247,125000, -- Savant's Treatise
		11620,125000, -- Savant's Chain
		11722,125000, -- Savant's Earring
		12027,185000, -- Savant's Bonnet
		12047,185000, -- Savant's Gown
		12067,185000, -- Savant's Bracers
		12087,185000, -- Savant's Pants
		12107,185000, -- Savant's Loafers
		-- Empyrean +1
		11183,235000, -- Savant's Bonnet+1
		11203,235000, -- Savant's Gown+1
		11223,235000, -- Savant's Bracers+1
		11243,235000, -- Savant's Pants+1
		11263,235000, -- Savant's Loafers+1
		-- Empyrean +2
		11083,325000, -- Savant's Bonnet+2
		11103,325000, -- Savant's Gown+2
		11123,325000, -- Savant's Bracers+2
		11143,325000, -- Savant's Pants+2
		11163,325000, -- Savant's Loafers+2	
        }
		showShop(player, STATIC, stock);
    elseif(player:getMainJob() == 21) then -- GEO
        player:PrintToPlayer("GEO is Broken, don't get banned!!!");
    elseif(player:getMainJob() == 22) then -- RUN
        player:PrintToPlayer("RUN is Broken, don't get banned!!!");		
    end
end