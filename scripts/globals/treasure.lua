-------------------------------------------------
--	Treasure functions
--  Info from: 
--      http://wiki.ffxiclopedia.org/wiki/Picking_your_Coffers_and_Chests 
--      http://ffxi.allakhazam.com/db/jobs.html?fjob=10&mid=1086187627165365190&num=150
-------------------------------------------------

require("scripts/globals/settings");


-------------------------------------------------
-- THF tools/keys & their chance increment
-------------------------------------------------

skeletonKey = 0x45B; -- 1115
  livingKey = 0x3FF; -- 1023
   thftools = 0x3FE; -- 1022

   SK_SUCCESS_INCREMENT = 0.2
   LK_SUCCESS_INCREMENT = 0.15
  TTK_SUCCESS_INCREMENT = 0.1

---------------------------------------
-- Spawn Mimic
---------------------------------------

function spawnMimic(zone,npc,player)
	-- zone,mobid
	mimic = {147,17379783,
			 153,17404338,
			 151,17396144,
			 161,17436965,
			 197,17584426,
			 160,17432583,
			 195,17576271,
			 200,17596728,
			 205,17617157,
			 174,17490230,
			 150,17391805,
			  12,16826564,
			 208,17629190,
			 130,17309979,
			 176,17498564,
			 159,17428497,
			 169,17469761,
			 177,17502567};
	
	for nb = 1, table.getn(mimic), 2 do
		if (zone == mimic[nb]) then
			SpawnMob(mimic[nb + 1],120):updateEnmity(player);
			setMobPos(mimic[nb + 1],npc:getXPos(),npc:getYPos(),npc:getZPos(),npc:getRotPos());
			break;
		else
			printf("treasure.lua Mimic missing from zone %d", zone);
		end
	end
end;

---------------------------------------
-- Items
---------------------------------------

	BurstScroll = 0x12D4;
  MagesBalladII = 0x1383;
     AdeptsRope = 0x33AE;
ElectrumHairpin = 0x3610;
    PhalanxRing = 0x34CC;
	  GigantAxe = 0x4146;
 TropicalShield = 0x3035;
   ElectrumRing = 0x34CB;
      EmethPick = 0x4122;
	  Falcastra = 0x4183;
	   LifeBelt = 0x33AF;
CougarBaghnakhs = 0x413E;
       PyroRobe = 0x359B;
	    MothAxe = 0x414F;
  ShieldEarring = 0x3435;
    FrostShield = 0x3032;
	ReplicaMaul = 0x4412;
   BattleGloves = 0x31FF;
        HeatRod = 0x42AF;
	  ForceBelt = 0x33A6;
 FlameBoomerang = 0x438B;
  SafeguardRing = 0x394E;
 LightGauntlets = 0x3699;
	 HiReraiser = 0x104D;
PhysicalEarring = 0x3456;
	VileElixir1 = 0x104F;

---------------------------------------
-- Gems
---------------------------------------

      Amber = 0x32E;
   Amethyst = 0x320;
   Ametrine = 0x32B;
 Aquamarine = 0x317;
Chrysoberyl = 0x321;
 ClearTopaz = 0x329;
   Fluorite = 0x32A;
     Garnet = 0x316;
  Goshenite = 0x328;
LapisLazuli = 0x31B;  
  LightOpal = 0x31C;
  Moonstone = 0x322;
       Onyx = 0x31F;
	Painite = 0x31D;
    Peridot = 0x314;
   Sardonyx = 0x327;
     Sphene = 0x32F;
   Sunstone = 0x323;
 Tourmaline = 0x326;
  Turquoise = 0x31E;
     Zircon = 0x325;
	 
-------------------------------------------------
-- AF by Zone
-------------------------------------------------

