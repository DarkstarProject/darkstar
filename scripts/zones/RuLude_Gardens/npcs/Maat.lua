-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC:  Maat
-- Starts and Finishes Quest: In Defiant Challenge
-- Involved in Quests: Beat Around the Bushin
-- @zone 243
-- @pos 8 3 118
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
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
	
	if(player:getVar("BeatAroundTheBushin") == 5) then
		player:startEvent(0x0075);
	elseif(inDefiantChallenge == QUEST_AVAILABLE and LvL == 50 and player:levelCap() == 50) then
		player:startEvent(0x004f); -- Start Quest "In Defiant Challenge"
	elseif(inDefiantChallenge == QUEST_ACCEPTED) then
		player:startEvent(0x0050); -- During Quest "In Defiant Challenge"
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
	elseif(csid == 0x004f and option == 1) then
		player:addQuest(JEUNO,IN_DEFIANT_CHALLENGE);
	elseif(csid == 0x0051) then
		player:tradeComplete();
		player:setTitle(HORIZON_BREAKER);
		player:levelCap(55);
		player:addFame(JEUNO,30);
		player:completeQuest(JEUNO,IN_DEFIANT_CHALLENGE);
	end
	
end;