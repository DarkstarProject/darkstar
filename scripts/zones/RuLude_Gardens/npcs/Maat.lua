-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC:  Maat
-- Starts and Finishes Quest: Limit Break Quest 1-5
-- Involved in Quests: Beat Around the Bushin
-- @zone 243
-- @pos 8 3 118
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	local tradeCount = trade:getItemCount();
	if(player:getQuestStatus(JEUNO,IN_DEFIANT_CHALLENGE) == QUEST_ACCEPTED) then
		-- Trade Bomb Coal / Exoray Mold / Ancient Papyrus
		if(trade:hasItemQty(1090,1) and trade:hasItemQty(1089,1) and trade:hasItemQty(1088,1) and tradeCount == 3) then
			player:startEvent(0x0051); -- Finish Quest "In Defiant Challenge"
		end
	end

	if(player:getQuestStatus(JEUNO,SHATTERING_STARS) ~= QUEST_AVAILABLE and player:getMainLvl() >= 66 and player:getVar("maatsCap") < 1) then
		local mJob = player:getMainJob();
		if(trade:hasItemQty(1425 + mJob,1) and tradeCount == 1 and mJob <= 15) then
			player:startEvent(0x0040,mJob); -- Teleport to battlefield for "Shattering Stars"
		end
	end

	-- Begin custom content
	if (trade:hasItemQty(28390,1) and tradeCount == 1 and player:getQuestStatus(JEUNO,IN_DEFIANT_CHALLENGE) == QUEST_COMPLETED) then
		doLimitBreakReward(player, 28390, 1); -- Augmented Fiend Torque for clearing G1
	end
	if (trade:hasItemQty(15931,1) and tradeCount == 1 and player:getQuestStatus(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_COMPLETED) then
		doLimitBreakReward(player, 15931, 1); -- Augmented Goblin Cest (belt slot) for clearing G2
	end
	if (trade:hasItemQty(15849,1) and tradeCount == 1 and player:getQuestStatus(JEUNO,WHENCE_BLOWS_THE_WIND) == QUEST_COMPLETED) then
		doLimitBreakReward(player, 15849, 1); -- Augmented Krousis Ring for clearing G3
	end
	if (trade:hasItemQty(19219,1) and tradeCount == 1 and player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_COMPLETED) then
		doLimitBreakReward(player, 19219, 1); -- Augmented Iwatsube (melee's only, ammo slot) for clearing G4
	end
	if (trade:hasItemQty(16246,1) and tradeCount == 1 and player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_COMPLETED) then
		doLimitBreakReward(player, 16246, 1); -- Augmented Viator Cape (RNG and COR only, back slot) for clearing G4
	end
	-- End custom content
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local LvL = player:getMainLvl();
	local mJob = player:getMainJob();
	local inDefiantChallenge = player:getQuestStatus(JEUNO,IN_DEFIANT_CHALLENGE);
	local atopTheHighestMountains = player:getQuestStatus(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS);
	local whenceBlowsTheWind = player:getQuestStatus(JEUNO,WHENCE_BLOWS_THE_WIND);
	local ridingOnTheClouds = player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS);
	local shatteringStars = player:getQuestStatus(JEUNO,SHATTERING_STARS);

	-- Begin custom content
	if (inDefiantChallenge == QUEST_COMPLETED and player:hasItem(28390) == false) then
		doLimitBreakReward(player, 28390, 0); -- Augmented Fiend Torque for clearing G1
	end
	if (atopTheHighestMountains == QUEST_COMPLETED and player:hasItem(15931) == false) then
		doLimitBreakReward(player, 15931, 0); -- Augmented Goblin Cest (belt slot) for clearing G2
	end
	if (whenceBlowsTheWind == QUEST_COMPLETED and player:hasItem(15849) == false) then
		doLimitBreakReward(player, 15849, 0); -- Augmented Krousis Ring for clearing G3
	end
	if (ridingOnTheClouds == QUEST_COMPLETED and player:hasItem(19219) == false) then
		doLimitBreakReward(player, 19219, 0); -- Augmented Iwatsube (melee's only, ammo slot) for clearing G4
	end
	if (ridingOnTheClouds == QUEST_COMPLETED and player:hasItem(16246) == false) then
		doLimitBreakReward(player, 16246, 0); -- Augmented Viator Cape (RNG and COR only, back slot) for clearing G4
	end
	-- End custom content

	if(player:getVar("BeatAroundTheBushin") == 5) then
		player:startEvent(0x0075);
	elseif(shatteringStars == QUEST_AVAILABLE and LvL >= 66 and mJob <= 15 and player:levelCap() == 70 and MAX_LEVEL >= 75) then
		player:startEvent(0x005c,player:getMainJob()); -- Start Quest "Shattering Stars"
	elseif(shatteringStars == QUEST_ACCEPTED and LvL >= 66 and mJob <= 15 and player:getVar("maatDefeated") >= 1) then
		player:startEvent(0x005d); -- Finish Quest "Shattering Stars"
	elseif(inDefiantChallenge == QUEST_AVAILABLE and LvL >= 50) then --  and player:levelCap() == 50 and MAX_LEVEL >= 55) then
		player:startEvent(0x004f); -- Start Quest "In Defiant Challenge"
	elseif(inDefiantChallenge == QUEST_ACCEPTED) then
		player:startEvent(0x0050); -- During Quest "In Defiant Challenge"
	elseif(atopTheHighestMountains == QUEST_AVAILABLE and LvL >= 51) then --  and player:levelCap() == 55 and MAX_LEVEL >= 60) then
		player:startEvent(0x0052); -- Start Quest "Atop the Highest Mountains"
	elseif(atopTheHighestMountains == QUEST_ACCEPTED) then
		if(player:hasKeyItem(ROUND_FRIGICITE) and player:hasKeyItem(SQUARE_FRIGICITE) and player:hasKeyItem(TRIANGULAR_FRIGICITE)) then
			player:startEvent(0x0054); -- Finish Quest "Atop the Highest Mountains"
		else
			player:startEvent(0x0053); -- During Quest "Atop the Highest Mountains"
		end
	elseif(whenceBlowsTheWind == QUEST_AVAILABLE and LvL >= 56) then --  and player:levelCap() == 60 and MAX_LEVEL >= 65) then
		player:startEvent(0x0055); -- Start Quest "Whence Blows the Wind"
	elseif(whenceBlowsTheWind == QUEST_ACCEPTED) then
		if(player:hasKeyItem(ORCISH_CREST) and player:hasKeyItem(QUADAV_CREST) and player:hasKeyItem(YAGUDO_CREST)) then
			player:startEvent(0x0057); -- Finish Quest "Whence Blows the Wind"
		else
			player:startEvent(0x0056); -- During Quest "Whence Blows the Wind"
		end
	elseif(ridingOnTheClouds == QUEST_AVAILABLE and LvL >= 61) then --  and player:levelCap() == 65 and MAX_LEVEL >= 70) then
		rand1 = math.random(0,7); rand2 = math.random(0,7);
		rand3 = math.random(0,7); rand4 = math.random(0,7);
		player:setVar("ridingOnTheClouds_1",rand1 + 1); player:setVar("ridingOnTheClouds_2",rand2 + 1);
		player:setVar("ridingOnTheClouds_3",rand3 + 1); player:setVar("ridingOnTheClouds_4",rand4 + 1);

		player:startEvent(0x0058,rand1,rand2,rand4,rand3,180); -- Start Quest "Riding on the Clouds"
	elseif(ridingOnTheClouds == QUEST_ACCEPTED) then
		if(player:hasKeyItem(SMILING_STONE) and player:hasKeyItem(SCOWLING_STONE) and player:hasKeyItem(SOMBER_STONE) and player:hasKeyItem(SPIRITED_STONE)) then
			player:startEvent(0x005a); -- Finish Quest "Riding on the Clouds"
		else
			rand1 = player:getVar("ridingOnTheClouds_1") ; rand2 = player:getVar("ridingOnTheClouds_2");
			rand3 = player:getVar("ridingOnTheClouds_3"); rand4 = player:getVar("ridingOnTheClouds_4");
			if(rand1 == 0) then rand1 = 8; else rand1 = rand1 - 1; end if(rand2 == 0) then rand2 = 8; else rand2 = rand2 - 1; end
			if(rand3 == 0) then rand3 = 8; else rand3 = rand3 - 1; end if(rand4 == 0) then rand4 = 8; else rand4 = rand4 - 1; end

			player:startEvent(0x0059,rand1,rand2,rand4,rand3,180); -- During Quest "Riding on the Clouds"
		end
	elseif(shatteringStars == QUEST_ACCEPTED and LvL >= 66 and mJob <= 15 and player:getVar("maatDefeated") == 0) then
		player:startEvent(0x005b,player:getMainJob()); -- During Quest "Shattering Stars"
	elseif(player:getQuestStatus(JEUNO,BEYOND_THE_SUN) == QUEST_AVAILABLE and mJob <= 15 and player:getVar("maatsCap") == 32767) then
		player:startEvent(0x004a); -- Finish Quest "Beyond The Sun"
	else
		player:showText(npc,MAAT_DIALOG);
	end

