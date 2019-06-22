-----------------------------------
-- Area: Bostaunieux Obliette
--  NPC: Novalmauge
-- Starts and Finishes Quest: The Rumor, Souls in Shadow
-- Involved in Quest: The Holy Crest, Trouble at the Sluice
-- !pos 70 -24 21 167
-----------------------------------
local ID = require("scripts/zones/Bostaunieux_Oubliette/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/pathfind")
require("scripts/globals/wsquest")
require("scripts/globals/quests")
-----------------------------------

local path =
{
    41.169430, -24.000000, 19.860674,
    42.256676, -24.000000, 19.885197,
    41.168694, -24.000000, 19.904638,
    21.859211, -24.010996, 19.792259,
    51.917370, -23.924366, 19.970068,
    74.570229, -24.024828, 20.103880,
    44.533886, -23.947662, 19.926519
}

local wsQuest = dsp.wsquest.spiral_hell

function onSpawn(npc)
    npc:initNpcAi()
    npc:setPos(dsp.path.first(path))
    onPath(npc)
end

function onPath(npc)
    dsp.path.patrol(npc, path)
end

function onTrade(player, npc, trade)
    local wsQuestEvent = dsp.wsquest.getTradeEvent(wsQuest, player, trade)

    if player:getVar("troubleAtTheSluiceVar") == 2 and npcUtil.tradeHas(trade, 959) then -- Dahlia
        player:startEvent(17)
        npc:wait()
    elseif player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.THE_RUMOR) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 930) then -- Beastman Blood
        player:startEvent(12)
        npc:wait()
    elseif wsQuestEvent ~= nil then
        player:startEvent(wsQuestEvent)
        npc:wait()
    end
end

function onTrigger(player, npc)
    local wsQuestEvent = dsp.wsquest.getTriggerEvent(wsQuest, player)
    local troubleAtTheSluice = player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.TROUBLE_AT_THE_SLUICE)
    local troubleAtTheSluiceStat = player:getVar("troubleAtTheSluiceVar")
    local theHolyCrestStat = player:getVar("TheHolyCrest_Event")
    local theRumor = player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.THE_RUMOR)

    npc:wait()

    if wsQuestEvent ~= nil then
        player:startEvent(wsQuestEvent)

    -- THE HOLY CREST
    elseif theHolyCrestStat == 1 then
        player:startEvent(6)
    elseif theHolyCrestStat == 2 and player:getVar("theHolyCrestCheck") == 0 then
        player:startEvent(7)

    -- TROUBLE AT THE SLUICE
    elseif troubleAtTheSluiceStat == 1 then
        player:startEvent(15)
    elseif troubleAtTheSluiceStat == 2 then
        player:startEvent(16)

    -- THE RUMOR
    elseif theRumor == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 3 and player:getMainLvl() >= 10 then
        player:startEvent(13)
    elseif theRumor == QUEST_ACCEPTED then
        player:startEvent(11)
    elseif theRumor == QUEST_COMPLETED then
        player:startEvent(14) -- Standard dialog after "The Rumor"
    else
        player:startEvent(10) -- Standard dialog
    end
end

function onEventFinish(player, csid, option, npc)
    if csid == 6 then
        player:setVar("TheHolyCrest_Event", 2)
    elseif csid == 7 then
        player:setVar("theHolyCrestCheck", 1)
    elseif csid == 12 and npcUtil.completeQuest(player, SANDORIA, dsp.quest.id.sandoria.THE_RUMOR, {item = 4853}) then
        player:confirmTrade()
    elseif csid == 13 and option == 1 then
        player:addQuest(SANDORIA, dsp.quest.id.sandoria.THE_RUMOR)
    elseif csid == 14 then
        player:setVar("theHolyCrestCheck", 0)
    elseif csid == 15 then
        player:setVar("troubleAtTheSluiceVar", 2)
    elseif csid == 17 then
        npcUtil.giveKeyItem(player, dsp.ki.NEUTRALIZER)
        player:setVar("troubleAtTheSluiceVar", 0)
        player:setVar("theHolyCrestCheck", 0)
        player:confirmTrade()
    else
        dsp.wsquest.handleEventFinish(wsQuest, player, csid, option, ID.text.SPIRAL_HELL_LEARNED)
    end

    npc:wait(0)
end