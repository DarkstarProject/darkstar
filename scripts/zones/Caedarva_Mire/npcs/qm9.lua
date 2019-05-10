-----------------------------------
-- Area: Caedarva Mire
--  NPC: qm9
-- Involved in quest: The Wayward Automation
-- !pos  129 1.396 -631 79
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local TheWaywardAutomation = player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.THE_WAYWARD_AUTOMATION);
    local TheWaywardAutomationProgress = player:getVar("TheWaywardAutomationProgress");

    if (TheWaywardAutomation == QUEST_ACCEPTED and TheWaywardAutomationProgress == 2) then
        if (player:getVar("TheWaywardAutomationNM") >= 1) then
            player:startEvent(14);-- Event ID 14 for CS after toad
        elseif (not GetMobByID(ID.mob.CAEDARVA_TOAD):isSpawned()) then
            SpawnMob(ID.mob.CAEDARVA_TOAD):updateClaim(player); --Caedarva toad
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 14) then
        player:setVar("TheWaywardAutomationProgress",3);
        player:setVar("TheWaywardAutomationNM",0);
    end
end;