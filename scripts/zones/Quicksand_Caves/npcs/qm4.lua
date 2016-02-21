-----------------------------------
-- Area: Quicksand Caves
-- NPC:  ??? (qm4)
-- Involved in Mission: Bastok 8.1 "The Chains That Bind Us"
-- @pos
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Quicksand_Caves/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local missionStatus = player:getVar("MissionStatus");
    if (player:getCurrentMission(player:getNation()) == THE_CHAINS_THAT_BIND_US) and (missionStatus == 2) then
        player:startEvent(0x0A)  
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
    if (csid == 0x0A) then
        player:setVar("MissionStatus", 3);
    end
end;
