-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Ryo
-- Type: ZNM assistant
-- !pos -127.086 0.999 22.693 50
-----------------------------------
require("scripts/globals/besieged");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(913);
end;

function onEventUpdate(player,csid,option)
    -- printf("updateCSID: %u",csid);
    -- printf("updateRESULT: %u",option);
    if (option == 300) then
        player:updateEvent(player:getCurrency("zeni_point"),0);
    else
        player:updateEvent(0,0);
    end
end;

function onEventFinish(player,csid,option)
    -- printf("finishCSID: %u",csid);
    -- printf("finishRESULT: %u",option);
end;