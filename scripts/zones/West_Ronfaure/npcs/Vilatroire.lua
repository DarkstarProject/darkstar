-----------------------------------
-- Area: West Ronfaure
--  NPC: Vilatroire
-- Involved in Quests: "Introduction To Teamwork", "Intermediate Teamwork",
-- "Advanced Teamwork"
-- !pos -260.361 -70.999 423.420 100
-----------------------------------
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    --player:startEvent(131) -- Same job
    --player:startEvent(133) -- Same race
    local intermedTmwrk = player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.INTRODUCTION_TO_TEAMWORK)
    local sFame = player:getFameLevel(SANDORIA)

    if intermedTmwrk == QUEST_AVAILABLE and sFame >= 2 then
        player:startEvent(135) -- Starts first quest - 6 members same alliance
    elseif intermedTmwrk == QUEST_ACCEPTED then
        player:startEvent(134) -- You don't have the requirements to finish
    else
        player:startEvent(136) -- Default - before quests
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
