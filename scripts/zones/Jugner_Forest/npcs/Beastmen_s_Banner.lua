-----------------------------------
-- Area: Jugner_Forest
--  NPC: Beastmen_s_Banner
-- !pos 448.240 0.210 -157.228 104
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Jugner_Forest/TextIDs");
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