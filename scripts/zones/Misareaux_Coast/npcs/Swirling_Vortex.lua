-----------------------------------
-- Area: Misareaux Coast
--  NPC: Swirling Vortex
--  Entrance to Qufim Island
-----------------------------------
require("scripts/globals/teleports");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(554);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 554 and option == 1) then
        toQufimIsland(player);
    end

end;