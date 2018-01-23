-----------------------------------
-- Area: Western Adoulin
--  NPC: Quam Jitahr
-- Type: Standard NPC
--  @zone 256
--  !pos -43 0 -105 256
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local SOA_Mission = player:getCurrentMission(SOA);
    if (SOA_Mission >= LIFE_ON_THE_FRONTIER) then
        -- Standard dialogue
        player:startEvent(573);
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(534);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
