-----------------------------------
-- Area: Yuhtunga_Jungle
-- NPC:  Beastmen_s_Banner
-- @pos -305.061 16.172 -438.904 123
-----------------------------------
package.loaded["scripts/zones/Yuhtunga_Jungle/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Yuhtunga_Jungle/TextIDs");

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