function getAFbyZone(zone)
	
	-- job#1, quest#1, item#1, job#2, quest#2, item#2, ...
	
	if (zone == 147) then -- Beadeaux
		-- Beast Jackcoat (BST), Gallant Breeches (PLD), Temple Cyclas (MNK)
		return {9,BORGHERTZ_S_WILD_HANDS,12646,
				7,BORGHERTZ_S_STALWART_HANDS,14220,
				2,BORGHERTZ_S_STRIKING_HANDS,12639};
	elseif (zone == 150) then -- Monastic Cavern
		-- Chaos Flanchard (DRK), Hunter's Jerkin (RNG), Wizard's Coat (BLM)
		return { 8,BORGHERTZ_S_SHADOWY_HANDS,14221,
				11,BORGHERTZ_S_CHASING_HANDS,12648,
				 4,BORGHERTZ_S_SORCEROUS_HANDS,12641};
	elseif (zone == 151) then -- Castle Oztroja
		-- Chaos Cuirass(DRK), Choral Cannions (BRD), Rogue's Culottes (THF), Warlock's Tabard (RDM)
		return { 8,BORGHERTZ_S_SHADOWY_HANDS,12645,
				10,BORGHERTZ_S_HARMONIOUS_HANDS,14223,
				 6,BORGHERTZ_S_SNEAKY_HANDS,14219,
				 5,BORGHERTZ_S_VERMILLION_HANDS,12642};
	elseif (zone == 153) then -- The Boyahda Tree
		-- Ninja Hatsuburi (NIN)
		return {13,BORGHERTZ_S_LURKING_HANDS,13869};
	elseif (zone == 159) then -- Temple of Uggalepih
		-- Evoker's Doublet (SMN), Myochin Domaru (SAM)
		return {15,BORGHERTZ_S_CALLING_HANDS,12650,
				12,BORGHERTZ_S_LOYAL_HANDS,13781};
	elseif (zone == 161) then -- Castle Zvahl Baileys
		-- Fighter's Cuisses (WAR), Rogue's Vest (THF)
		return {1,BORGHERTZ_S_WARRING_HANDS,14214,
				6,BORGHERTZ_S_SNEAKY_HANDS,12643};
	elseif (zone == 169) then -- Toraimarai Canal
		-- Evoker's Pigaches (SMN)
		return {15,BORGHERTZ_S_CALLING_HANDS,14103};
	elseif (zone == 176) then -- Sea Serpent Grotto
		-- Ninja Kyahan (NIN)
		return {13,BORGHERTZ_S_LURKING_HANDS,14101};
	elseif (zone == 195) then -- The eldieme Necropolis
		-- Wizard's Tonban (BLM)
		return {4,BORGHERTZ_S_SORCEROUS_HANDS,14217};
	elseif (zone == 197) then -- Crawler's Nest
		-- Choral Roundlet (BRD), Fighter's Mask (WAR), Healer's Pantaloons (WHM), Hunter's Braccae (RNG)
		return {10,BORGHERTZ_S_HARMONIOUS_HANDS,13857,
				 1,BORGHERTZ_S_WARRING_HANDS,12511,
				 3,BORGHERTZ_S_HEALING_HANDS,14216,
				11,BORGHERTZ_S_CHASING_HANDS,14224};
	elseif (zone == 200) then -- Garlaige Citadel
		-- Beast Helm (BST), Gallant Coronet (PLD), Healer's Cap (WHM), Temple Crown (MNK), Warlock's Tights (RDM)
		return {9,BORGHERTZ_S_WILD_HANDS,12517,
				7,BORGHERTZ_S_STALWART_HANDS,12515,
				3,BORGHERTZ_S_HEALING_HANDS,13855,
				2,BORGHERTZ_S_STRIKING_HANDS,12512,
				5,BORGHERTZ_S_VERMILLION_HANDS,14218};
	elseif (zone == 205) then -- Ifrit's Cauldron
		-- Drachen Mail (DRG)
		return {14,BORGHERTZ_S_DRAGON_HANDS,12649};
	elseif (zone == 208) then -- Quicksand Caves
		-- Drachen Greaves (DRG), Myochin Haidate (SAM)
		return {14,BORGHERTZ_S_DRAGON_HANDS,14102,
				12,BORGHERTZ_S_LOYAL_HANDS,14225};
	end
	
end

---------------------------------------
-- Returns the success increment depending on the THF tool used.
---------------------------------------

function thfKeySuccess(trade,playerLVL,treasureLVL)
	 sk = trade:hasItemQty(skeletonKey,1);
	 lk = trade:hasItemQty(livingKey,1);
	ttk = trade:hasItemQty(thftools,1);
	success = 0;
	if ( sk ) then
		success = (playerLVL/treasureLVL) - 0.50 + SK_SUCCESS_INCREMENT;
	elseif ( lk ) then
		success = (playerLVL/treasureLVL) - 0.50 + LK_SUCCESS_INCREMENT;
	elseif ( ttk ) then
		success = (playerLVL/treasureLVL) - 0.50 + TTK_SUCCESS_INCREMENT;
	end
	return success;
