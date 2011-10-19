-----------------------------------
-- Area: Port Bastok
-- NPC: Kagetora
-- Involved in Quest: Ayame and Kaede (Ninja Flag Quest)
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
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
player:delKeyItem(STRANGELY_SHAPED_CORAL);

	if (player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == 1) then
		AyameAndKaede = player:getVar("AyameAndKaede_Event");
		
		if (AyameAndKaede == 0) then
			player:startEvent(0x00f1);
		elseif (AyameAndKaede > 2) then
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

	if (csid == 0x00f1) then
		player:setVar("AyameAndKaede_Event",1);
	end
end;

