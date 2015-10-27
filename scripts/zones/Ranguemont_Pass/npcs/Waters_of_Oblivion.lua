-----------------------------------
-- Area: Ranguemont Pass
-- NPC:  Waters of Oblivion
-- Finish Quest: Painful Memory (BARD AF1)
-- @pos -284 -45 210 166
-----------------------------------
package.loaded["scripts/zones/Ranguemont_Pass/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
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
	TrosKilled = player:getVar("TrosKilled");
	
	if (player:hasKeyItem(MERTAIRES_BRACELET) and (TrosKilled == 0 or (os.time() - player:getVar("Tros_Timer")) > 60)) then 
		player:messageSpecial(SENSE_OF_FOREBODING);
		SpawnMob(17457309,180):updateClaim(player); -- Spawn Tros NM
	elseif (player:hasKeyItem(MERTAIRES_BRACELET) == true and TrosKilled == 1) then 
		player:startEvent(0x0008); -- Finish Quest "Painful Memory"
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
	
	if (csid == 0x0008) then 
		if (player:getFreeSlotsCount() == 0 or player:hasItem(16766)) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16766);
		else 
			player:delKeyItem(MERTAIRES_BRACELET); -- Mertaire's Bracelet (key item).
			player:setVar("TrosKilled",0);
			player:setVar("Tros_Timer",0);
			player:addItem(16766);
			player:messageSpecial(ITEM_OBTAINED,16766); -- Paper Knife
			player:addFame(JEUNO,30);
			player:completeQuest(JEUNO,PAINFUL_MEMORY);
		end
	end
	
end;