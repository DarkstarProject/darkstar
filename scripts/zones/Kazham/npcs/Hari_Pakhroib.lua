-----------------------------------
-- Area: Kazham
--  NPC: Hari Pakhroib
-- Starts and Finishes Quest: Greetings to the Guardian
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/zones/Kazham/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    Guardian = player:getQuestStatus(OUTLANDS,GREETINGS_TO_THE_GUARDIAN);
    Pamamas = player:getVar("PamamaVar");
    pfame = player:getFameLevel(KAZHAM)
    needToZone = player:needToZone();

    if (Guardian == QUEST_ACCEPTED) then
        if (Pamamas == 1) then
            player:startEvent(71); --Finish Quest
        else
            player:startEvent(69,0,4596); --Reminder Dialogue
        end
    elseif (Guardian == QUEST_AVAILABLE and pfame >= 7) then
        player:startEvent(68,4596,4596,4596); --Start Quest
    elseif (Guardian == QUEST_COMPLETED and needToZone == false) then
        if (Pamamas == 2) then
            player:startEvent(71); --Finish quest dialogue (no different csid between initial and repeats)
        else
            player:startEvent(72); --Dialogue for after completion of quest
        end
    elseif (Guardian == QUEST_COMPLETED and needToZone == true) then
        player:startEvent(72);
    else
        player:startEvent(84); --Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 68 and option == 1) then
        player:addQuest(OUTLANDS,GREETINGS_TO_THE_GUARDIAN);
        player:setVar("PamamaVar",0);
    elseif (csid == 71) then
        if (Pamamas == 1) then --First completion of quest; set title, complete quest, and give higher fame
            player:addGil(GIL_RATE*5000);
            player:messageSpecial(GIL_OBTAINED, 5000);
            player:completeQuest(OUTLANDS,GREETINGS_TO_THE_GUARDIAN);
            player:addFame(WINDURST,100);
            player:addTitle(KAZHAM_CALLER);
            player:setVar("PamamaVar",0);
            player:needToZone(true);
        elseif (Pamamas == 2) then --Repeats of quest; give only gil and less fame
            player:addGil(GIL_RATE*5000);
            player:messageSpecial(GIL_OBTAINED, 5000);
            player:addFame(WINDURST,30);
            player:setVar("PamamaVar",0);
            player:needToZone(true);
        end
    end
end;



