-----------------------------------
-- Area: Bastok Mines
--  NPC: Davyad
-- Involved in Mission: Bastok 3-2
-- !pos 83 0 30 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Mines/TextIDs");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(BASTOK) == TO_THE_FORSAKEN_MINES) then
        player:startEvent(54);
    else
        player:startEvent(53);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
