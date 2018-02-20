-----------------------------------
-- Area: Inner Horutoto Ruins
--  NPC: Gate: Magical Gizmo
-- Involved In Mission: The Heart of the Matter
-- !pos 584 0 -660 194
-----------------------------------
package.loaded["scripts/zones/Outer_Horutoto_Ruins/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Outer_Horutoto_Ruins/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    -- Check if we are on Windurst Mission 1-2
    if (player:getCurrentMission(WINDURST) == THE_HEART_OF_THE_MATTER and
       player:getVar("MissionStatus") == 3 and player:hasKeyItem(SOUTHEASTERN_STAR_CHARM)) then
        player:startEvent(44);
    else
        player:messageSpecial(DOOR_FIRMLY_SHUT);
    end

    return 1;

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    -- If we just finished the cutscene for Windurst Mission 1-2
    if (csid == 44) then
        player:setVar("MissionStatus",4);
        player:messageSpecial(ALL_G_ORBS_ENERGIZED);
        -- Remove the charm that opens this door
        player:delKeyItem(SOUTHEASTERN_STAR_CHARM);
    end

end;