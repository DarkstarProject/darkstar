-------------------------------------------------
--	Author: Almendro, Ezekyel
--	Treasure functions
--  Info from: 
--      http://wiki.ffxiclopedia.org/wiki/Picking_your_Coffers_and_Chests 
--      http://ffxi.allakhazam.com/db/jobs.html?fjob=10&mid=1086187627165365190&num=150
-------------------------------------------------
-- Includes
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
	
	-- nbAF, job#1, quest#1, item#1, job#2, quest#2, item#2, ...
	
	if(zone == 147) then -- Beadeaux
		-- Beast Jackcoat (BST), Gallant Breeches (PLD), Temple Cyclas (MNK)
		return {9,BORGHERTZ_S_WILD_HANDS,12646,
				7,BORGHERTZ_S_STALWART_HANDS,14220,
				2,BORGHERTZ_S_STRIKING_HANDS,12639};
	elseif(zone == 150) then -- Monastic Cavern
		-- Chaos Flanchard (DRK), Hunter's Jerkin (RNG), Wizard's Coat (BLM)
		return { 8,BORGHERTZ_S_SHADOWY_HANDS,14221,
				11,BORGHERTZ_S_CHASING_HANDS,12648,
				 4,BORGHERTZ_S_SORCEROUS_HANDS,12641};
	elseif(zone == 151) then -- Castle Oztroja
		-- Chaos Cuirass(DRK), Choral Cannions (BRD), Rogue's Culottes (THF), Warlock's Tabard (RDM)
		return { 8,BORGHERTZ_S_SHADOWY_HANDS,12645,
				10,BORGHERTZ_S_HARMONIOUS_HANDS,14223,
				 6,BORGHERTZ_S_SNEAKY_HANDS,14219,
				 5,BORGHERTZ_S_VERMILLION_HANDS,12642};
	elseif(zone == 153) then -- The Boyahda Tree
		-- Ninja Hatsuburi (NIN)
		return {13,BORGHERTZ_S_LURKING_HANDS,13869};
	elseif(zone == 159) then -- Temple of Uggalepih
		-- Evoker's Doublet (SMN), Myochin Domaru (SAM)
		return {15,BORGHERTZ_S_CALLING_HANDS,12650,
				12,BORGHERTZ_S_LOYAL_HANDS,13781};
	elseif(zone == 161) then -- Castle Zvahl Baileys
		-- Fighter's Cuisses (WAR), Rogue's Vest (THF)
		return {1,BORGHERTZ_S_WARRING_HANDS,14214,
				6,BORGHERTZ_S_SNEAKY_HANDS,12643};
	elseif(zone == 169) then -- Toraimarai Canal
		-- Evoker's Pigaches (SMN)
		return {15,BORGHERTZ_S_CALLING_HANDS,14103};
	elseif(zone == 176) then -- Sea Serpent Grotto
		-- Ninja Kyahan (NIN)
		return {13,BORGHERTZ_S_LURKING_HANDS,14101};
	elseif(zone == 195) then -- The eldieme Necropolis
		-- Wizard's Tonban (BLM)
		return {4,BORGHERTZ_S_SORCEROUS_HANDS,14217};
	elseif(zone == 197) then -- Crawler's Nest
		-- Choral Roundlet (BRD), Fighter's Mask (WAR), Healer's Pantaloons (WHM), Hunter's Braccae (RNG)
		return {10,BORGHERTZ_S_HARMONIOUS_HANDS,13857,
				 1,BORGHERTZ_S_WARRING_HANDS,12511,
				 3,BORGHERTZ_S_HEALING_HANDS,14216,
				11,BORGHERTZ_S_CHASING_HANDS,14224};
	elseif(zone == 200) then -- Garlaige Citadel
		-- Beast Helm (BST), Gallant Coronet (PLD), Healer's Cap (WHM), Temple Crown (MNK), Warlock's Tights (RDM)
		return {9,BORGHERTZ_S_WILD_HANDS,12517,
				7,BORGHERTZ_S_STALWART_HANDS,12515,
				3,BORGHERTZ_S_HEALING_HANDS,13855,
				2,BORGHERTZ_S_STRIKING_HANDS,12512,
				5,BORGHERTZ_S_VERMILLION_HANDS,14218};
	elseif(zone == 205) then -- Ifrit's Cauldron
		-- Drachen Mail (DRG)
		return {14,BORGHERTZ_S_DRAGON_HANDS,12649};
	elseif(zone == 208) then -- Quicksand Caves
		-- Drachen Greaves (DRG), Myochin Haidate (SAM)
		return {14,BORGHERTZ_S_DRAGON_HANDS,14102,
				12,BORGHERTZ_S_LOYAL_HANDS,14225};
	end
	
