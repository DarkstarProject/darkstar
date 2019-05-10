-----------------------------------
-- Area: Balga's Dais
-- Name: Shattering stars - Maat Fight
-- !pos 299 -123 345 146
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
local ID = require("scripts/zones/Balgas_Dais/IDs");

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
        player:startEvent(32001,1,1,1,instance:getTimeInside(),1,1,0);
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
        if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.SHATTERING_STARS) == QUEST_ACCEPTED and player:getFreeSlotsCount() > 0) then
            player:addItem(4181);
            player:messageSpecial(ID.text.ITEM_OBTAINED,4181);
        end
        local pjob = player:getMainJob();
        player:setVar("maatDefeated",pjob);
        local maatsCap = player:getVar("maatsCap")
        if (bit.band(maatsCap, bit.lshift(1, (pjob -1))) ~= 1) then
            player:setVar("maatsCap",bit.bor(maatsCap, bit.lshift(1, (pjob -1))))
        end
        player:addTitle(dsp.title.MAAT_MASHER);
    end

end;