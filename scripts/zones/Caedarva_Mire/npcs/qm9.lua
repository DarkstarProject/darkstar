-----------------------------------
-- Area: Caedarva Mire
--  NPC: qm9
-- Involved in quest: The Wayward Automation
-- !pos  129 1.396 -631 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Caedarva_Mire/TextIDs");
require("scripts/zones/Caedarva_Mire/MobIDs");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local TheWaywardAutomation = player:getQuestStatus(AHT_URHGAN,THE_WAYWARD_AUTOMATION);
    local TheWaywardAutomationProgress = player:getVar("TheWaywardAutomationProgress");

    if (TheWaywardAutomation == QUEST_ACCEPTED and TheWaywardAutomationProgress == 2) then
        if (player:getVar("TheWaywardAutomationNM") >= 1) then
            player:startEvent(14);-- Event ID 14 for CS after toad
        elseif (not GetMobByID(CAEDARVA_TOAD):isSpawned()) then
            SpawnMob(CAEDARVA_TOAD):updateClaim(player); --Caedarva toad
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 14) then
        player:setVar("TheWaywardAutomationProgress",3);
        player:setVar("TheWaywardAutomationNM",0);
    end
end;