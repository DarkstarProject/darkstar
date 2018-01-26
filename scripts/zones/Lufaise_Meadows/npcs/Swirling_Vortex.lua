-----------------------------------
-- Area: Lufaise Meadows
--  NPC: Swirling Vortex
--  Entrance to Valkurm Dunes
-----------------------------------
require("scripts/globals/teleports");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(100);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 100 and option == 1) then
        toValkurmDunes(player);
    end

end;