-----------------------------------
-- Area: Palborough Mines
--  NPC: Old Toolbox
-- Continues Quest: The Eleventh's Hour (100%)
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(14);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)

    if (csid == 14) then
        player:setPos(-73, 0, 60, 1, 172);
    end

end;