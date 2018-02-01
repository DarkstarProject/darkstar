-----------------------------------
-- Area: The Colosseum
--  NPC: _1e9 (Gate: The Pit)
-- !pos -604 -1.949 40 71
-----------------------------------
package.loaded["scripts/zones/The_Colosseum/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Colosseum/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(51);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 51 and option == 1) then
        player:setPos(79.981, 0, -104.897, 190, 50)
    end
end;