end

---------------------------------------
-- Returns true if the key is a THF "key", false in other case.
---------------------------------------

function isTHFKey(trade)
	 sk = trade:hasItemQty(skeletonKey,1);
	 lk = trade:hasItemQty(livingKey,1);
	ttk = trade:hasItemQty(thftools,1);
	if ( sk or lk or ttk ) then
		return true;
	else
		return false;
	end
end

---------------------------------------
-- Chance calculation based on job, key used and lvl of the chest/coffer
---------------------------------------

function openChance(player,npc,trade,TreasureType,treasureLVL,minLVL,questItemNeeded)
	
	success = 0;
	chance_answer = {nil,nil}; -- {success%,messageType}

	weak = player:getStatusEffect(EFFECT_WEAKNESS);
	illu  = player:getVar("["..player:getZoneID().."]".."Treasure_"..TreasureType); 
	
	-- SE impleted this in order to prevent coffer farming. 
	-- Noone in the same area can open more than 1 coffer per hour except for AF, maps or quests items.

	if (weak ~= nil) then -- old code: os.time() <= weak
		chance_answer = {-1,CHEST_WEAK};
	elseif (os.time() < illu and questItemNeeded == 0) then
		UpdateTreasureSpawnPoint(npc:getID());
		if (TreasureType == "Chest") then
			chance_answer = {-2,CHEST_ILLUSION};
		elseif (TreasureType == "Coffer") then
			if (isTHFKey(trade)) then
				chance_answer = {-1,CHEST_ILLUSION}; -- if you used a THF tool you will lose it.
			else
				chance_answer = {-2,CHEST_ILLUSION}; -- if you traded a zone key droped from mobs you will keep the key
			end		
		end
	elseif (not(isTHFKey(trade))) then 									  
		chance_answer = {1,nil}; -- Zone Key is always 100% success
	elseif (player:getMainJob() == 6 and player:getMainLvl() >= minLVL) then -- ifplayer is THF with level higher or equal than minimun lv for coffer/chest
		success = thfKeySuccess(trade,player:getMainLvl(),treasureLVL);
		chance_answer = {success,nil};
	else
		-- Player is not THF (as main job) or doesn't haven enough level to open the coffer
		chance_answer = {-1,CHEST_FAIL};
	end
	
	return chance_answer;
	
end

function chestLoot(zone,npc)
--[[-----------------------------------------------
                       Chest Loot
---------------------------------------------------
---------------------------------------
-- Items
---------------------------------------

    BurstScroll = 0x12D4;
  MagesBalladII = 0x1383;
     AdeptsRope = 0x33AE;
ElectrumHairpin = 0x3610;
    PhalanxRing = 0x34CC;
      GigantAxe = 0x4146;
 TropicalShield = 0x3035;
   ElectrumRing = 0x34CB;
      EmethPick = 0x4122;
      Falcastra = 0x4183;
       LifeBelt = 0x33AF;
CougarBaghnakhs = 0x413E;
       PyroRobe = 0x359B;
        MothAxe = 0x414F;
  ShieldEarring = 0x3435;
    FrostShield = 0x3032;
    ReplicaMaul = 0x4412;
   BattleGloves = 0x31FF;
        HeatRod = 0x42AF;
      ForceBelt = 0x33A6;
 FlameBoomerang = 0x438B;
  SafeguardRing = 0x394E;
 LightGauntlets = 0x3699;
     HiReraiser = 0x104D;
PhysicalEarring = 0x3456;
    VileElixir1 = 0x104F;

---------------------------------------
-- Gems
---------------------------------------

      Amber = 0x32E;
   Amethyst = 0x320;
   Ametrine = 0x32B;
 Aquamarine = 0x317;
Chrysoberyl = 0x321;
 ClearTopaz = 0x329;
   Fluorite = 0x32A;
     Garnet = 0x316;
  Goshenite = 0x328;
    Jadeite = 0x310;
LapisLazuli = 0x31B;  
  LightOpal = 0x31C;
  Moonstone = 0x322;
       Onyx = 0x31F;
    Painite = 0x31D;
    Peridot = 0x314;
   Sardonyx = 0x327;
     Sphene = 0x32F;
   Sunstone = 0x323;
 Tourmaline = 0x326;
  Turquoise = 0x31E;
     Zircon = 0x325;
Description:
	  Gil = Zone, { [1] Drop rate, [2] Minimum gil, [3] Maximum gil }
	Gems = Zone, { [1] Drop rate, [2] gem1,        [3] gem2,       [4] gem3,  ... ,[10] gem10 }
   Items = Zone, { [1] Drop rate, [2] item1,       [3] item2}
   
Date:
Any update should be here with the date which was modified as well as an URL where info was taken.
	* 07/21/2009 
		       URL : http://wiki.ffxiclopedia.org/wiki/Treasure_Chest/Coffer_Guide
    Done : First collection of all the loot and drop rate.
	* 19/06/2013
		      Done : Drop and drop rate by zone
--]]-----------------------------------------------

