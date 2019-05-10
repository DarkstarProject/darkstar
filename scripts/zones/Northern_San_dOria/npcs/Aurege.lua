-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Aurege
-- Type: Quest Giver NPC
-- Starts Quest: Exit the Gambler
-- !pos -156.253 11.999 253.691 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

function onTrade(player, npc, trade)
    if player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(ID.text.FLYER_REFUSED)
    end
end

function onTrigger(player, npc)
    local exitTheGambler = player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.EXIT_THE_GAMBLER)
    local exitTheGamblerStat = player:getVar("exitTheGamblerStat")

    if player:getVar("thePickpocket") == 1 and not player:getMaskBit(player:getVar("thePickpocketSkipNPC"), 2) then
        player:showText(npc, ID.text.PICKPOCKET_AUREGE)
        player:setMaskBit(player:getVar("thePickpocketSkipNPC"), "thePickpocketSkipNPC", 2, true)
    elseif exitTheGambler < QUEST_COMPLETED and exitTheGamblerStat == 0 then
        player:startEvent(521)
    elseif exitTheGambler == QUEST_ACCEPTED and exitTheGamblerStat == 1 then
        player:startEvent(516)
    else
        player:startEvent(514)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 521 and player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.EXIT_THE_GAMBLER) == QUEST_AVAILABLE then
        player:addQuest(SANDORIA, dsp.quest.id.sandoria.EXIT_THE_GAMBLER)
    elseif csid == 516 then
        npcUtil.completeQuest(player, SANDORIA, dsp.quest.id.sandoria.EXIT_THE_GAMBLER, {ki = dsp.ki.MAP_OF_KING_RANPERRES_TOMB, title = dsp.title.DAYBREAK_GAMBLER, xp = 2000})
    end
end