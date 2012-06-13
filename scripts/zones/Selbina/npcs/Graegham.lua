-----------------------------------
-- Area: Selbina
-- NPC:  Graegham
-- Guild Merchant NPC: Fishing Guild 
-- @zone 248
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;

require("scripts/globals/settings");
require("scripts/zones/Selbina/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(FISHING_GUILD);
	player:sendGuild(520,3,18,5);
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



