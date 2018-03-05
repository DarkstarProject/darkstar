-----------------------------------
-- Elevator in Palborough
-- Notes: Used to operate Elevator @3z0
-----------------------------------
package.loaded["scripts/zones/Palborough_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Palborough_Mines/TextIDs");
require("scripts/globals/status");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    RunElevator(ELEVATOR_PALBOROUGH_MINES_LIFT);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
