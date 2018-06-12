-----------------------------------
-- Area: Western Adoulin
--  NPC: Berstrogus
-- Type: Standard NPC
--  @zone 256
-- !pos -44 4 -10
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local SOA_Mission = player:getCurrentMission(SOA);

    if (SOA_Mission >= LIFE_ON_THE_FRONTIER) then
        -- Standard dialogue, after joining colonization effort
        player:startEvent(587);
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(504);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
