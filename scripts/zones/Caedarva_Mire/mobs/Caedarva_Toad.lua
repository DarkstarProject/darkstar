-----------------------------------
-- Area: Caedarva Mire
--  Mob: Caedarva Toad
-- Involved in Quest: The Wayward Automation
-----------------------------------
require("scripts/globals/quests");

function onMobDeath(mob, player, isKiller)

    local TheWaywardAutomation = player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.THE_WAYWARD_AUTOMATION);
    local TheWaywardAutomationProgress = player:getVar("TheWaywardAutomationProgress");

    if (TheWaywardAutomation == QUEST_ACCEPTED and TheWaywardAutomationProgress == 2 and player:getVar("TheWaywardAutomationNM") == 0) then
        player:setVar("TheWaywardAutomationNM",1);
    end
end;
