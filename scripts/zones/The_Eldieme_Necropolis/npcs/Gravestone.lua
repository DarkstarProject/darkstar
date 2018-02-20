-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: Gravestone
-- Involved in Quests: fire and brimstone (Rng AF2)
-- @zone 195
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/The_Eldieme_Necropolis/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    -- rng af2
    local FireAndBrimstoneCS = player:getVar("fireAndBrimstone");
    if (FireAndBrimstoneCS == 3) then
        player:startEvent(5);
    end

end;
--
function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 5) then
        player:setVar("fireAndBrimstone",4);
    end

end;