-----------------------------------
-- Area: Ranguemont Pass
-- NPC: Waters of Oblivion
-- Finish Quest: Painful Memory (BARD AF1)
-- @zone 166
-- @pos -284 -45 210 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Ranguemont_Pass/TextIDs"] = nil;
require("scripts/zones/Ranguemont_Pass/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	TrosKilled = player:getVar("painfulMemoryTrosKilled");
	
	if(player:hasKeyItem(228) == true and TrosKilled == 0) then 
		player:messageSpecial(SENSE_OF_FOREBODING);
		SpawnMob(17457309); -- Spawn Tros NM
	elseif(player:hasKeyItem(228) == true and TrosKilled == 1) then 
		player:startEvent(0x0008); -- Finish Quest "Painful Memory"
	else
		player:messageSpecial(NOTHING_ORDINARY_HERE);
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
	if(csid == 0x0008) then 
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16766);
		else 
			player:completeQuest(JEUNO,PAINFUL_MEMORY);
			player:delKeyItem(228); -- Mertaire's Bracelet (key item).
			player:setVar("painfulMemoryTrosKilled",0);
			player:addItem(16766);
			player:messageSpecial(ITEM_OBTAINED,16766); -- Paper Knife
		end
	end
end;