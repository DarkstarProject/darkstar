-----------------------------------
-- Area: Cloister of Flames
-- BCNM: Trial-size Trial by Fire
-- @pos -721 0 -598 207
-----------------------------------
package.loaded["scripts/zones/Cloister_of_Flames/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Cloister_of_Flames/TextIDs");

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
        player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,0);
    elseif (leavecode == 4) then
        player:setVar("TrialSizeFire_date",tonumber(os.date("%j"))); -- If you loose, you need to wait 1 real day
        player:startEvent(0x7d02);
    end
    
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;
    
function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);
    
    if (csid == 0x7d01) then
        if (player:hasSpell(298) == false) then
        player:addSpell(298); -- Ifrit
        player:messageSpecial(IFRIT_UNLOCKED,0,0,0);
        end
        if (player:hasItem(4181) == false) then
            player:addItem(4181);
            player:messageSpecial(ITEM_OBTAINED,4181); -- Scroll of instant warp
        end
        player:setVar("TrialSizeFire_date", 0);
        player:addFame(KAZHAM,30);
        player:completeQuest(OUTLANDS,TRIAL_SIZE_TRIAL_BY_FIRE);
    end
    
end;