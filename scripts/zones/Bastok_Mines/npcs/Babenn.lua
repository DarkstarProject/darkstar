-----------------------------------
-- Area: Bastok Mines
-- NPC: Babenn
-- Finishes Quest: The Eleventh's Hour (100%)
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

Elevenths = player:getQuestStatus(BASTOK,THE_ELEVENTH_S_HOUR);
EleventhsVar = player:getVar("EleventhsHour");

	if (Elevenths == 1 and EleventhsVar == 3) then
		player:startEvent(0x002d);
	else
		player:startEvent(0x0028);
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x002d) then
		player:completeQuest(BASTOK,THE_ELEVENTH_S_HOUR);
		player:delKeyItem(0x18);
		player:setTitle(85);
		player:addItem(16629);
		player:messageSpecial(ITEM_OBTAINED,16629);
		player:addFame(BASTOK,BAS_FAME*100);
	end
	
end;




