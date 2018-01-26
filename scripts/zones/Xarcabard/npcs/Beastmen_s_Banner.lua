-----------------------------------
-- Area: Xarcabard
--  NPC: Beastmen_s_Banner
-- !pos 153.000 -36.444 23.500 112
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Xarcabard/TextIDs");
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