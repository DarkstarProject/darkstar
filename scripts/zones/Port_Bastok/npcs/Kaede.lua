-----------------------------------
-- Area: Port Bastok
-- NPC: Kaede
-- Starts Quest: Ayame and Kaede (Ninja Flag Quest)
-----------------------------------

require("scripts/globals/quests");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
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
	--player:delQuest(BASTOK,AYAME_AND_KAEDE);
	if (player:getMainLvl() >= 30) then			
		if (player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) ~= 2) then
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

	if (csid == 0x00f0) then
		if (player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == 0) then
			player:addQuest(BASTOK,AYAME_AND_KAEDE);
		end
	end
end;