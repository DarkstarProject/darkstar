-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC: Sarcophagus
-- Involved in Quest: The Requiem (BARD AF2)
-- @zone 195
-- @pos -420 8 500
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
require("scripts/zones/The_Eldieme_Necropolis/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(trade:hasItemQty(4154,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
		YumKilled = player:getVar("TheRequiemYumKilled");
		
		if(player:getVar("TheRequiemCS") == 3 and YumKilled == 0) then 
			player:messageSpecial(SENSE_OF_FOREBODING);
			SpawnMob(17576265); -- Spawn Yum Kimil NM @pos -414 8 499
			SpawnMob(17576267); -- Spawn Owl Guardian NM @pos -414 8 501
			SpawnMob(17576266); -- Spawn Dog Guardian NM @pos -414 8 497
		elseif(player:getVar("TheRequiemCS") == 3 and YumKilled == 1) then 
			player:startEvent(0x002e);
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(SARCOPHAGUS_CANNOT_BE_OPENED); -- Standard dialog
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
	if(csid == 0x002e) then 
		player:setVar("TheRequiemCS",0);
		player:setVar("TheRequiemYumKilled",0);
		player:addKeyItem(225);
		player:messageSpecial(KEYITEM_OBTAINED,225); -- Star Ring (Key Item). 
		player:tradeComplete();
	end
end;