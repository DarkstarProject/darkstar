-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Guilberdrier
-- Involved in Quests: Flyers for Regine, Exit the Gambler
-- !pos -159.082 12.000 253.794 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/settings")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
    if player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        if player:getCharVar("tradeGuilberdrier") == 0 then
            player:messageSpecial(ID.text.CAPIRIA_DIALOG) -- gave this NPC a generic response to flyer. I don't see a unique one in the extract. need retail capture.
            player:messageSpecial(ID.text.FLYER_ACCEPTED)
            player:messageSpecial(ID.text.FLYERS_HANDED, 17 - player:getCharVar("FFR"))
            player:addCharVar("FFR", -1);
            player:setCharVar("tradeGuilberdrier", 1)
            player:confirmTrade()
        elseif player:getCharVar("tradeGuilberdrier") == 1 then
            player:messageSpecial(ID.text.FLYER_ALREADY)
        end
    end
end

function onTrigger(player, npc)
    local exitTheGambler = player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.EXIT_THE_GAMBLER)
    local exitTheGamblerStat = player:getCharVar("exitTheGamblerStat")

    if player:getCharVar("thePickpocket") == 1 and not player:getMaskBit(player:getCharVar("thePickpocketSkipNPC"), 4) then
        player:showText(npc, ID.text.PICKPOCKET_GUILBERDRIER)
        player:setMaskBit(player:getCharVar("thePickpocketSkipNPC"), "thePickpocketSkipNPC", 4, true)
    elseif exitTheGambler < QUEST_COMPLETED and exitTheGamblerStat == 0 then
        player:startEvent(522)
    elseif exitTheGambler == QUEST_ACCEPTED and exitTheGamblerStat == 1 then
        player:startEvent(518)
    else
        player:startEvent(514)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 522 and player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.EXIT_THE_GAMBLER) == QUEST_AVAILABLE then
        player:addQuest(SANDORIA, dsp.quest.id.sandoria.EXIT_THE_GAMBLER)
    elseif csid == 518 then
        npcUtil.completeQuest(player, SANDORIA, dsp.quest.id.sandoria.EXIT_THE_GAMBLER, {ki = dsp.ki.MAP_OF_KING_RANPERRES_TOMB, title = dsp.title.DAYBREAK_GAMBLER, xp = 2000})
    end
end
