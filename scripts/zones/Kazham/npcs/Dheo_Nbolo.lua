-----------------------------------
-- Area: Kazham
--  NPC: Dheo Nbolo
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Kazham/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getVar("BathedInScent") == 1) then
        player:startEvent(181); -- scent from Blue Rafflesias
    else
        player:startEvent(91);
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

