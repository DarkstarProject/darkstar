-----------------------------------
-- Area: Quicksand Caves
-- NPC:  ??? (qm6)
-- Bastok Mission 8.1 "The Chains That Bind Us"
-- @pos 
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Quicksand_Caves/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

    local missionStatus = player:getVar("MissionStatus");
    local timesincelastclear = os.time()-GetServerVariable("Bastok8-1LastClear"); -- how long ago they were last killed.

    local currentMission = player:getCurrentMission(player:getNation())
    if (currentMission == THE_CHAINS_THAT_BIND_US) and (missionStatus == 1) then
        if (timesincelastclear < QM_RESET_TIME) then
            player:startEvent(0x0B);
        elseif (GetMobAction(17629187) == 0) and (GetMobAction(17629188) == 0) and (GetMobAction(17629189) == 0) then
            SpawnMob(17629187):updateClaim(player); -- Centurio IV-VII
            SpawnMob(17629188):updateClaim(player); -- Triarius IV-XIV
            SpawnMob(17629189):updateClaim(player); -- Princeps IV-XLV
            player:messageSpecial(SENSE_OF_FOREBODING); 
            npc:setStatus(2); -- Disappear
            SetServerVariable("BastokFight8_1", 3);
        end
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
    -- print("CSID:",csid);
    -- print("RESULT:",option);        
    if (csid == 0x0B) then
        player:setVar("MissionStatus", 2);
    end
end;