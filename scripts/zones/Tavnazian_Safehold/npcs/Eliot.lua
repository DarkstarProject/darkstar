-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Eliot
-- !pos -103 -26 -49 26
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasCompletedMission(COP,DARKNESS_NAMED)) then
        player:sendMenu(3);
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