-----------------------------------
-- Area: Mhaura
--  NPC: Emyr
-- Type: Standard NPC
-- !pos 45.021 -9 37.095 249
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mhaura/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getZPos() >= 39) then
        player:startEvent(228);
    else
        player:startEvent(223);
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