-----------------------------------
-- Area: Western Adoulin
--  NPC: Andrival
-- Type: Standard NPC
--  @zone 256
-- !pos 26 0 127
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local SOA_Mission = player:getCurrentMission(SOA);

    if (SOA_Mission == THE_MERCILESS_ONE) then
        -- Reminds player to accompany Ingrid to Castle Adoulin
        player:startEvent(139);
    else
        -- Standard dialogue
        player:startEvent(552);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
