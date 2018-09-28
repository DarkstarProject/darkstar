-----------------------------------
-- Area: Western Adoulin
--  NPC: Volgoi
-- Type: Standard NPC
--  @zone 256
-- !pos -154 4 -22
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local SOA_Mission = player:getCurrentMission(SOA);
    if ((SOA_Mission >= BEAUTY_AND_THE_BEAST) and (SOA_Mission <= SALVATION)) then
        -- Speech while Arciela is 'kidnapped'
        player:startEvent(151);
    else
        -- Standard dialogue
        player:startEvent(501);
        -- Volgoi also has 0x0243 associated with him, but it's the exact same dialogue
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
