-----------------------------------
-- Area: Port Bastok
-- NPC:  Kagetora
-- Involved in Quest: Ayame and Kaede
-- @zone 236
-- @pos -96 -2 29
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

	if(player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == QUEST_ACCEPTED) then
		
		AyameAndKaede = player:getVar("AyameAndKaede_Event");
		
		if(AyameAndKaede == 0) then
			player:startEvent(0x00f1);
		elseif(AyameAndKaede > 2) then
			player:startEvent(0x00f4);
		else
			player:startEvent(0x0017);
		end
	else
		player:startEvent(0x0017);
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

	if(csid == 0x00f1) then
		player:setVar("AyameAndKaede_Event",1);
	end
	
end;