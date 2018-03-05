-----------------------------------
-- Area: Quicksand Caves
--  NPC: ??? (qm4)
-- Involved in Mission: Bastok 8.1 "The Chains That Bind Us"
-- !pos
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Quicksand_Caves/TextIDs");
-----------------------------------

function onTrigger(player,npc)
    local missionStatus = player:getVar("MissionStatus");
    if (player:getCurrentMission(player:getNation()) == THE_CHAINS_THAT_BIND_US) and (missionStatus == 2) then
        player:startEvent(10)
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    -- printf("CSID:",csid);
    -- printf("RESULT:",option);
    if (csid == 10) then
        player:setVar("MissionStatus", 3);
    end
end;
