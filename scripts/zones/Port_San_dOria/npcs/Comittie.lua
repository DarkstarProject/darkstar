-----------------------------------
-- Area: Port San d'Oria
--  NPC: Comittie
-- !pos -6.570 -9.8 -147.952 232
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
    if player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(ID.text.FLYER_REFUSED)
    end
end

function onTrigger(player, npc)
    if player:getVar("thePickpocket") == 1 and not player:getMaskBit(player:getVar("thePickpocketSkipNPC"), 1) then
        player:showText(npc, ID.text.PICKPOCKET_COMITTIE)
        player:setMaskBit(player:getVar("thePickpocketSkipNPC"), "thePickpocketSkipNPC", 1, true)
    else
        player:showText(npc, ID.text.ITEM_DELIVERY_DIALOG)
        player:openSendBox()
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
