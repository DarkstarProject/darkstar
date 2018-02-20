-----------------------------------
-- Area: Yuhtunga_Jungle
--  NPC: Beastmen_s_Banner
-- !pos -305.061 16.172 -438.904 123
-----------------------------------
package.loaded["scripts/zones/Yuhtunga_Jungle/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Yuhtunga_Jungle/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:messageSpecial(BEASTMEN_BANNER);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("OPTION: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("OPTION: %u",option);
end;