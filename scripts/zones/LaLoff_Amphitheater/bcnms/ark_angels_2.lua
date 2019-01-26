-----------------------------------
-- Area: LaLoff Amphitheater
-- Name: Ark Angels 2 (Tarutaru)
-----------------------------------
local ID = require("scripts/zones/LaLoff_Amphitheater/IDs");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
-----------------------------------

-- Death cutscenes:

-- player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,0); -- Hume
-- player:startEvent(32001,1,1,1,instance:getTimeInside(),1,1,0); -- taru
-- player:startEvent(32001,1,1,1,instance:getTimeInside(),1,2,0); -- mithra
-- player:startEvent(32001,1,1,1,instance:getTimeInside(),1,3,0); -- elvan
-- player:startEvent(32001,1,1,1,instance:getTimeInside(),1,4,0); -- galka
-- player:startEvent(32001,1,1,1,instance:getTimeInside(),1,5,0); -- divine might
-- player:startEvent(32001,1,1,1,instance:getTimeInside(),1,6,0); -- skip ending cs


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
    --print("leave code "..leavecode);

    if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
        local record = instance:getRecord();
        local clearTime = record.clearTime;

        if (player:hasCompletedMission(ZILART,ARK_ANGELS)) then
            player:startEvent(32001,instance:getEntrance(),clearTime,1,instance:getTimeInside(),180,1,1);        -- winning CS (allow player to skip)
        else
            player:startEvent(32001,instance:getEntrance(),clearTime,1,instance:getTimeInside(),180,1,0);        -- winning CS (allow player to skip)
        end
        
    elseif (leavecode == 4) then
        player:startEvent(32002, 0, 0, 0, 0, 0, instance:getEntrance(), 180);    -- player lost
    end
end;

function onEventUpdate(player,csid,option)
    -- print("bc update csid "..csid.." and option "..option);

end;

function onEventFinish(player,csid,option)
    -- print("bc finish csid "..csid.." and option "..option);

    local AAKeyitems = (player:hasKeyItem(dsp.ki.SHARD_OF_APATHY) and player:hasKeyItem(dsp.ki.SHARD_OF_ARROGANCE)
        and player:hasKeyItem(dsp.ki.SHARD_OF_ENVY) and player:hasKeyItem(dsp.ki.SHARD_OF_RAGE));

    if (csid == 32001) then
        if (player:getCurrentMission(ZILART) == ARK_ANGELS  and player:getVar("ZilartStatus") == 1) then
            player:addKeyItem(dsp.ki.SHARD_OF_COWARDICE);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SHARD_OF_COWARDICE);
            if (AAKeyitems == true) then
                player:completeMission(ZILART,ARK_ANGELS);
                player:addMission(ZILART,THE_SEALED_SHRINE);
                player:setVar("ZilartStatus",0);
            end
        end
    end
end;