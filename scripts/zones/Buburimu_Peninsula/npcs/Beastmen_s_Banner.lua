-----------------------------------
-- Area: Buburimu_Peninsula
-- NPC:  Beastmen_s_Banner
-- @pos -132.589 19.999 -314.261 118
-----------------------------------
package.loaded["scripts/zones/Buburimu_Peninsula/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Buburimu_Peninsula/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(BEASTMEN_BANNER);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("OPTION: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("OPTION: %u",option);
end;