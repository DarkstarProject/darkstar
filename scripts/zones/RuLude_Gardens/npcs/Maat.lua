-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC:  Maat
-- Starts and Finishes Quest: In Defiant Challenge, Atop the Highest Mountains, Whence Blows the Wind
-- Involved in Quests: Beat Around the Bushin
-- @zone 243
-- @pos 8 3 118
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(player:getQuestStatus(JEUNO,IN_DEFIANT_CHALLENGE) == QUEST_ACCEPTED) then
		-- Trade Bomb Coal / Exoray Mold / Ancient Papyrus
		if(trade:hasItemQty(1090,1) and trade:hasItemQty(1089,1) and trade:hasItemQty(1088,1) and trade:getItemCount() == 3) then
			player:startEvent(0x0051); -- Finish Quest "In Defiant Challenge"
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	LvL = player:getMainLvl();
	inDefiantChallenge = player:getQuestStatus(JEUNO,IN_DEFIANT_CHALLENGE);
	atopTheHighestMountains = player:getQuestStatus(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS);
	whenceBlowsTheWind = player:getQuestStatus(JEUNO,WHENCE_BLOWS_THE_WIND);
	
	if(player:getVar("BeatAroundTheBushin") == 5) then
		player:startEvent(0x0075);
	elseif(inDefiantChallenge == QUEST_AVAILABLE and LvL == 50 and player:levelCap() == 50) then
		player:startEvent(0x004f); -- Start Quest "In Defiant Challenge"
	elseif(inDefiantChallenge == QUEST_ACCEPTED) then
		player:startEvent(0x0050); -- During Quest "In Defiant Challenge"
	elseif(atopTheHighestMountains == QUEST_AVAILABLE and LvL >= 51 and player:levelCap() == 55) then
		player:startEvent(0x0052); -- Start Quest "Atop the Highest Mountains"
	elseif(atopTheHighestMountains == QUEST_ACCEPTED) then
		if(player:hasKeyItem(ROUND_FRIGICITE) and player:hasKeyItem(SQUARE_FRIGICITE) and player:hasKeyItem(TRIANGULAR_FRIGICITE)) then 
			player:startEvent(0x0054); -- Finish Quest "Atop the Highest Mountains"
		else
			player:startEvent(0x0053); -- During Quest "Atop the Highest Mountains"
		end
	elseif(whenceBlowsTheWind == QUEST_AVAILABLE and LvL >= 56 and player:levelCap() == 60) then
		player:startEvent(0x0055); -- Start Quest "Whence Blows the Wind"
	elseif(whenceBlowsTheWind == QUEST_ACCEPTED) then
		if(player:hasKeyItem(ORCISH_CREST) and player:hasKeyItem(QUADAV_CREST) and player:hasKeyItem(YAGUDO_CREST)) then 
			player:startEvent(0x0057); -- Finish Quest "Whence Blows the Wind"
		else
			player:startEvent(0x0056); -- During Quest "Whence Blows the Wind"
		end
	end
	
end;

-- 0x0075  0x004f  0x0050  0x0051  0x0052  0x0053  0x0054  0x0055  0x0056  0x0057  0x0058  0x0059  0x005a  0x005c  0x005b  
-- 0x0040  0x003e  0x003f  0x005d  0x004e  0x005e  0x004a  0x273d  0x2798  0x2799  0x27b1
-- 0x004f  0x0051  0x0052  0x0054  0x0055  0x0057  0x0058  0x0059  0x005a  0x005c  0x0040  0x005d  0x004a  0x0075  0x2798  
-- 0x2799  0x27b1  0x2793  0x2794

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
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
		player:setTitle(HORIZON_BREAKER);
		player:levelCap(55);
		player:addFame(JEUNO,30);
		player:completeQuest(JEUNO,IN_DEFIANT_CHALLENGE);
	-- Genkai 2
	elseif(csid == 0x0052 and option == 1) then
		player:addQuest(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS);
	elseif(csid == 0x0054) then
		player:setTitle(SUMMIT_BREAKER);
		player:delKeyItem(ROUND_FRIGICITE);
		player:delKeyItem(SQUARE_FRIGICITE);
		player:delKeyItem(TRIANGULAR_FRIGICITE);
		player:levelCap(60);
		player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_60);
		player:addFame(JEUNO,30);
		player:completeQuest(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS);
	-- Genkai 3
	elseif(csid == 0x0055 and option == 1) then
		player:addQuest(JEUNO,WHENCE_BLOWS_THE_WIND);
	elseif(csid == 0x0057) then
		player:setTitle(SKY_BREAKER);
		player:delKeyItem(ORCISH_CREST);
		player:delKeyItem(QUADAV_CREST);
		player:delKeyItem(YAGUDO_CREST);
		player:levelCap(65);
		player:messageSpecial(YOUR_LEVEL_LIMIT_IS_NOW_65);
		player:addFame(JEUNO,30);
		player:completeQuest(JEUNO,WHENCE_BLOWS_THE_WIND);
	end
	
end;