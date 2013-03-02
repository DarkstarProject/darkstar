-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC:  Maat
-- Starts and Finishes Quest: Limit Break Quest 1-5
-- Involved in Quests: Beat Around the Bushin
-- @zone 243
-- @pos 8 3 118
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
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

	if(player:getQuestStatus(JEUNO,SHATTERING_STARS) ~= QUEST_AVAILABLE and player:getMainLvl() >= 66) then
		local mJob = player:getMainJob();
		if(trade:hasItemQty(1425 + mJob,1) and tradeCount == 1 and mJob <= 15) then
			player:startEvent(0x0040,mJob); -- Teleport to battlefield for "Shattering Stars"
		end
	end

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

	if(LvL >= 66 and mJob <= 15 and MAX_LEVEL >= 75) then
		player:startEvent(0x005c,player:getMainJob()); -- Start Quest "Shattering Stars"
	elseif(shatteringStars == QUEST_ACCEPTED and LvL >= 66 and mJob <= 15 and player:getVar("maatDefeated") == 0) then
		player:startEvent(0x005b,player:getMainJob()); -- During Quest "Shattering Stars"
	elseif(shatteringStars == QUEST_ACCEPTED and LvL >= 66 and mJob <= 15 and player:getVar("maatDefeated") >= 1) then
		player:startEvent(0x005d); -- Finish Quest "Shattering Stars"
	else
		player:showText(npc,10259);
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
		player:levelCap(55);
		player:addFame(JEUNO,30);
		player:completeQuest(JEUNO,IN_DEFIANT_CHALLENGE);
	-- Genkai 2
	elseif(csid == 0x0052 and option == 1) then
		player:addQuest(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS);
	elseif(csid == 0x0054) then
		player:addTitle(SUMMIT_BREAKER);
		player:delKeyItem(ROUND_FRIGICITE);
		player:delKeyItem(SQUARE_FRIGICITE);
		player:delKeyItem(TRIANGULAR_FRIGICITE);
		player:levelCap(60);
		player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_60);
		player:addFame(JEUNO,40);
		player:completeQuest(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS);
	-- Genkai 3
	elseif(csid == 0x0055 and option == 1) then
		player:addQuest(JEUNO,WHENCE_BLOWS_THE_WIND);
	elseif(csid == 0x0057) then
		player:addTitle(SKY_BREAKER);
		player:delKeyItem(ORCISH_CREST);
		player:delKeyItem(QUADAV_CREST);
		player:delKeyItem(YAGUDO_CREST);
		player:levelCap(65);
		player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_65);
		player:addFame(JEUNO,50);
		player:completeQuest(JEUNO,WHENCE_BLOWS_THE_WIND);
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
		player:levelCap(70);
		player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_70);
		player:addFame(JEUNO,60);
		player:completeQuest(JEUNO,RIDING_ON_THE_CLOUDS);
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
		player:levelCap(75);
		player:setVar("maatCap",player:getVar("maatDefeated"));
		player:setVar("maatDefeated",0);
		player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_75);
		player:addFame(JEUNO,80);
		player:completeQuest(JEUNO,SHATTERING_STARS);
	end

end;