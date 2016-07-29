-----------------------------------
-- Area: Pashhow Marshlands
-- NPC:  Beastmen_s_Banner
-- @pos -172.764 25.119 93.640 109
-----------------------------------
package.loaded["scripts/zones/Pashhow_Marshlands/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Pashhow_Marshlands/TextIDs");

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