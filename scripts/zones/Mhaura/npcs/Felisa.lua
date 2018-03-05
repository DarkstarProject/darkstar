-----------------------------------
-- Area: Mhaura
--  NPC: Felisa
-- Admits players to the dock in Mhaura.
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mhaura/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getZPos() > 38.5) then
        player:startEvent(221,player:getGil(),100);
    else
        player:startEvent(235);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 221 and option == 333) then
        player:delGil(100);
    end

end;