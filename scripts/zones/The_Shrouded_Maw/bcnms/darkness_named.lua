-----------------------------------
-- Area: The_Shrouded_Maw
-- Name: darkness_named
-----------------------------------
package.loaded["scripts/zones/The_Shrouded_Maw/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Shrouded_Maw/TextIDs");
require("scripts/zones/The_Shrouded_Maw/MobIDs");
require("scripts/globals/missions");
require("scripts/globals/status");
require("scripts/globals/titles");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
    -- "close" all floor tiles
    local inst = player:getBattlefieldID();
    local tile = DARKNESS_NAMED_TILE_OFFSET + (inst - 1) * 8;
    for i = tile, tile + 7 do
        GetNPCByID(i):setAnimation(ANIMATION_CLOSE_DOOR);
    end
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
    if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
        player:addExp(1000);
        if (player:getCurrentMission(COP) == DARKNESS_NAMED and player:getVar("PromathiaStatus") == 2) then
            player:addTitle(TRANSIENT_DREAMER);
            player:setVar("PromathiaStatus",3);
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,0);
        else
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,1,0); 
        end
    elseif (leavecode == 4) then
        player:startEvent(32002);
    end
end;

function onEventUpdate(player,csid,option)
end;
        
function onEventFinish(player,csid,option)
end;    
