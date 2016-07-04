-----------------------------------
-- Area: Cape_Teriggan
-- NPC:  Beastmen_s_Banner
-- @pos 162.059 -0.859 250.538 113
-----------------------------------
package.loaded["scripts/zones/Cape_Teriggan/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Cape_Teriggan/TextIDs");

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