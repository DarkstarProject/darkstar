-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Rodaillece
-- !pos -246.943 7.000 46.836 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
    if player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(ID.text.FLYER_REFUSED)
    end
end

function onTrigger(player, npc)
    if player:getVar("thePickpocket") == 1 and not player:getMaskBit(player:getVar("thePickpocketSkipNPC"), 3) then
        player:showText(npc, ID.text.PICKPOCKET_RODAILLECE)
        player:setMaskBit(player:getVar("thePickpocketSkipNPC"), "thePickpocketSkipNPC", 3, true)
    else
        player:showText(npc, ID.text.RODAILLECE_DIALOG)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