gil = {147,{0.152,3440,9000},
		   151,{0.440,3200,6320},
		   161,{0.382,5000,13950},
		   162,{0.306,5000,10000},
		   197,{0.394,4702,10000},
		   191,{0.308,450,900},
		   149,{0.429,3060,6320},
		   157,{0.355,2450,7000},
		   158,{0.355,2450,7000},
		   195,{0.421,5100,12450},
		   204,{0.469,4050,7920},
		   141,{0.500,800,2100},
		   200,{0.576,4425,10000},
		   145,{0.448,800,1600},
		   196,{0.302,1980,3600},
		   192,{0.459,450,1034},
		   194,{0.459,450,1034},
		   190,{0.474,390,1300},
		   213,{0.806,3200,11679},
		   198,{0.525,1800,5200},
		    11,{0.731,3200,6400},
		   193,{0.310,1800,3600},
		   143,{0.455,840,1600},
		     9,{0.762,5200,12500},
		    28,{0.929,5100,9900},
		   176,{0.929,3355,8900},
		   142,{0.450,800,235}};
	gems = {147,{0.090,0x32B,0x316,0x31C,0x31E,0x328,0x32F},
			151,{0.080,0x32B,0x316,0x328,0x31C,0x314,0x327,0x32F,0x31E},
			161,{0.008,0x32B,0x316,0x328,0x314,0x31F,0x32F},
			162,{0.204,0x31E,0x316,0x328,0x314,0x32F,0x31C},
			197,{0.162,0x32B,0x316,0x328,0x31C,0x31F,0x314,0x32F,0x31E},
			191,{0.230,0x32E,0x320,0x329,0x31B,0x327,0x326},
			149,{0.107,0x32B,0x316,0x328,0x31C,0x31F,0x314,0x32F,0x31E},
			157,{0.161,0x32E,0x320,0x329,0x31B,0x31C,0x31F,0x326},
			158,{0.161,0x32E,0x320,0x329,0x31B,0x31C,0x31F,0x326},
			195,{0.105,0x32B,0x328,0x31C,0x31F,0x32F,0x316},
			204,{0.091,0x32B,0x316,0x328,0x31C,0x31F,0x314,0x32F,0x31E},
			141,{0.036,0x32E,0x320,0x31B,0x327,0x326},
			200,{0.059,0x32B,0x316,0x328,0x31C,0x31F,0x314,0x32F,0x31E},
			145,{0.069,0x32E,0x320,0x329,0x31B,0x327,0x326},
			196,{0.233,0x326,0x329,0x32E,0x320,0x31C,0x31B,0x31F},
			192,{0.109,0x32E,0x320,0x329,0x31B,0x326},
			194,{0.109,0x32E,0x320,0x329,0x31B,0x326},
			190,{0.093,0x32E,0x320,0x329,0x31B,0x327,0x326},
			213,{0.194,0x32B,0x316,0x328,0x31C,0x31F,0x314,0x32F,0x31E},
			198,{0.060,0x32E,0x320,0x329,0x31B,0x31C,0x31F,0x327,0x326},
			 11,{0.269,0x32B,0x328,0x31C,0x31F,0x314,0x32F,0x31E},
			193,{0.214,0x320,0x329,0x326,0x327,0x31C,0x31B,0x32E,0x31F},
			143,{0.136,0x31B,0x320,0x32E,0x327,0x326,0x329},
			  9,{0.238,0x32B,0x31E,0x32F,0x316,0x31F,0x314,0x328},
			 28,{0.071,0x316,0x31F,0x32F,0x314,0x31C},
			176,{0.071,0x32B,0x328,0x316,0x31C,0x32F,0x314,0x31F,0x31E},
			142,{0.100,0x32E,0x320,0x31B,0x327,0x326}};
	items = {147,{0.758,0x33AE},
			 151,{0.480,0x3610},
			 161,{0.610,0x34CC},
			 162,{0.490,0x34CC},
			 197,{0.444,0x4146},
			 191,{0.462,0x3035},
			 149,{0.464,0x34CB},
			 157,{0.484,0x4122},
			 158,{0.484,0x4122},
			 195,{0.474,0x4183},
			 204,{0.440,0x33AF},
			 141,{0.464,0x413E},
			 200,{0.365,0x359B},
			 145,{0.483,0x3435},
			 196,{0.465,0x3032,0x4412},
			 192,{0.432,0x414F},
			 194,{0.432,0x414F},
			 190,{0.433,0x31FF},
			 213,{},
			 198,{0.415,0x42AF},
			  11,{},
			 193,{0.476,0x33A6},
			 143,{0.409,0x438B},
			   9,{},
			  28,{},
			 176,{},
			 142,{0.450,0x413E}};
	
	-- Loot calculation 
	rand = math.random();
	rand = math.random();
	rand = math.random();
	for u = 1, table.getn(gil), 2 do
		if (gil[u] == zone) then
			if (rand <= gil[u + 1][1]) then
				reward = {"gil",math.random(gil[u + 1][2],gil[u + 1][3])};
			elseif (rand <= (gil[u + 1][1] + gems[u + 1][1])) then
				local num_gems = 0;
				local curr_gem = 2;
				while(gems[u + 1][curr_gem] ~= nil) do
					curr_gem = curr_gem +1;
					num_gems = num_gems + 1;
				end
				rand_gem = math.random(1,num_gems) + 1;
				reward = {"item",gems[u + 1][rand_gem]};
			else
				local num_item = 0;
				local curr_item = 2;
				while(items[u + 1][curr_item] ~= nil) do
					curr_item = curr_item +1;
					 num_item = num_item + 1;
				end
				rand_item = math.random(1,num_item) + 1;
				reward = {"item",items[u + 1][rand_item]};
			end
			break;
		end
	end
	return reward;
