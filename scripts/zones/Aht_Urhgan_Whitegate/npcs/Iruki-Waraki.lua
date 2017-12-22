-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Iruki-Waraki
--  Type: Standard NPC
--  Involved in quest: No Strings Attached
-- !pos 101.329 -6.999 -29.042 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/pets");


function onTrade(player,npc,trade)
end;


function onTrigger(player,npc)

    local NoStringsAttached = player:getQuestStatus(AHT_URHGAN,NO_STRINGS_ATTACHED);
    local NoStringsAttachedProgress = player:getVar("NoStringsAttachedProgress");
    local TheWaywardAutomation = player:getQuestStatus(AHT_URHGAN,THE_WAYWARD_AUTOMATION);
    local TheWaywardAutomationProgress = player:getVar("TheWaywardAutomationProgress");
    local LvL = player:getMainLvl();
    local Job = player:getMainJob();

    -- Quest: No Strings Attached
    if (NoStringsAttached == QUEST_ACCEPTED and NoStringsAttachedProgress == 1) then
        player:startEvent(260); -- he tells u to get him an automaton
    elseif (NoStringsAttached == QUEST_ACCEPTED and NoStringsAttachedProgress == 2) then
        player:startEvent(261); -- reminder to get an automaton
    elseif (NoStringsAttached == QUEST_ACCEPTED and NoStringsAttachedProgress == 6) then
        player:startEvent(266); -- you bring him the automaton
    elseif (Job == JOBS.PUP and LvL < AF1_QUEST_LEVEL and NoStringsAttached == QUEST_COMPLETED) then
        player:startEvent(267); -- asking you how are you doing with your automaton
    -- In case a player completed the quest before unlocking attachments was implemented (no harm in doing this repeatedly)
        player:unlockAttachment(8224); --Harlequin Frame
        player:unlockAttachment(8193); --Harlequin Head
    elseif (Job ~= JOBS.PUP and NoStringsAttached == QUEST_COMPLETED) then
        player:startEvent(267); -- asking you how are you doing with your automaton
    elseif (NoStringsAttached == QUEST_AVAILABLE) then
        player:startEvent(259); -- Leave him alone     

    --Quest: The Wayward Automation
    elseif (Job == JOBS.PUP and LvL >= AF1_QUEST_LEVEL and NoStringsAttached == QUEST_COMPLETED and TheWaywardAutomation == QUEST_AVAILABLE) then
        player:startEvent(774); -- he tells you to help find his auto
    elseif (TheWaywardAutomation == QUEST_ACCEPTED and TheWaywardAutomationProgress == 1) then
        player:startEvent(775); -- reminder about to head to Nashmau
    elseif (TheWaywardAutomation == QUEST_ACCEPTED and TheWaywardAutomationProgress == 3) then 
        player:startEvent(776); -- tell him you found automation
    elseif (TheWaywardAutomation == QUEST_COMPLETED) then
        player:startEvent(777);
    end
end;


function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;


function onEventFinish(player,csid,option)
 --printf("CSID: %u",csid);
 --printf("RESULT: %u",option);

    if (csid == 260) then
        player:setVar("NoStringsAttachedProgress",2);
    elseif (csid == 266) then
        if (player:getFreeSlotsCount() ~= 0) then
            player:completeQuest(AHT_URHGAN,NO_STRINGS_ATTACHED);
            player:addTitle(PROUD_AUTOMATON_OWNER);
            player:unlockJob(JOBS.PUP);
            player:addItem(17859);
            player:messageSpecial(ITEM_OBTAINED,17859); -- animator
            player:messageSpecial(YOU_CAN_BECOME_PUP); -- "You can now become a puppetmaster." 
            player:setVar("NoStringsAttachedProgress",0);
            player:setPetName(PETTYPE_AUTOMATON, option+118);
            player:unlockAttachment(8224); --Harlequin Frame
            player:unlockAttachment(8193); --Harlequin Head
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17859);
        end
    elseif (csid == 774) then
        player:setVar("TheWaywardAutomationProgress",1);
        player:addQuest(AHT_URHGAN,THE_WAYWARD_AUTOMATION);
    elseif (csid == 776) then
        if (player:getFreeSlotsCount() ~= 0) then
            player:completeQuest(AHT_URHGAN,THE_WAYWARD_AUTOMATION);
            player:addItem(17858); --Turbo Animator
            player:messageSpecial(ITEM_OBTAINED,17858); -- Turbo Animator
            player:setVar("TheWaywardAutomationProgress",0);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17858);
        end
    end
end;

