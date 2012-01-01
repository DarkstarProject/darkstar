-----------------------------------
-- Area: Beadeaux
-- NPC:  Jail Door
-- Involved in Quests: The Rescue
-- @zone 147
-- @pos 56 0 -23
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
require("scripts/zones/Beadeaux/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(player:getQuestStatus(OTHER_AREAS,THE_RESCUE) == ACCEPTED and player:hasKeyItem(TRADERS_SACK) == false) then
		if(trade:hasItemQty(495,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
			player:startEvent(0x03e8);
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getQuestStatus(OTHER_AREAS,THE_RESCUE) == ACCEPTED and player:hasKeyItem(TRADERS_SACK) == false) then
		player:messageSpecial(LOCKED_DOOR_QUADAV_HAS_KEY);
		return 1;
	else
		player:messageSpecial(NOTHING_OUT_ORDINARY_HERE);
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
	if(csid == 0x03e8) then 
		player:addKeyItem(TRADERS_SACK);
		player:messageSpecial(KEYITEM_OBTAINED,TRADERS_SACK);
	end
end;



