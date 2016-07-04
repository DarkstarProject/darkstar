-----------------------------------
-- Area: Beaucedine_Glacier
-- NPC:  Beastmen_s_Banner
-- @pos 20.169 -80.078 180.063 111
-----------------------------------
package.loaded["scripts/zones/Beaucedine_Glacier/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Beaucedine_Glacier/TextIDs");

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