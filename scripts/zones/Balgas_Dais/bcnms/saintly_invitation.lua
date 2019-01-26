-----------------------------------
-- Area: Horlais Peak
-- Name: Saintly Invitation
-- !pos 299 -123 345 146
-----------------------------------

require("scripts/globals/keyitems");
local ID = require("scripts/zones/Balgas_Dais/IDs");
require("scripts/globals/missions");

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

    if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
        if (player:hasCompletedMission(WINDURST,SAINTLY_INVITATION)) then
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,3,1);
        else
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,3,0);
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
        if (player:getCurrentMission(WINDURST) == SAINTLY_INVITATION) then
            player:addTitle(dsp.title.VICTOR_OF_THE_BALGA_CONTEST);
            player:addKeyItem(dsp.ki.BALGA_CHAMPION_CERTIFICATE);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.BALGA_CHAMPION_CERTIFICATE);
            player:setVar("MissionStatus",2);
        end
    end

end;