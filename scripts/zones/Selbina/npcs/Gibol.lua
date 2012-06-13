-----------------------------------
-- Area: Selbina
-- NPC:  Gibol
-- Guild Merchant NPC: Clothcrafting Guild 
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
		player:messageSpecial(WEAVERS_GUILD);
		player:sendGuild(515,6,21,0);
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



