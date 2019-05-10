-----------------------------------
-- Area: Cloister of Tides
-- BCNM: Trial by Water
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
local ID = require("scripts/zones/Cloister_of_Tides/IDs");

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
    trialLightning = player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_WATER)
    
    if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
        player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,0);
    elseif (leavecode == 4) then
        player:setVar("TrialSizeWater_date",tonumber(os.date("%j"))); -- If you loose, you need to wait 1 real day
        player:startEvent(32002);
    end
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;
        
function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);

    if (csid == 32001) then
        if (player:hasSpell(300) == false) then
        player:addSpell(300); -- Leviathan
        player:messageSpecial(ID.text.LEVIATHAN_UNLOCKED,0,0,2);
        end
        if (player:hasItem(4181) == false) then
            player:addItem(4181);
            player:messageSpecial(ID.text.ITEM_OBTAINED,4181); -- Scroll of instant warp
        end
        player:setVar("TrialSizeWater_date", 0);
        player:addFame(NORG,30);
        player:completeQuest(OUTLANDS,dsp.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_WATER);
    end
end;
