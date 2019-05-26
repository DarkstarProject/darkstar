-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Door Acolyte hostel
-- Type: Quest NPC
-- !pos  146.619,-8.525,242.874 94
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters_[S]/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/settings")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local sayItWithAHandbag = player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.SAY_IT_WITH_A_HANDBAG)
    local sayItWithAHandbagCS = player:getVar("sayItWithAHandbagCS")
    if sayItWithAHandbag == QUEST_ACCEPTED and sayItWithAHandbagCS == 0 then
        player:startEvent(171)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 171 and option == 1 then
        player:setVar("sayItWithAHandbagCS", 1)
    end
    if csid == 171 and option == 0 then
        -- bug: quest music continues (doesn't affect quest line)
    end
end