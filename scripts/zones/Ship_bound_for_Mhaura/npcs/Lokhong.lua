-----------------------------------
-- Area: Ship bound for Mhaura
-- NPC: Lokhong
-- Guild Merchant NPC: Fishing Guild 
-----------------------------------

package.loaded["scripts/zones/Ship_bound_for_Mhaura/TextIDs"] = nil;

require("scripts/zones/Ship_bound_for_Mhaura/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(LOKHONG_SHOP_DIALOG);
	player:sendGuild(519,1,23,5);
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
end;



