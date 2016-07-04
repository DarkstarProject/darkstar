-----------------------------------
-- Area: Valkurm Dunes
-- NPC:  Beastmen_s_Banner
-- @pos -116.204 4.000 -113.608 104
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Valkurm_Dunes/TextIDs");

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