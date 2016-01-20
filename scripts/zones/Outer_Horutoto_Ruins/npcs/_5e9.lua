-----------------------------------
-- Area: Inner Horutoto Ruins
-- NPC:  Gate: Magical Gizmo
-- Involved In Mission: The Heart of the Matter
-- @pos 584 0 -660 194
-----------------------------------
package.loaded["scripts/zones/Outer_Horutoto_Ruins/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Outer_Horutoto_Ruins/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    -- Check if we are on Windurst Mission 1-2
    if (player:getCurrentMission(WINDURST) == THE_HEART_OF_THE_MATTER and 
       player:getVar("MissionStatus") == 3 and player:hasKeyItem(SOUTHEASTERN_STAR_CHARM)) then
        player:startEvent(0x002c);
    else
        player:messageSpecial(DOOR_FIRMLY_SHUT);
    end
    
    return 1;
    
end; 
        
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    -- If we just finished the cutscene for Windurst Mission 1-2
    if (csid == 0x002c) then
        player:setVar("MissionStatus",4);
        player:messageSpecial(ALL_G_ORBS_ENERGIZED);
        -- Remove the charm that opens this door
        player:delKeyItem(SOUTHEASTERN_STAR_CHARM);
    end
    
end;