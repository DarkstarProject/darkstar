-----------------------------------
-- Area: Cloister of Frost
-- BCNM: Trial by Ice
-- !pos 558 0.1 596 203
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");
local ID = require("scripts/zones/Cloister_of_Frost/IDs");

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
        if (player:hasCompletedQuest(SANDORIA,dsp.quest.id.sandoria.TRIAL_BY_ICE)) then
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,1);
        else
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,0);
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
        player:delKeyItem(dsp.ki.TUNING_FORK_OF_ICE);
        player:addKeyItem(dsp.ki.WHISPER_OF_FROST);
        player:addTitle(dsp.title.HEIR_OF_THE_GREAT_ICE);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.WHISPER_OF_FROST);
    end

end;