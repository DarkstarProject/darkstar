-----------------------------------
-- Area: Qu'Bia Arena
-- NPC:  Those Who Lurk in Shadows
-- !pos -221 -24 19 206
-----------------------------------
package.loaded["scripts/zones/QuBia_Arena/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/QuBia_Arena/TextIDs");

-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBcnmLeave(player,instance,leavecode)
    -- print("leave code "..leavecode);
    if (player:hasKeyItem(MARK_OF_SEED)) then
        player:delKeyItem(MARK_OF_SEED);
    end

    if (leavecode == 2) then -- Play end CS. Need time and battle id for record keeping + storage
        player:addExp(700);
        if (player:getCurrentMission(ACP) == THOSE_WHO_LURK_IN_SHADOWS_III) then
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,20,0);
        else -- Gives skip dialog if previously completed
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,20,1);
        end
    elseif (leavecode == 4) then
        player:startEvent(32002);
    end
end;

function onEventUpdate(player,csid,option)
    -- print("bc update csid "..csid.." and option "..option);
end;

function onEventFinish(player,csid,option)
    -- print("bc finish csid "..csid.." and option "..option);
    if (csid == 32001) then
        if (player:getCurrentMission(ACP) == THOSE_WHO_LURK_IN_SHADOWS_III) then
            player:completeMission(ACP,THOSE_WHO_LURK_IN_SHADOWS_III);
            player:addMission(ACP,REMEMBER_ME_IN_YOUR_DREAMS);
        end

        if (player:hasKeyItem(IVORY_KEY) == false and player:getCurrentMission(ACP) >= THOSE_WHO_LURK_IN_SHADOWS_III) then
            player:addKeyItem(IVORY_KEY);
            player:setVar("LastIvoryKey", os.date("%j"));
            player:messageSpecial(KEYITEM_OBTAINED,IVORY_KEY);
        end
    end
end;