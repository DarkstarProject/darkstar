-----------------------------------
-- Area: Inner Horutoto Ruins
--  NPC: Mahogany Door
-- Involved In Quest: Making Headlines
-- Involved in Mission 2-1
-- !pos -11 0 20 192
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local MakingHeadlines = player:getQuestStatus(WINDURST,dsp.quest.id.windurst.MAKING_HEADLINES);
    local CurrentMission = player:getCurrentMission(WINDURST)
    local MissionStatus = player:getCharVar("MissionStatus");

    -- Check for Missions first (priority?)
    -- We should allow both missions and quests to activate
    if (CurrentMission == dsp.mission.id.windurst.LOST_FOR_WORDS and MissionStatus == 4) then
        player:startEvent(46);
    elseif (MakingHeadlines == 1) then
        function testflag(set,flag)
            return (set % (2*flag) >= flag)
        end

        local prog = player:getCharVar("QuestMakingHeadlines_var");
        if (testflag(tonumber(prog),16) == false and testflag(tonumber(prog),8) == true) then
            player:messageSpecial(7208,1,dsp.ki.WINDURST_WOODS_SCOOP); -- Confirm Story
            player:setVar("QuestMakingHeadlines_var",prog+16);
        else
            player:startEvent(44); -- "The door is firmly shut"
        end
    else
        player:startEvent(44); -- "The door is firmly shut"
    end;

    return 1;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 46) then
        -- Mark the progress
        player:setVar("MissionStatus",5);
    end

end;