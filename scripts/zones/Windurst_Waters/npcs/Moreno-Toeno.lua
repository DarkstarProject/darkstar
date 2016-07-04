-----------------------------------
-- Area: Windurst Waters
--  NPC: Moreno-Toeno
-- Starts and Finishes Quest: Teacher's Pet
--  @pos  
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(WINDURST,TEACHER_S_PET) >= 1 and trade:hasItemQty(847,1) == true and trade:hasItemQty(4368,1) == true and trade:getGil() == 0 and trade:getItemCount() == 2) then
        player:startEvent(0x01b8,250,847,4368); -- -- Quest Finish
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    teacherstatus = player:getQuestStatus(WINDURST,TEACHER_S_PET);
    
    if (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") == 0) then
        player:startEvent(0x02F0,0,STAR_SEEKER);
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") >= 1) then
        if (player:getVar("MissionStatus") < 4) then
            player:startEvent(0x02F1);
        elseif (player:getVar("MissionStatus") == 4) then
            player:startEvent(0x02F6);
        end
    elseif (player:getCurrentMission(WINDURST) == A_TESTING_TIME) then
        MissionStatus = player:getVar("MissionStatus");
        alreadyCompleted = player:hasCompletedMission(WINDURST,A_TESTING_TIME);
        if (MissionStatus == 0) then
            if (alreadyCompleted == false) then
                player:startEvent(0x00B6); -- First start at tahrongi
            else
                player:startEvent(0x02AF); -- Repeat at buburimu
            end
        elseif (MissionStatus == 1) then
            start_time = player:getVar("testingTime_start_time");
            seconds_passed = os.time() - start_time;
            
            -- one Vana'diel Day is 3456 seconds (2 day for repeat)
            if ((alreadyCompleted == false and seconds_passed > 3456) or (alreadyCompleted and seconds_passed > 6912)) then
                player:startEvent(0x00CA);
            -- are we in the last game hour of the Vana'diel Day?
            elseif (alreadyCompleted == false and seconds_passed >= 3312) then 
                killcount = player:getVar("testingTime_crea_count");
                if (killcount >= 35) then
                    event = 0x00C9;
                elseif (killcount >= 30) then
                    event = 0x00C8;
                elseif (killcount >= 19) then
                    event = 0x00C7;
                else
                    event = 0x00C6;
                end;
                player:startEvent(event,0,VanadielHour(),1,killcount);
            -- are we in the last game hour of the Vana'diel Day? REPEAT
            elseif (alreadyCompleted and seconds_passed >= 6768) then
                killcount = player:getVar("testingTime_crea_count");
                if (killcount >= 35) then
                    event = 0x00CE;
                elseif (killcount >= 30) then
                    event = 0x00D1;
                else
                    event = 0x00D0;
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
                    player:startEvent(0x00CC,0,0,0,0,0,VanadielHour(),48 - hours_passed,0);
                else
                    player:startEvent(0x00B7,0,VanadielHour(),24 - hours_passed);
                end;
                
            end;
        end
    elseif (teacherstatus == QUEST_AVAILABLE) then
        prog = player:getVar("QuestTeachersPet_prog")
        if (prog == 0) then
            player:startEvent(0x01b5); -- Before Quest
            player:setVar("QuestTeachersPet_prog",1);
        elseif (prog == 1) then 
            player:startEvent(0x01b6,0,847,4368); -- Quest Start
        end
    elseif (teacherstatus == QUEST_ACCEPTED) then
        player:startEvent(0x01b7,0,847,4368); -- Quest Reminder
    elseif (player:getQuestStatus(WINDURST,MAKING_THE_GRADE) == QUEST_ACCEPTED) then
        player:startEvent(0x01bc); -- During Making the GRADE
    else   --  Will run through these iffame is not high enough for other quests
        rand = math.random(1,2);
        if (rand == 1) then
            player:startEvent(0x01b9); -- Standard Conversation 1
        else
            player:startEvent(0x01d5); -- Standard Conversation 2
        end
    end
    
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    
    if (csid == 0x01b6 and option == 0) then
        player:addQuest(WINDURST,TEACHER_S_PET);
    elseif (csid == 0x01b6 and option == 1) then
        player:setVar("QuestTeachersPet_prog",0);
    elseif (csid == 0x01b8) then
        player:addGil(GIL_RATE*250);
        player:setVar("QuestTeachersPet_prog",0);
        player:tradeComplete(trade);
        if (player:getQuestStatus(WINDURST,TEACHER_S_PET) == QUEST_ACCEPTED) then
            player:completeQuest(WINDURST,TEACHER_S_PET);
            player:addFame(WINDURST,75);
        else
            player:addFame(WINDURST,8);
        end
    elseif (csid == 0x00B6 or csid == 0x02AF) and option ~= 1 then -- start
        player:addKeyItem(CREATURE_COUNTER_MAGIC_DOLL);
        player:messageSpecial(KEYITEM_OBTAINED,CREATURE_COUNTER_MAGIC_DOLL);
        player:setVar("MissionStatus",1);
        player:setVar("testingTime_start_day",VanadielDayOfTheYear());
        player:setVar("testingTime_start_hour",VanadielHour());
        player:setVar("testingTime_start_time",os.time());
    elseif (csid == 0x00C6 or csid == 0x00C7 or csid == 0x00CA or csid == 0x00D0) then -- failed testing time
        player:delKeyItem(CREATURE_COUNTER_MAGIC_DOLL);
        player:messageSpecial(KEYITEM_OBTAINED + 1,CREATURE_COUNTER_MAGIC_DOLL);
        player:setVar("MissionStatus",0);
        player:setVar("testingTime_crea_count",0);
        player:setVar("testingTime_start_day",0);
        player:setVar("testingTime_start_hour",0);
        player:setVar("testingTime_start_time",0);
        player:delMission(WINDURST,A_TESTING_TIME);
    elseif (csid == 0x00C8 or csid == 0x00C9) then -- first time win
        finishMissionTimeline(player,1,csid,option);
        
        player:setVar("testingTime_crea_count",0);
        player:setVar("testingTime_start_day",0);
        player:setVar("testingTime_start_hour",0);
        player:setVar("testingTime_start_time",0);
    elseif (csid == 0x00D1 or csid == 0x00CE) then -- succesfull repeat attempt (Buburimu).
        finishMissionTimeline(player,1,csid,option);
        
        player:setVar("testingTime_crea_count",0);
        player:setVar("testingTime_start_day",0);
        player:setVar("testingTime_start_hour",0);
        player:setVar("testingTime_start_time",0);
    elseif (csid == 0x02F0) then
        player:setVar("MissionStatus",1);
        player:addKeyItem(STAR_SEEKER);
        player:messageSpecial(KEYITEM_OBTAINED,STAR_SEEKER);
        player:addTitle(FUGITIVE_MINISTER_BOUNTY_HUNTER);
        
    elseif (csid == 0x02F6) then
        finishMissionTimeline(player,3,csid,option);
    end
end;