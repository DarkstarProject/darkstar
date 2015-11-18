-----------------------------------
-- Area: Beaucedine Glacier
-- NPC:  Mirror Pond
-- Involved In Quest: Love And Ice
-- @zone 223
-----------------------------------
package.loaded["scripts/zones/Beaucedine_Glacier/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Beaucedine_Glacier/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local LoveAndIce = player:getQuestStatus(BASTOK,LOVE_AND_ICE);

	if (npc:getID() == 17232193) then -- Mirror Pond at J-8
		if (LoveAndIce == QUEST_ACCEPTED and player:hasKeyItem(CARMELOS_SONG_SHEET) == true) then
			player:startEvent(0x0064);
		end
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("updateRESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("finishRESULT: %u",option);
	
	if (csid == 0x0064) then
		player:setVar("LoveAndIceQuest",1);
		player:delKeyItem(CARMELOS_SONG_SHEET);
	end
	
end;