-----------------------------------
-- Area: Port Bastok
-- NPC:  Kaede
-- Start Quest: Ayame and Kaede
-- Involved in Quests: Riding on the Clouds
-- @zone 236
-- @pos 48 -6 67
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_2") == 4) then
		if(trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
			player:setVar("ridingOnTheClouds_2",0);
			player:tradeComplete();
			player:addKeyItem(SMILING_STONE);
			player:messageSpecial(KEYITEM_OBTAINED,SMILING_STONE);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(player:getMainLvl() >= 30) then			
		if(player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) ~= QUEST_FINISHED) then
			player:startEvent(0x00f0);
		else
			player:startEvent(0x00f8);
		end
	else
		player:startEvent(0x001a);
	end
	
end; 

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

	if(csid == 0x00f0) then
		if(player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == QUEST_AVAILABLE) then
			player:addQuest(BASTOK,AYAME_AND_KAEDE);
		end
	end
	
end;