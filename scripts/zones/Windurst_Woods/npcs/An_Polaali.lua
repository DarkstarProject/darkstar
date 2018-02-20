-----------------------------------
-- Area: Windurst Woods
--  NPC: An Polaali
-- Working 100%
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(126) == true) then
        player:startEvent(407);
    elseif (player:getVar("CHASING_TALES_TRACK_BOOK") == 1) then
        player:startEvent(404); -- Neeed CS here

    else
        player:startEvent(44);
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