end

function cofferLoot(zone,npc)
--[[-----------------------------------------------
                       Chest Loot
---------------------------------------------------
---------------------------------------
-- Items
---------------------------------------

    BurstScroll = 0x12D4;
  MagesBalladII = 0x1383;
     AdeptsRope = 0x33AE;
ElectrumHairpin = 0x3610;
    PhalanxRing = 0x34CC;
      GigantAxe = 0x4146;
 TropicalShield = 0x3035;
   ElectrumRing = 0x34CB;
      EmethPick = 0x4122;
      Falcastra = 0x4183;
       LifeBelt = 0x33AF;
CougarBaghnakhs = 0x413E;
       PyroRobe = 0x359B;
        MothAxe = 0x414F;
   ScreamFungus = 0x115F
  ShieldEarring = 0x3435;
    FrostShield = 0x3032;
    ReplicaMaul = 0x4412;
   BattleGloves = 0x31FF;
        HeatRod = 0x42AF;
      ForceBelt = 0x33A6;
 FlameBoomerang = 0x438B;
  SafeguardRing = 0x394E;
 LightGauntlets = 0x3699;
     HiReraiser = 0x104D;
PhysicalEarring = 0x3456;
    VileElixir1 = 0x104F;

---------------------------------------
-- Gems
---------------------------------------

      Amber = 0x32E;
   Amethyst = 0x320;
   Ametrine = 0x32B;
 Aquamarine = 0x317;
Chrysoberyl = 0x321;
 ClearTopaz = 0x329;
   Fluorite = 0x32A;
     Garnet = 0x316;
  Goshenite = 0x328;
    Jadeite = 0x310;
LapisLazuli = 0x31B;  
  LightOpal = 0x31C;
  Moonstone = 0x322;
       Onyx = 0x31F;
    Painite = 0x31D;
    Peridot = 0x314;
   Sardonyx = 0x327;
     Sphene = 0x32F;
   Sunstone = 0x323;
 Tourmaline = 0x326;
  Turquoise = 0x31E;
     Zircon = 0x325;

Description:
	 Gil = Zone, { [1] Drop rate, [2] Minimum gil, [3] Maximum gil }
	Gems = Zone, { [1] Drop rate, [2] gem1,        [3] gem2,       [4] gem3,  ... ,[10] gem10 }
   Items = Zone, { [1] Drop rate, [2] item1,       [3] item2}
   
Date:
Any update should be here with the date which was modified as well as an URL where info was taken.
	* 07/21/2009 
		       URL : http://wiki.ffxiclopedia.org/wiki/Treasure_Chest/Coffer_Guide
		      Done : First collection of all the loot and drop rate.
	* 19/06/2013
		      Done : Drop and drop rate by zone
--]]-----------------------------------------------
	gil = {147,{0.375,4700,25000},
		   153,{0.793,7110,20520},
		   151,{0.652,7320,18000},
		   161,{0.731,6300,26880},
		   197,{0.387,6040,12100},
		   160,{0.700,8000,16770},
		   195,{0.500,7590,18039},
		   200,{0.750,6668,18700},
		   205,{0.897,7200,21060},
		   174,{0.943,5200,16100},
		   150,{0.818,7320,14400},
		    12,{0.927,9800,19180},
		   208,{0.773,6160,16100},
		   130,{0.821,9576,19460},
		   176,{0.550,6145,19580},
		   159,{0.846,7320,14400},
		   169,{0.900,7440,14280},
		   177,{0.500,9940,18900}};
	gems = {147,{0.240,0x317,0x321,0x322,0x31D,0x314,0x323,0x325,0x32A,0x310},
			153,{0.092,0x317,0x321,0x32A,0x310,0x322,0x323,0x325,0x31D},
			151,{0.044,0x317,0x321,0x32A,0x310,0x322,0x31D,0x323,0x325},
			161,{0.080,0x317,0x321,0x32A,0x310,0x322,0x31D,0x323,0x325},
			197,{0.387,0x317,0x321,0x310,0x31D,0x325,0x323},
			160,{0.300,0x31D,0x325},
			195,{0.250,0x321,0x32A,0x322,0x31D,0x323},
			200,{0.125,0x321,0x310,0x322},
			205,{0.103,0x322,0x31D,0x323,0x321,0x32A,0x317},
			174,{0.057,0x322,0x321,0x31D,0x310,0x323,0x317,0x325,0x32A},
			150,{0.055,0x321,0x32A,0x310,0x322,0x31D,0x323},
			 12,{0.073,0x317,0x31D,0x310,0x323,0x325,0x321,0x322},
			208,{0.227,0x317,0x321,0x32A,0x310,0x31D,0x323},
			130,{0.179,0x317,0x321,0x32A,0x310,0x322,0x31D,0x325,0x323},
			176,{0.450,0x317,0x32A,0x310,0x322,0x323,0x31D,0x321},
			159,{0.154,0x31D,0x321,0x32A,0x322,0x325,0x323},
			169,{0.100,0x317,0x321,0x310,0x322,0x31D,0x323,0x325},
			177,{0.500,0x317,0x325}};
	items = {147,{0.385,0x12D4},
			 153,{0.115,0x115F},
			 151,{0.304,0x394E},
			 161,{0.189,0x1383},
			 197,{0.226,0x104D},
			 160,{},
			 195,{0.250,0x104F},
			 200,{0.125,0x3699},
			 205,{},
			 174,{},
			 150,{0.127,0x3456},
			  12,{},
			 208,{},
			 130,{},
			 176,{},
			 159,{},
			 169,{},
			 177,{}};

	-- Loot calculation 
	rand = math.random();
	rand = math.random();
	rand = math.random();
	
	for u = 1, table.getn(gil), 2 do
		if (gil[u] == zone) then
			if (rand <= gil[u + 1][1]) then
				reward = {"gil",math.random(gil[u + 1][2],gil[u + 1][3])};
			elseif (rand <= (gil[u + 1][1] + gems[u + 1][1])) then
				local num_gems = 0;
				local curr_gem = 2;
				while(gems[u + 1][curr_gem] ~= nil) do
					curr_gem = curr_gem +1;
					num_gems = num_gems + 1;
				end
				rand_gem = math.random(1,num_gems) + 1;
				reward = {"item",gems[u + 1][rand_gem]};
			else
				local num_item = 0;
				local curr_item = 2;
				while(items[u + 1][curr_item] ~= nil) do
					curr_item = curr_item +1;
					 num_item = num_item + 1;
				end
				rand_item = math.random(1,num_item) + 1;
				reward = {"item",items[u + 1][rand_item]};
			end
			break;
		end
	end
	return reward;
end