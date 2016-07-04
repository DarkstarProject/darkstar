-----------------------------------
-- Area: La Theine Plateau
-- NPC:  Narvecaint
-- Involved in Mission: The Rescue Drill
-- @pos -263 22 129 102
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/La_Theine_Plateau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getCurrentMission(SANDORIA) == THE_RESCUE_DRILL) then
        local MissionStatus = player:getVar("MissionStatus");
        
        if (MissionStatus == 6) then
            player:startEvent(0x006b);
        elseif (MissionStatus == 7) then
            player:showText(npc, RESCUE_DRILL + 14);
        elseif (MissionStatus == 8) then
            player:showText(npc, RESCUE_DRILL + 21);
        elseif (MissionStatus >= 9) then
            player:showText(npc, RESCUE_DRILL + 26);
        else
            player:showText(npc, RESCUE_DRILL);
        end
    else
        player:showText(npc, RESCUE_DRILL);
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    
    if (csid == 0x006b) then
        player:setVar("MissionStatus",7);
    end
    
end;