end;

-- Maat cap: 0x004a

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("upCSID: %u",csid);
--printf("upRESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if(csid == 0x0075) then
		player:setVar("BeatAroundTheBushin",6);
	-- Genkai 1
	elseif(csid == 0x004f and option == 1) then
		player:addQuest(JEUNO,IN_DEFIANT_CHALLENGE);
	elseif(csid == 0x0051) then
		player:tradeComplete();
		player:addTitle(HORIZON_BREAKER);
		-- player:levelCap(55);
		-- player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_55);
		player:completeQuest(JEUNO,IN_DEFIANT_CHALLENGE);
		player:addFame(JEUNO, JEUNO_FAME*30);
	-- Genkai 2
	elseif(csid == 0x0052 and option == 1) then
		player:addQuest(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS);
	elseif(csid == 0x0054) then
		player:addTitle(SUMMIT_BREAKER);
		player:delKeyItem(ROUND_FRIGICITE);
		player:delKeyItem(SQUARE_FRIGICITE);
		player:delKeyItem(TRIANGULAR_FRIGICITE);
		-- player:levelCap(60);
		-- player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_60);
		player:completeQuest(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS);
		player:addFame(JEUNO, JEUNO_FAME*40);
	-- Genkai 3
	elseif(csid == 0x0055 and option == 1) then
		player:addQuest(JEUNO,WHENCE_BLOWS_THE_WIND);
	elseif(csid == 0x0057) then
		player:addTitle(SKY_BREAKER);
		player:delKeyItem(ORCISH_CREST);
		player:delKeyItem(QUADAV_CREST);
		player:delKeyItem(YAGUDO_CREST);
		-- player:levelCap(65);
		-- player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_65);
		player:completeQuest(JEUNO,WHENCE_BLOWS_THE_WIND);
		player:addFame(JEUNO, JEUNO_FAME*50);
	elseif(csid == 0x0058) then
		if(option == 1) then
			player:addQuest(JEUNO,RIDING_ON_THE_CLOUDS);
		else
			player:setVar("ridingOnTheClouds_1",0);
			player:setVar("ridingOnTheClouds_2",0);
			player:setVar("ridingOnTheClouds_3",0);
			player:setVar("ridingOnTheClouds_4",0);
		end
	elseif(csid == 0x005a) then
		player:addTitle(CLOUD_BREAKER);
		player:delKeyItem(SMILING_STONE);
		player:delKeyItem(SCOWLING_STONE);
		player:delKeyItem(SOMBER_STONE);
		player:delKeyItem(SPIRITED_STONE);
		-- player:levelCap(70);
		-- player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_70);
		player:completeQuest(JEUNO,RIDING_ON_THE_CLOUDS);
		player:addFame(JEUNO, JEUNO_FAME*60);
	elseif(csid == 0x005c) then
		player:addQuest(JEUNO,SHATTERING_STARS);
	elseif(csid == 0x0040 and option == 1) then
		local mJob = player:getMainJob();
			if(mJob == 2 or mJob == 3 or mJob == 15) then	player:setPos(299.316,-123.591,353.760,66,146);
		elseif(mJob == 1 or mJob == 4 or mJob == 11) then	player:setPos(-511.459,159.004,-210.543,10,139);
		elseif(mJob == 7 or mJob == 8 or mJob == 10) then 	player:setPos(-225.146,-24.250,20.057,255,206);
		elseif(mJob == 5 or mJob == 6 or mJob == 9) then  	player:setPos(-349.899,104.213,-260.150,0,144);
		elseif(mJob == 12 or mJob == 13 or mJob == 14) then player:setPos(-220.084,-0.645,4.442,191,168); end
	elseif(csid == 0x005d) then
		player:addTitle(STAR_BREAKER);
		-- player:levelCap(75);

		-- Begin custom jump to 99 cap...
		player:addTitle(BUSHIN_ASPIRANT);
		-- "BUSHIN_RYU_INHERITOR" title comes from next Quest http://wiki.ffxiclopedia.org/wiki/Martial_Mastery
		player:levelCap(99);
		player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_99);
		player:addQuest(JEUNO,NEW_WORLDS_AWAIT);
		player:completeQuest(JEUNO,NEW_WORLDS_AWAIT);
		player:addQuest(JEUNO,EXPANDING_HORIZONS);
		player:completeQuest(JEUNO,EXPANDING_HORIZONS);
		player:addQuest(JEUNO,BEYOND_THE_STARS);
		player:completeQuest(JEUNO,BEYOND_THE_STARS);
		player:addQuest(JEUNO,DORMANT_POWERS_DISLODGED);
		player:completeQuest(JEUNO,DORMANT_POWERS_DISLODGED);
		player:addQuest(JEUNO,PRELUDE_TO_PUISSANCE);
		player:completeQuest(JEUNO,PRELUDE_TO_PUISSANCE);
		player:addQuest(JEUNO,BEYOND_INFINITY);
		player:completeQuest(JEUNO,BEYOND_INFINITY);
		-- End custom jump to 99 cap...

		player:setVar("maatDefeated",0);
		-- player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_75);
		player:completeQuest(JEUNO,SHATTERING_STARS);
		player:addFame(JEUNO, JEUNO_FAME*80);
	elseif(csid==0x004a)then
		if(player:getFreeSlotsCount() > 0)then
			player:completeQuest(JEUNO,BEYOND_THE_SUN);
			player:addTitle(ULTIMATE_CHAMPION_OF_THE_WORLD);
			player:setVar("maatsCap",0);
			player:addItem(15194);
			player:messageSpecial(ITEM_OBTAINED,15194);
		end
	end

