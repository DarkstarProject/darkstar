-----------------------------------
-- Area: Port Bastok
-- NPC:  Kaede
-- Start Quest: Ayame and Kaede
-- @zone 236
-- @pos 48 -6 67
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
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