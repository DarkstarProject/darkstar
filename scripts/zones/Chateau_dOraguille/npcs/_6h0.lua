-----------------------------------
-- Area: Chateau d'Oraguille
-- NPC:  Door: Prince Royal's
-- Finishes Quest: A Boy's Dream
-- @zone 233
-- @pos -38 -3 73
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/zones/Chateau_dOraguille/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getVar("aBoysDreamCS") == 8) then 
		player:startEvent(0x0058);
	end
	
	return 1;
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
	if(csid == 0x0058) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14095);
		else
			if(player:getMainJob() == 7) then 
				player:addQuest(SANDORIA,UNDER_OATH);
			end
			player:delKeyItem(KNIGHTS_BOOTS);
			player:addItem(14095);
			player:messageSpecial(ITEM_OBTAINED,14095); -- Gallant Leggings
			player:setVar("aBoysDreamCS",0);
			player:addFame(SANDORIA,SAN_FAME*30);
			player:completeQuest(SANDORIA,A_BOY_S_DREAM);
		end
	end
end;