end;

-- Custom content function
function doLimitBreakReward(player, itemID, tradeFlag)
	local Job = player:getMainJob();
	local aug_1 = 0;
	local val_1 = 0;
	local aug_2 = 0;
	local val_2 = 0;
	local aug_3 = 0;
	local val_3 = 0;
	-- These augments are job specific per item, not random.
	-- Values are +1 more than stated here because zero = +1 of an aug stat, max 31 (32 of a stat).
	if (player:getFreeSlotsCount() >= 1) then
		if (itemID == 28390) then -- Augmented Fiend Torque for clearing G1
			if (Job == 1) then -- WAR
				aug_1 = 41; val_1 = 3; aug_2 = 328; val_2 = 5; -- Crit.hit rate+4, Crit. hit damage+6%
			elseif (Job == 2) then -- MNK
				aug_1 = 41; val_1 = 3; aug_2 = 194; val_2 = 5; -- Crit.hit rate+4, Kick Attacks+6
			elseif (Job == 3) then -- WHM
				aug_1 = 134; val_1 = 3; aug_2 = 329; val_2 = 2; -- Mag.Def.Bns.+4, Cure potency+3%
			elseif (Job == 4) then -- BLM
				aug_1 = 133; val_1 = 2; aug_2 = 141; val_2 = 3; -- Mag.Atk.Bns.+3, Conserve MP+4
			elseif (Job == 5) then -- RDM
				aug_1 = 133; val_1 = 2; aug_2 = 134; val_2 = 3; -- Mag.Atk.Bns.+3, Mag.Def.Bns.+4
			elseif (Job == 6) then -- THF
				aug_1 = 41; val_1 = 5; aug_2 = 328; val_2 = 3; -- Crit.hit rate+6, Crit. hit damage+4%
			elseif (Job == 7) then -- PLD
				aug_1 = 140; val_1 = 1; aug_2 = 329; val_2 = 2; -- Fast Cast +2, Cure potency+3%
			elseif (Job == 8) then -- DRK
				aug_1 = 140; val_1 = 1; aug_2 = 37; val_2 = 2; -- Fast Cast +2, Magic evasion +3
			elseif (Job == 9) then -- BST
				aug_1 = 43; val_1 = 2; aug_2 = 40; val_2 = 2; -- Charm success +3, Enmity -3
			elseif (Job == 10) then -- BRD
				aug_1 = 35; val_1 = 2; aug_2 = 322; val_2 = 2; -- Mag. Acc.+3, Song Casting Time -3%
			elseif (Job == 11) then -- RNG
				aug_1 = 139; val_1 = 3; aug_2 = 211; val_2 = 2; -- Rapid Shot+4, Snapshot+3
			elseif (Job == 12) then -- SAM
				aug_1 = 142; val_1 = 4; aug_2 = 198; val_2 = 1; -- StoreTP +5, Zanshin+2
			elseif (Job == 13) then -- NIN
				aug_1 = 215; val_1 = 2; aug_2 = 146; val_2 = 3; -- Dual Wield+3, Enemy Crit Rate -4%
			elseif (Job == 14) then -- DRG
				aug_1 = 142; val_1 = 4; aug_2 = 333; val_2 = 2; -- StoreTP +5, Conserve TP +3
			elseif (Job == 15) then -- SMN
				aug_1 = 140; val_1 = 2; aug_2 = 320; val_2 = 3; -- Fast Cast +3, Blood Pact ability delay -4
			elseif (Job == 16) then -- BLU
				aug_1 = 35; val_1 = 2; aug_2 = 299; val_2 = 2; -- Mag. Acc.+3, Blue Magic Skill+3
			elseif (Job == 17) then -- COR
				aug_1 = 139; val_1 = 2; aug_2 = 211; val_2 = 3; -- Rapid Shot +3, Snapshot +4
			elseif (Job == 18) then -- PUP
				aug_1 = 257; val_1 = 3; aug_2 = 96; val_2 = 2; -- H2H skill +4, Pet: Accuracy+3 Rng.Acc+3
			elseif (Job == 19) then -- DNC
				aug_1 = 44; val_1 = 2; aug_2 = 333; val_2 = 1; -- StoreTP and Subtle Blow +3, Conserve TP +2
			elseif (job == 20) then -- SCH
				aug_1 = 35; val_1 = 3; aug_2 = 37; val_2 = 2; -- Mag. Acc.+4, Mag.Evasion+3
			elseif (Job == 21) then -- GEO
				aug_1 = 35; val_1 = 3; aug_2 = 796; val_2 = 3; -- Mag. Acc.+4, All elemental Resists +4
			elseif (Job == 22) then -- RUN
				aug_1 = 37; val_1 = 3; aug_2 = 796; val_2 = 3; -- Mag.Evasion+4, All elemental Resists +4
			end
		elseif (itemID == 15931) then -- Augmented Goblin Cest (belt slot) for clearing G2
			if (Job == 1) then -- WAR
				aug_1 = 551; val_1 = 1; aug_2 = 513; val_2 = 0; aug_3 = 143; val_3 = 1; -- STR+2 VIT+2, DEX+1, Dbl.Atk.+2
			elseif (Job == 2) then -- MNK
				aug_1 = 550; val_1 = 1; aug_2 = 514; val_2 = 0; aug_3 = 327; val_3 = 4; -- STR+2 DEX+2, VIT +1, Weapon skill damage+5%
			elseif (Job == 3) then -- WHM
				aug_1 = 555; val_1 = 1; aug_2 = 517; val_2 = 0; aug_3 = 138; val_3 = 0; -- INT+2 MND+3, Refresh+1
			elseif (Job == 4) then -- BLM
				aug_1 = 554; val_1 = 1; aug_2 = 516; val_2 = 0; aug_3 = 351; val_3 = 2; -- INT+3 MND+2, Occ. quickens spellcasting+2%
			elseif (Job == 5) then -- RDM
				aug_1 = 554; val_1 = 1; aug_2 = 512; val_2 = 0; aug_3 = 59; val_3 = 0; -- INT+2 MND+2, STR+1 Latent effect: Regain+1
			elseif (Job == 6) then -- THF
				aug_1 = 553; val_1 = 1; aug_2 = 518; val_2 = 0; aug_3 = 144; val_3 = 0; -- DEX+2 AGI+2, CHR+1, Triple Atk.+1
			elseif (Job == 7) then -- PLD
				aug_1 = 551; val_1 = 1; aug_2 = 517; val_2 = 0; aug_3 = 286; val_3 = 3; -- STR+2 VIT+2, MND+1, Shield skill+4
			elseif (Job == 8) then -- DRK
				aug_1 = 512; val_1 = 1; aug_2 = 554; val_2 = 0; aug_3 = 137; val_3 = 1; -- STR+2, INT+1 MND+1, Regen+2
			elseif (Job == 9) then -- BST
				aug_1 = 551; val_1 = 1; aug_2 = 518; val_2 = 0; aug_3 = 336; val_3 = 4; -- STR+2 VIT+2, CHR+1, Sic and Ready ability delay -5
			elseif (Job == 10) then -- BRD
				aug_1 = 555; val_1 = 1; aug_2 = 518; val_2 = 0; aug_3 = 37; val_3 = 3; -- MND+2 CHR+3, Mag.Evasion+4
			elseif (Job == 11) then -- RNG
				aug_1 = 552; val_1 = 1; aug_2 = 515; val_2 = 0; aug_3 = 29; val_3 = 7; -- STR+2 AGI+3, Rng.Atk.+8
			elseif (Job == 12) then -- SAM
				aug_1 = 551; val_1 = 1; aug_2 = 513; val_2 = 0; aug_3 = 332; val_3 = 4; -- STR+2 VIT+2, DEX+1, Sklchn.dmg.+5%
			elseif (Job == 13) then -- NIN
				aug_1 = 552; val_1 = 1; aug_2 = 513; val_2 = 0; aug_3 = 42; val_3 = 2; -- STR+2 AGI+2, DEX+1, Ninja tool Expertise +3
			elseif (Job == 14) then -- DRG
				aug_1 = 551; val_1 = 1; aug_2 = 513; val_2 = 0; aug_3 = 105; val_3 = 2; -- STR+2 VIT+2, DEX+1, Pet: Enmity-3
			elseif (Job == 15) then -- SMN
				aug_1 = 555; val_1 = 1; aug_2 = 37; val_2 = 1; aug_3 = 321; val_3 = 0; -- MND+2 CHR+2, Mag.Evasion+2, Avatar perpetuation cost -1
			elseif (Job == 16) then -- BLU
				aug_1 = 552; val_1 = 1; aug_2 = 513; val_2 = 0; aug_3 = 140; val_3 = 1; -- STR+2 AGI+2, DEX+1, Fast Cast+2
			elseif (Job == 17) then -- COR
				aug_1 = 553; val_1 = 1; aug_2 = 512; val_2 = 0; aug_3 = 27; val_3 = 4; -- DEX+2 AGI+2, STR+1, Rng.Acc.+5
			elseif (Job == 18) then -- PUP
				aug_1 = 553; val_1 = 1; aug_2 = 512; val_2 = 0; aug_3 = 341; val_3 = 4; -- DEX+2 AGI+2, STR+1, Repair potency+5%
			elseif (Job == 19) then -- DNC
				aug_1 = 555; val_1 = 1; aug_2 = 515; val_2 = 0; aug_3 = 331; val_3 = 4; -- MND+2 CHR+2, AGI+1, Waltz ability delay -5
			elseif (Job == 20) then -- SCH
				aug_1 = 554; val_1 = 2; aug_2 = 0; val_2 = 0; aug_3 = 134; val_3 = 1; -- INT+3 MND+3, Mag.Def.Bns.+2
			elseif (Job == 21) then -- GEO
				aug_1 = 554; val_1 = 2; aug_2 = 0; val_2 = 0; aug_3 = 133; val_3 = 0; -- INT+3 MND+3, Mag.Atk.Bns.+1
			elseif (Job == 22) then -- RUN
				aug_1 = 551; val_1 = 1; aug_2 = 33; val_2 = 10; aug_3 = 55; val_3 = 3; -- STR+2 VIT+2, DEF+10, Magic dmg. taken -4%
			end
		elseif (itemID == 15849) then -- Augmented Krousis Ring for clearing G3
			if (Job == 1) then -- WAR
				aug_1 = 25; val_1 = 3; aug_2 = 327; val_2 = 3; -- Attack+4, Weapon skill damage+4%
			elseif (Job == 2) then -- MNK
				aug_1 = 31; val_1 = 3; aug_2 = 49; val_2 = 1; -- Evasion+4, Haste+2%
			elseif (Job == 3) then -- WHM
				aug_1 = 286; val_1 = 3; aug_2 = 289; val_2 = 3; -- Shield skill+4, Healing magic skill+4
			elseif (Job == 4) then -- BLM
				aug_1 = 57; val_1 = 3; aug_2 = 335; val_2 = 3; -- Magic crit. hit rate+4, Mag. crit. hit dmg.+4
			elseif (Job == 5) then -- RDM
				aug_1 = 25; val_1 = 3; aug_2 = 351; val_2 = 3; -- Attack+4, Occ. quickens spellcasting+4%
			elseif (Job == 6) then -- THF
				aug_1 = 31; val_1 = 3; aug_2 = 143; val_2 = 0; -- Evasion+4, Dbl.Atk.+1
			elseif (Job == 7) then -- PLD
				aug_1 = 327; val_1 = 3; aug_2 = 153; val_2 = 3; -- Weapon skill damage+4%, Shield Mastery+4
			elseif (Job == 8) then -- DRK
				aug_1 = 23; val_1 = 3; aug_2 = 144; val_2 = 0; -- Accuracy+4, Triple Atk.+1
			elseif (Job == 9) then -- BST
				aug_1 = 326; val_1 = 3; aug_2 = 115; val_2 = 3; -- Weapon Skill Acc.+4, Pet: Store TP+4
			elseif (Job == 10) then -- BRD
				aug_1 = 31; val_1 = 3; aug_2 = 144; val_2 = 0; -- Evasion+4, Triple Atk.+1
			elseif (Job == 11) then -- RNG
				aug_1 = 326; val_1 = 3; aug_2 = 41; val_2 = 3; -- Weapon Skill Acc.+4, Crit.hit rate+4
			elseif (Job == 12) then -- SAM
				aug_1 = 326; val_1 = 3; aug_2 = 332; val_2 = 4; -- Weapon Skill Acc.+4, Sklchn.dmg.+5%
			elseif (Job == 13) then -- NIN
				aug_1 = 31; val_1 = 3; aug_2 = 328; val_2 = 3; -- Evasion+4, Crit. hit damage+4%
			elseif (Job == 14) then -- DRG
				aug_1 = 327; val_1 = 3; aug_2 = 121; val_2 = 3; -- Weapon skill damage+4%, Pet: Breath +4
			elseif (Job == 15) then -- SMN
				aug_1 = 120; val_1 = 3; aug_2 = 122; val_2 = 0; -- Avatar: Mag.Atk.Bns.+4, Pet: TP Bonus +20
			elseif (Job == 16) then -- BLU
				aug_1 = 57; val_1 = 3; aug_2 = 59; val_2 = 0; -- Magic crit. hit rate+4, Latent effect: Regain+1
			elseif (Job == 17) then -- COR
				aug_1 = 29; val_1 = 9; aug_2 = 325; val_2 = 7; -- Rng.Atk.+8, Quick Draw ability delay -10
			elseif (Job == 18) then -- PUP
				aug_1 = 145; val_1 = 3; aug_2 = 112; val_2 = 3; -- Counter+4, Pet: Damage taken -4%
			elseif (Job == 19) then -- DNC
				aug_1 = 342; val_1 = 3; aug_2 = 49; val_2 = 1; -- Waltz TP cost -4, Haste+1%
			elseif (Job == 20) then -- SCH
				aug_1 = 335; val_1 = 3; aug_2 = 350; val_2 = 3; -- Mag. crit. hit dmg.+4, Occ. maximizes magic accuracy+4%
			elseif (Job == 21) then -- GEO
				aug_1 = 140; val_1 = 2; aug_2 = 134; val_2 = 2; -- Fast Cast +3, Mag.Def.Bns.+3
			elseif (Job == 22) then -- RUN
				aug_1 = 326; val_1 = 3; aug_2 = 134; val_2 = 2; -- Weapon Skill Acc.+4, Mag.Def.Bns.+3
			end
		elseif (itemID == 19219) then -- Augmented Iwatsubute (ammo slot) for clearing G4
			if (Job == 1) then -- WAR
				aug_1 = 326; val_1 = 4; aug_2 = 1280; val_2 = 14; -- Weapon Skill Acc.+5%, Enhances Mighty Strikes effect (duration +15 sec)
			elseif (Job == 2) then -- MNK
				aug_1 = 145; val_1 = 4; aug_2 = 1281; val_2 = 14; -- Counter+5, Enhances Hundred Fists effect (duration +15 sec)
			elseif (Job == 3) then -- WHM
				aug_1 = 323; val_1 = 4; aug_2 = 1282; val_2 = 49; -- Cure spellcasting time -5%, Enhances Benediction effect (gives Benediction enmity -50.)
			elseif (Job == 4) then -- BLM
				aug_1 = 292; val_1 = 4; aug_2 = 1283; val_2 = 29; -- Elem. magic skill+5, Enhances Manafont effect (duration +30 sec)
			elseif (Job == 5) then -- RDM
				aug_1 = 291; val_1 = 4; aug_2 = 1284; val_2 = 19; -- Enfb.mag. skill+5, Enhances Chainspell effect (duration +20 sec)
			elseif (Job == 6) then -- THF
				aug_1 = 31; val_1 = 4; aug_2 = 1285; val_2 = 9; -- Evasion+5, Enhances Perfect Dodge effect (duration +10 sec)
			elseif (Job == 7) then -- PLD
				aug_1 = 33; val_1 = 19; aug_2 = 1286; val_2 = 9; -- Def+20, Enhances Invincible effect (duration +10 sec)
			elseif (Job == 8) then -- DRK
				aug_1 = 343; val_1 = 9; aug_2 = 1287; val_2 = 9; -- Drain/Aspir Potency +10, Enhances Blood Weapon effect (duration +10 sec)
			elseif (Job == 9) then -- BST
				aug_1 = 324; val_1 = 0; aug_2 = 1288; val_2 = 9; -- Call Beast ability delay -10, Enhances Familiar effect (duration +10 min, pet haste +10)
			elseif (Job == 10) then -- BRD
				itemID = 16246;
				aug_1 = 67; val_1 = 0; aug_2 = 1289; val_2 = 29; -- All Songs+1, Enhances Soul Voice effect (duration +30 sec)
			elseif (Job == 11) then -- RNG
				itemID = 16246;
				aug_1 = 338; val_1 = 1; aug_2 = 1290; val_2 = 19; -- Barrage+1, Enhances Eagle Eye Shot effect (damage +20%)
			elseif (Job == 12) then -- SAM
				aug_1 = 353; val_1 = 9; aug_2 = 1291; val_2 = 4; -- TP Bonus +500, Enhances Meikyo Shisui effect (Reduces the cost of weapon skills to 750/3000 TP)
			elseif (Job == 13) then -- NIN
				aug_1 = 140; val_1 = 4; aug_2 = 1292; val_2 = 49; -- Fast Cast +5, Enhances Mijin Gakure effect (damage +50%)
			elseif (Job == 14) then -- DRG
				aug_1 = 56; val_1 = 4; aug_2 = 1293; val_2 = 19; -- Breath dmg. taken -5%, Enhances Spirit Surge effect (duration +20 sec)
			elseif (Job == 15) then -- SMN
				aug_1 = 53; val_1 = 4; aug_2 = 1294; val_2 = 29; -- Spell interruption rate down 5%, Enhances Astral Flow effect (duration +30 sec)
			elseif (Job == 16) then -- BLU
				aug_1 = 332; val_1 = 4; aug_2 = 1295; val_2 = 9; -- Sklchn.dmg.+5%, Enhances Azure Lore effect (duration +10 sec)
			elseif (Job == 17) then -- COR
				itemID = 16246;
				aug_1 = 340; val_1 = 4; aug_2 = 1296; val_2 = 0; -- Phantom Roll ability delay -5, Enhances Wild Card effect (one invisible re-roll if the initial roll lands on a 1 or 2)
			elseif (Job == 18) then -- PUP
				aug_1 = 111; val_1 = 4; aug_2 = 1297; val_2 = 19; -- Pet: Haste+5, Enhances Overdrive effect (duration +20 sec)
			elseif (Job == 19) then -- DNC
				aug_1 = 330; val_1 = 4; aug_2 = 1298; val_2 = 19; -- Waltz potency +5%, Enhances Trance effect (duration +20 sec)
			elseif (Job == 20) then -- SCH
				aug_1 = 57; val_1 = 4; aug_2 = 1299; val_2 = 29; -- Magic crit. hit rate+5, Enhances Tablua Rasa effect (duration +30 sec)
			elseif (Job == 21) then -- GEO
				aug_1 = 37; val_1 = 4; aug_2 = 1300; val_2 = 29; -- Mag.Evasion+5, Enhances Bolster effect (duration +30 sec)
			elseif (Job == 22) then -- RUN
				aug_1 = 327; val_1 = 4; aug_2 = 1301; val_2 = 9; -- Weapon skill damage+5%, Enhances Elemental Sforzo effect (duration +10 sec)
			end
		elseif (itemID == 16246) then -- Augmented Viator Cape (RNG and COR only, back slot) for clearing G4
			if (Job == 1) then -- WAR
				itemID = 19219;
				aug_1 = 326; val_1 = 4; aug_2 = 1280; val_2 = 14; -- Weapon Skill Acc.+5%, Enhances Mighty Strikes effect (duration +15 sec)
			elseif (Job == 2) then -- MNK
				itemID = 19219;
				aug_1 = 145; val_1 = 4; aug_2 = 1281; val_2 = 14; -- Counter+5, Enhances Hundred Fists effect (duration +15 sec)
			elseif (Job == 3) then -- WHM
				itemID = 19219;
				aug_1 = 323; val_1 = 4; aug_2 = 1282; val_2 = 49; -- Cure spellcasting time -5%, Enhances Benediction effect (gives Benediction enmity -50.)
			elseif (Job == 4) then -- BLM
				itemID = 19219;
				aug_1 = 292; val_1 = 4; aug_2 = 1283; val_2 = 29; -- Elem. magic skill+5, Enhances Manafont effect (duration +30 sec)
			elseif (Job == 5) then -- RDM
				itemID = 19219;
				aug_1 = 291; val_1 = 4; aug_2 = 1284; val_2 = 19; -- Enfb.mag. skill+5, Enhances Chainspell effect (duration +20 sec)
			elseif (Job == 6) then -- THF
				itemID = 19219;
				aug_1 = 31; val_1 = 4; aug_2 = 1285; val_2 = 9; -- Evasion+5, Enhances Perfect Dodge effect (duration +10 sec)
			elseif (Job == 7) then -- PLD
				itemID = 19219;
				aug_1 = 33; val_1 = 19; aug_2 = 1286; val_2 = 9; -- Def+20, Enhances Invincible effect (duration +10 sec)
			elseif (Job == 8) then -- DRK
				itemID = 19219;
				aug_1 = 343; val_1 = 9; aug_2 = 1287; val_2 = 9; -- Drain/Aspir Potency +10, Enhances Blood Weapon effect (duration +10 sec)
			elseif (Job == 9) then -- BST
				itemID = 19219;
				aug_1 = 324; val_1 = 0; aug_2 = 1288; val_2 = 9; -- Call Beast ability delay -10, Enhances Familiar effect (duration +10 min, pet haste +10)
			elseif (Job == 10) then -- BRD
				aug_1 = 67; val_1 = 0; aug_2 = 1289; val_2 = 29; -- All Songs+1, Enhances Soul Voice effect (duration +30 sec)
			elseif (Job == 11) then -- RNG
				aug_1 = 338; val_1 = 1; aug_2 = 1290; val_2 = 19; -- Barrage+1, Enhances Eagle Eye Shot effect (damage +20%)
			elseif (Job == 12) then -- SAM
				itemID = 19219;
				aug_1 = 353; val_1 = 9; aug_2 = 1291; val_2 = 4; -- TP Bonus +500, Enhances Meikyo Shisui effect (Reduces the cost of weapon skills to 750/3000 TP)
			elseif (Job == 13) then -- NIN
				itemID = 19219;
				aug_1 = 140; val_1 = 4; aug_2 = 1292; val_2 = 49; -- Fast Cast +5, Enhances Mijin Gakure effect (damage +50%)
			elseif (Job == 14) then -- DRG
				itemID = 19219;
				aug_1 = 56; val_1 = 4; aug_2 = 1293; val_2 = 19; -- Breath dmg. taken -5%, Enhances Spirit Surge effect (duration +20 sec)
			elseif (Job == 15) then -- SMN
				itemID = 19219;
				aug_1 = 53; val_1 = 4; aug_2 = 1294; val_2 = 29; -- Spell interruption rate down 5%, Enhances Astral Flow effect (duration +30 sec)
			elseif (Job == 16) then -- BLU
				itemID = 19219;
				aug_1 = 332; val_1 = 4; aug_2 = 1295; val_2 = 9; -- Sklchn.dmg.+5%, Enhances Azure Lore effect (duration +10 sec)
			elseif (Job == 17) then -- COR
				aug_1 = 340; val_1 = 4; aug_2 = 1296; val_2 = 0; -- Phantom Roll ability delay -5, Enhances Wild Card effect (one invisible re-roll if the initial roll lands on a 1 or 2)
			elseif (Job == 18) then -- PUP
				itemID = 19219;
				aug_1 = 111; val_1 = 4; aug_2 = 1297; val_2 = 19; -- Pet: Haste+5, Enhances Overdrive effect (duration +20 sec)
			elseif (Job == 19) then -- DNC
				itemID = 19219;
				aug_1 = 330; val_1 = 4; aug_2 = 1298; val_2 = 19; -- Waltz potency +5%, Enhances Trance effect (duration +20 sec)
			elseif (Job == 20) then -- SCH
				itemID = 19219;
				aug_1 = 57; val_1 = 4; aug_2 = 1299; val_2 = 29; -- Magic crit. hit rate+5, Enhances Tablua Rasa effect (duration +30 sec)
			elseif (Job == 21) then -- GEO
				aug_1 = 37; val_1 = 4; aug_2 = 1300; val_2 = 29; -- Mag.Evasion+5, Enhances Bolster effect (duration +30 sec)
			elseif (Job == 22) then -- RUN
				itemID = 19219;
				aug_1 = 327; val_1 = 4; aug_2 = 1301; val_2 = 9; -- Weapon skill damage+5%, Enhances Elemental Sforzo effect (duration +10 sec)
			end
		end
		if (tradeFlag == 1) then
			player:tradeComplete();
		end
		player:addItem(itemID, 1, aug_1, val_1, aug_2, val_2, aug_3, val_3);
		player:messageSpecial(ITEM_OBTAINED, itemID);
	else
		player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, itemID);
	end
end;