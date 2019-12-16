-----------------------------------
-- Area: Port San d'Oria
--  NPC: Sheridan
-- Involved in Quests: Riding on the Clouds
-- !pos -19 -8 -129 232
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
    if player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(ID.text.FLYER_REFUSED)

    elseif player:getQuestStatus(JEUNO, dsp.quest.id.jeuno.RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getCharVar("ridingOnTheClouds_1") == 5 and npcUtil.tradeHas(trade, 1127) then
        player:setCharVar("ridingOnTheClouds_1", 0)
        npcUtil.giveKeyItem(player, dsp.ki.SCOWLING_STONE)
        player:confirmTrade()
    end
end

function onTrigger(player, npc)
    if player:getCharVar("thePickpocket") == 1 then
        player:showText(npc, ID.text.PICKPOCKET_SHERIDAN)
    else
        player:startEvent(572)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end