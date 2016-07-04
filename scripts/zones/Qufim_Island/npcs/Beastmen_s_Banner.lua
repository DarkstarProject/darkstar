-----------------------------------
-- Area: Qufim_Island
-- NPC:  Beastmen_s_Banner
-- @pos 0.348 -20.126 73.479 126
-----------------------------------
package.loaded["scripts/zones/Qufim_Island/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Qufim_Island/TextIDs");

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