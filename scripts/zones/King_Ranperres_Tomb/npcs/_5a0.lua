-----------------------------------
-- Area: King Ranperre's Tomb
-- DOOR: _5a0 (Heavy Stone Door)
-- @pos -39.000 4.823 20.000 190
-----------------------------------
package.loaded["scripts/zones/King_Ranperres_Tomb/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/King_Ranperres_Tomb/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc) 
    local currentMission = player:getCurrentMission(SANDORIA);
    local MissionStatus = player:getVar("MissionStatus");
    
    if (currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 1) then
        if (GetMobAction(17555898) == 0 and GetMobAction(17555899) == 0 and GetMobAction(17555900) == 0) then
            if (player:getVar("Mission6-2MobKilled") == 1) then
                player:setVar("Mission6-2MobKilled",0);
                player:setVar("MissionStatus",2);
            else
                SpawnMob(17555898):updateClaim(player);
                SpawnMob(17555899):updateClaim(player);
                SpawnMob(17555900):updateClaim(player);
            end
        end
    elseif (currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 2) then
         player:startEvent(0x0006);
    elseif (currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 3) then
         player:startEvent(0x0007);
    elseif (currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 8) then
         player:startEvent(0x0005);
    elseif (currentMission == THE_HEIR_TO_THE_LIGHT and MissionStatus == 6) then
         player:startEvent(0x000e);

    else
        player:messageSpecial(HEAVY_DOOR);
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
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x0005) then 
        player:setVar("MissionStatus",9);
    elseif (csid == 0x000e) then 
        player:setVar("MissionStatus",7);
    -- at this point 3 optional cs are available and open until watched (add 3 var to char?)
    end
end;
