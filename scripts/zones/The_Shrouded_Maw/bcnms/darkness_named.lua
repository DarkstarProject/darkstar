-----------------------------------
-- Area: The_Shrouded_Maw
-- Name: darkness_named
-----------------------------------
package.loaded["scripts/zones/The_Shrouded_Maw/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/zones/The_Shrouded_Maw/TextIDs");
require("scripts/globals/missions");

-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)

    local inst = player:getBattlefieldID();

    if (inst == 1) then
    
        local TileOffset = 16818258;
        
        for i = TileOffset, TileOffset+7 do 
            local TileOffsetA = GetNPCByID(i):getAnimation();                
            if (TileOffsetA == 8) then
                GetNPCByID(i):setAnimation(9);
            end
        end

    elseif (inst == 2) then
    
        local TileOffset = 16818266;
        
        for i = TileOffset, TileOffset+7 do 
            local TileOffsetA = GetNPCByID(i):getAnimation();                
            if (TileOffsetA == 8) then
                GetNPCByID(i):setAnimation(9);
            end
        end
        
    elseif (inst == 3) then
    
        local TileOffset = 16818274;
        
        for i = TileOffset, TileOffset+7 do 
            local TileOffsetA = GetNPCByID(i):getAnimation();                
            if (TileOffsetA == 8) then
                GetNPCByID(i):setAnimation(9);
            end
        end
        
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
-- print("leave code "..leavecode);
    
    if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
        player:addExp(1000);
        if (player:getCurrentMission(COP) == DARKNESS_NAMED  and  player:getVar("PromathiaStatus") == 2) then
            player:addTitle(TRANSIENT_DREAMER);
            player:setVar("PromathiaStatus",3);
            player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,0);
        else
            player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,1,0); 
        end
    elseif (leavecode == 4) then
        player:startEvent(0x7d02);
    end
    
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;
        
function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);
end;    
