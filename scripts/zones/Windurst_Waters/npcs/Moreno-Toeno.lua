-----------------------------------
-- Area: Windurst Waters
--  NPC: Moreno-Toeno
-- Starts and Finishes Quest: Teacher's Pet
-- !pos
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters/IDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(WINDURST,dsp.quest.id.windurst.TEACHER_S_PET) >= 1 and trade:hasItemQty(847,1) == true and trade:hasItemQty(4368,1) == true and trade:getGil() == 0 and trade:getItemCount() == 2) then
        player:startEvent(440,250,847,4368); -- -- Quest Finish
    end
end;

function onTrigger(player,npc)

    local teacherstatus = player:getQuestStatus(WINDURST,dsp.quest.id.windurst.TEACHER_S_PET);

    if (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.VAIN and player:getVar("MissionStatus") == 0) then
        player:startEvent(752,0,dsp.ki.STAR_SEEKER);
    elseif (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.VAIN and player:getVar("MissionStatus") >= 1) then
        if (player:getVar("MissionStatus") < 4) then
            player:startEvent(753);
        elseif (player:getVar("MissionStatus") == 4) then
            player:startEvent(758);
        end
    elseif (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.A_TESTING_TIME) then
        local MissionStatus = player:getVar("MissionStatus");
        local alreadyCompleted = player:hasCompletedMission(WINDURST,dsp.mission.id.windurst.A_TESTING_TIME);
        if (MissionStatus == 0) then
            if (alreadyCompleted == false) then
                player:startEvent(182); -- First start at tahrongi
            else
                player:startEvent(687); -- Repeat at buburimu
            end
        elseif (MissionStatus == 1) then
            start_time = player:getVar("testingTime_start_time");
            seconds_passed = os.time() - start_time;

            -- one Vana'diel Day is 3456 seconds (2 day for repeat)
            if ((alreadyCompleted == false and seconds_passed > 3456) or (alreadyCompleted and seconds_passed > 6912)) then
                player:startEvent(202);
            -- are we in the last game hour of the Vana'diel Day?
            elseif (alreadyCompleted == false and seconds_passed >= 3312) then
                killcount = player:getVar("testingTime_crea_count");
                if (killcount >= 35) then
                    event = 201;
                elseif (killcount >= 30) then
                    event = 200;
                elseif (killcount >= 19) then
                    event = 199;
                else
                    event = 198;
                end;
                player:startEvent(event,0,VanadielHour(),1,killcount);
            -- are we in the last game hour of the Vana'diel Day? REPEAT
            elseif (alreadyCompleted and seconds_passed >= 6768) then
                killcount = player:getVar("testingTime_crea_count");
                if (killcount >= 35) then
                    event = 206;
                elseif (killcount >= 30) then
                    event = 209;
                else
                    event = 208;
                end;
                player:startEvent(event,0,VanadielHour(),1,killcount);
            else
                start_day = player:getVar("testingTime_start_day");
                start_hour = player:getVar("testingTime_start_hour");
                if (VanadielDayOfTheYear() == start_day) then
                    hours_passed = VanadielHour() - start_hour;
                elseif (VanadielDayOfTheYear() == start_day + 1) then
                    hours_passed = VanadielHour() - start_hour + 24;
                else
                    if (alreadyCompleted) then hours_passed = (24 - start_hour) + VanadielHour() + 24;
                    else hours_passed = (24 - start_hour) + VanadielHour(); end
                end;
                if (alreadyCompleted) then
                    player:startEvent(204,0,0,0,0,0,VanadielHour(),48 - hours_passed,0);
                else
                    player:startEvent(183,0,VanadielHour(),24 - hours_passed);
                end;

            end;
        end
    elseif (teacherstatus == QUEST_AVAILABLE) then
        prog = player:getVar("QuestTeachersPet_prog")
        if (prog == 0) then
            player:startEvent(437); -- Before Quest
            player:setVar("QuestTeachersPet_prog",1);
        elseif (prog == 1) then
            player:startEvent(438,0,847,4368); -- Quest Start
        end
    elseif (teacherstatus == QUEST_ACCEPTED) then
        player:startEvent(439,0,847,4368); -- Quest Reminder
    elseif (player:getQuestStatus(WINDURST,dsp.quest.id.windurst.MAKING_THE_GRADE) == QUEST_ACCEPTED) then
        player:startEvent(444); -- During Making the GRADE
    else   --  Will run through these iffame is not high enough for other quests
        rand = math.random(1,2);
        if (rand == 1) then
            player:startEvent(441); -- Standard Conversation 1
        else
            player:startEvent(469); -- Standard Conversation 2
        end
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 438 and option == 0) then
        player:addQuest(WINDURST,dsp.quest.id.windurst.TEACHER_S_PET);
    elseif (csid == 438 and option == 1) then
        player:setVar("QuestTeachersPet_prog",0);
    elseif (csid == 440) then
        player:addGil(GIL_RATE*250);
        player:setVar("QuestTeachersPet_prog",0);
        player:tradeComplete(trade);
        if (player:getQuestStatus(WINDURST,dsp.quest.id.windurst.TEACHER_S_PET) == QUEST_ACCEPTED) then
            player:completeQuest(WINDURST,dsp.quest.id.windurst.TEACHER_S_PET);
            player:addFame(WINDURST,75);
        else
            player:addFame(WINDURST,8);
        end
    elseif (csid == 182 or csid == 687) and option ~= 1 then -- start
        player:addKeyItem(dsp.ki.CREATURE_COUNTER_MAGIC_DOLL);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.CREATURE_COUNTER_MAGIC_DOLL);
        player:setVar("MissionStatus",1);
        player:setVar("testingTime_start_day",VanadielDayOfTheYear());
        player:setVar("testingTime_start_hour",VanadielHour());
        player:setVar("testingTime_start_time",os.time());
    elseif (csid == 198 or csid == 199 or csid == 202 or csid == 208) then -- failed testing time
        player:delKeyItem(dsp.ki.CREATURE_COUNTER_MAGIC_DOLL);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED + 1,dsp.ki.CREATURE_COUNTER_MAGIC_DOLL);
        player:setVar("MissionStatus",0);
        player:setVar("testingTime_crea_count",0);
        player:setVar("testingTime_start_day",0);
        player:setVar("testingTime_start_hour",0);
        player:setVar("testingTime_start_time",0);
        player:delMission(WINDURST,dsp.mission.id.windurst.A_TESTING_TIME);
    elseif (csid == 200 or csid == 201) then -- first time win
        finishMissionTimeline(player,1,csid,option);

        player:setVar("testingTime_crea_count",0);
        player:setVar("testingTime_start_day",0);
        player:setVar("testingTime_start_hour",0);
        player:setVar("testingTime_start_time",0);
    elseif (csid == 209 or csid == 206) then -- succesfull repeat attempt (Buburimu).
        finishMissionTimeline(player,1,csid,option);

        player:setVar("testingTime_crea_count",0);
        player:setVar("testingTime_start_day",0);
        player:setVar("testingTime_start_hour",0);
        player:setVar("testingTime_start_time",0);
    elseif (csid == 752) then
        player:setVar("MissionStatus",1);
        player:addKeyItem(dsp.ki.STAR_SEEKER);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.STAR_SEEKER);
        player:addTitle(dsp.title.FUGITIVE_MINISTER_BOUNTY_HUNTER);

    elseif (csid == 758) then
        finishMissionTimeline(player,3,csid,option);
    end
end;
