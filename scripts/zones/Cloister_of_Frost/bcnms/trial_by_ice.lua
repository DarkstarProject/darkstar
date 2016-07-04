-----------------------------------
-- Area: Cloister of Frost
-- BCNM: Trial by Ice
-- @pos 558 0.1 596 203
-----------------------------------
package.loaded["scripts/zones/Cloister_of_Frost/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/zones/Cloister_of_Frost/TextIDs");

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
        if (player:hasCompleteQuest(SANDORIA,TRIAL_BY_ICE)) then
            player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,1);
        else
            player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,0);
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
    
    if (csid == 0x7d01) then
        player:delKeyItem(TUNING_FORK_OF_ICE);
        player:addKeyItem(WHISPER_OF_FROST);
        player:addTitle(HEIR_OF_THE_GREAT_ICE);
        player:messageSpecial(KEYITEM_OBTAINED,WHISPER_OF_FROST);
    end
    
end;