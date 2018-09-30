-----------------------------------
-- Area: Outer Horutoto Ruins
--  NPC: Gate: Magical Gizmo
-- Involved In Mission: The Heart of the Matter
-- !pos 584 0 -660 194
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
local ID = require("scripts/zones/Outer_Horutoto_Ruins/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    -- Check if we are on Windurst Mission 1-2
    if (player:getCurrentMission(WINDURST) == THE_HEART_OF_THE_MATTER and
       player:getVar("MissionStatus") == 3 and player:hasKeyItem(dsp.ki.SOUTHEASTERN_STAR_CHARM)) then
        player:startEvent(44);
    else
        player:messageSpecial(ID.text.DOOR_FIRMLY_SHUT);
    end

    return 1;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    -- If we just finished the cutscene for Windurst Mission 1-2
    if (csid == 44) then
        player:setVar("MissionStatus",4);
        player:messageSpecial(ID.text.ALL_G_ORBS_ENERGIZED);
        -- Remove the charm that opens this door
        player:delKeyItem(dsp.ki.SOUTHEASTERN_STAR_CHARM);
    end

end;