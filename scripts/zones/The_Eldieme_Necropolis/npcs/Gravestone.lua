-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: Gravestone
-- Involved in Quests: fire and brimstone (Rng AF2)
-- !zone 195
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
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
end;

function onEventFinish(player,csid,option)

    if (csid == 5) then
        player:setVar("fireAndBrimstone",4);
    end

end;