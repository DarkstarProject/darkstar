-----------------------------------
-- Area: Davoi
--  NPC: _452 (Elevator Lever)
-- Notes: Used to operate Elevator @450 (actual npc script is _454)
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/zones/Davoi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    npc:openDoor(3); -- lever animation
    RunElevator(dsp.elevator.DAVOI_LIFT); -- elevator @450 (actual npc script is _454)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option,npc)
end;
