-----------------------------------
-- Area: Eastern Altepa Desert
-- NPC:  Beastmen_s_Banner
-- @pos -257 8 -249 114
-----------------------------------
package.loaded["scripts/zones/Eastern_Altepa_Desert/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Eastern_Altepa_Desert/TextIDs");

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