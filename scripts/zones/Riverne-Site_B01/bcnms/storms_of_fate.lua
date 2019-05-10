-----------------------------------
-- Area: Riverne Site #B01
-- Name: Storms of Fate
-- !pos 299 -123 345 146
-----------------------------------

require("scripts/globals/missions");
local ID = require("scripts/zones/Riverne-Site_B01/IDs");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/bcnm");
-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
    player:delStatusEffect(dsp.effect.LEVEL_RESTRICTION); -- can't be capped at 50 for this fight !
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
        if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.STORMS_OF_FATE) == QUEST_COMPLETED) then
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,1);
        else
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,0);
        end
    elseif (leavecode == 4) then
        player:startEvent(32002);
    end

    if (ENABLE_COP_ZONE_CAP == 1) then -- restore level cap on exit if the setting is enabled
        player:addStatusEffect(dsp.effect.LEVEL_RESTRICTION, 50, 0, 0);
    end;
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;

function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);

    if (csid == 32001) then
        if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.STORMS_OF_FATE) == QUEST_ACCEPTED and player:getVar('StormsOfFate') == 2) then
            player:addKeyItem(dsp.ki.WHISPER_OF_THE_WYRMKING);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.WHISPER_OF_THE_WYRMKING);
            player:setVar('StormsOfFate',3);
            player:addTitle(dsp.title.CONQUEROR_OF_FATE);
            if (ENABLE_COP_ZONE_CAP == 1) then -- restore level cap on exit if the setting is enabled
                player:addStatusEffect(dsp.effect.LEVEL_RESTRICTION, 50, 0, 0);
            end;
        end
    end

end;