end

---------------------------------------
-- Returns true if NPC is a Treasure Chest. getName doesn't work
---------------------------------------

--function isChest(npc)
--	treasureName = npc:getName();
--	if(treasureName == "TreasureChest" or treasureName == "Treasure_Chest" or treasureName == "Treasure Chest")then
--		return true;
--	else
--		return false;
--	end
--end

---------------------------------------
-- Returns true ifNPC is a Treasure Coffer. getName doesn't work
---------------------------------------

--function isCoffer(npc)
--	treasureName = npc:getName();
--	if(treasureName == "TreasureCoffer" or treasureName == "Treasure_Coffer" or treasureName == "Treasure Coffer")then
--		return true;
--	else
--		return false;
--	end
--end

---------------------------------------
-- Returns the success increment depending on the THF tool used.
---------------------------------------

function thfKeySuccess(trade,playerLVL,treasureLVL)
	 sk = trade:hasItemQty(skeletonKey,1);
	 lk = trade:hasItemQty(livingKey,1);
	ttk = trade:hasItemQty(thftools,1);
	success = 0;
	if( sk ) then
		success = (playerLVL/treasureLVL) - 0.50 + SK_SUCCESS_INCREMENT;
	elseif( lk )then
		success = (playerLVL/treasureLVL) - 0.50 + LK_SUCCESS_INCREMENT;
	elseif( ttk ) then
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
	if( sk or lk or ttk )then
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
	illu  = player:getVar("["..player:getZone().."]".."Treasure_"..TreasureType); 
	
	-- SE impleted this in order to prevent coffer farming. 
	-- Noone in the same area can open more than 1 coffer per hour except for AF, maps or quests items.

	if(weak ~= nil) then -- old code: os.time() <= weak
		chance_answer = {-1,CHEST_WEAK};
	elseif(os.time() < illu and questItemNeeded == 0) then
		-- here should be a function in order to depop the coffer/chest and pop the coffer in another location after 5 minutes. 
		-- Fast search for fixing in future:  dePOP() , dePOP , dePOPNPC() , dePOPNPC
		if(TreasureType == "Chest")then
			chance_answer = {-2,CHEST_ILLUSION};
		elseif(TreasureType == "Coffer") then
			if(isTHFKey(trade))then
				chance_answer = {-1,CHEST_ILLUSION}; -- if you used a THF tool you will lose it.
			else
				chance_answer = {-2,CHEST_ILLUSION}; -- if you traded a zone key droped from mobs you will keep the key
			end		
		end
	elseif(not(isTHFKey(trade))) then 									  
		chance_answer = {1,nil}; -- Zone Key is always 100% success
	elseif(player:getMainJob() == 6 and player:getMainLvl() >= minLVL) then -- ifplayer is THF with level higher or equal than minimun lv for coffer/chest
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
-------------------------------------------------
Description:
	 Gil = { [1] Drop rate, [2] Minimum gil, [3] Maximum gil }
	Gems = { [1] Drop rate, [2] gem1,        [3] gem2,       [4] gem3,  ... ,[10] gem10 }
   Items = { [1] Drop rate, [2] item1,       [3] item2}
   
Date:
Any update should be here with the date which was modified as well as an URL where info was taken.
	* 07/21/2009 
		       URL : http://wiki.ffxiclopedia.org/wiki/Treasure_Chest/Coffer_Guide
		      Done : First collection of all the loot and drop rate.		
--]]-----------------------------------------------

	gil = {0.387,6040,12100};
	gems = {0.320,0x317,0x321,0x31D,0x325,0x323};
	items = {0.226,0x104D};
	
	-- Loot calculation 
	rand = math.random();
	rand = math.random();
	rand = math.random();
	
	if(rand <= gil[1])then
		reward = {"gil",math.random(gil[2],gil[3])};
	elseif(rand <= (gil[1] + gems[1])) then
		local num_gems = 0;
		local curr_gem = 2;
		while(gems[curr_gem] ~= nil) do
			curr_gem = curr_gem +1;
			num_gems = num_gems + 1;		
		end
		rand_gem = math.random(1,num_gems) + 1;
		reward = {"item",gems[rand_gem]};
	else
		local num_item = 0;
		local curr_item = 2;
		while(items[curr_item] ~= nil) do
			curr_item = curr_item +1;
			 num_item = num_item + 1;		
		end
		rand_item = math.random(1,num_item) + 1;
		reward = {"item",items[rand_item]};
	end
	return reward;
end