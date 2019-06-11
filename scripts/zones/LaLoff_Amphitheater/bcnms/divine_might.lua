-----------------------------------
-- Area: LaLoff Amphitheater
-- Name: Divine Might
-----------------------------------
require("scripts/globals/battlefield")
local ID = require("scripts/zones/LaLoff_Amphitheater/IDs");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
-----------------------------------

-- Death cutscenes:

-- player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0) -- Hume
-- player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0) -- taru
-- player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0) -- mithra
-- player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0) -- elvan
-- player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0) -- galka
-- player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0) -- divine might
-- player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0) -- skip ending cs


-- After registering the BCNM via bcnmRegister(bcnmid)
function onBattlefieldRegister(player,battlefield)
end;
function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBattlefieldEnter(player,battlefield)
    player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 1)
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBattlefieldLeave(player,battlefield,leavecode)
--print("leave code "..leavecode);

    if leavecode == dsp.battlefield.leaveCode.WON then -- play end CS. Need time and battle id for record keeping + storage
        local name, clearTime, partySize = battlefield:getRecord()
        local record = battlefield:getRecord();
        local clearTime = record.clearTime;

        if (player:hasCompletedMission(ZILART,dsp.mission.id.zilart.ARK_ANGELS)) then
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 180, battlefield:getLocalVar("[cs]bit"), 1)        -- winning CS (allow player to skip)
        else
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 180, battlefield:getLocalVar("[cs]bit"), 0)        -- winning CS (allow player to skip)
        end

    --[[ caps:
        7d01, 0, 529, 1, 950, 180, 6, 0, 0 --Neo AA HM
        7d01, 0, 1400, 5, 1400, 180, 11, 0, 0  --Neo DM
        7d01, 1, 405, 1, 1599, 180, 7, 0, 0 -- Neo AA TT
        7d01, 1, 378, 3, 903, 180, 8, 0, 0 -- Neo AA MR
        7d02, 0, 80, 1, 512, 4, 4, 180 -- Neo DM (lose)
    ]]

    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002, 0, 0, 0, 0, 0, battlefield:getArea(), 180);    -- player lost
    end
end;

function onEventUpdate(player,csid,option)
    -- print("bc update csid "..csid.." and option "..option);

end;

function onEventFinish(player,csid,option)
    -- print("bc finish csid "..csid.." and option "..option);

    if (csid == 32001) then
        if (player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.DIVINE_MIGHT) == QUEST_ACCEPTED) then
            player:setVar("DivineMight",2); -- Used to use 2 to track completion, so that's preserved to maintain compatibility
            for i=dsp.ki.SHARD_OF_APATHY, dsp.ki.SHARD_OF_RAGE do
                player:addKeyItem(i);
                player:messageSpecial(ID.text.KEYITEM_OBTAINED,i);
            end
            if (player:getCurrentMission(ZILART) == dsp.mission.id.zilart.ARK_ANGELS) then
                player:completeMission(ZILART,dsp.mission.id.zilart.ARK_ANGELS);
                player:addMission(ZILART,dsp.mission.id.zilart.THE_SEALED_SHRINE);
                player:setVar("ZilartStatus",0);
            end
        elseif (player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.DIVINE_MIGHT_REPEAT) == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.MOONLIGHT_ORE) == true) then
            player:setVar("DivineMight",2);
        end
    end
end;
