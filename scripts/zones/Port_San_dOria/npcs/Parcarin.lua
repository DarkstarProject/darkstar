-----------------------------------
-- Area: Port San d'Oria
--  NPC: Parcarin
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- !pos -9 -13 -151 232
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
    if player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(ID.text.FLYER_REFUSED)
    end
end

function onTrigger(player, npc)
    if player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and not player:getMaskBit(player:getVar("WildcatSandy"), 13) then
        player:startEvent(747)
    elseif player:getVar("thePickpocket") == 1 then
        player:showText(npc, ID.text.PICKPOCKET_PARCARIN)
    else
        player:startEvent(566)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 747 then
        player:setMaskBit(player:getVar("WildcatSandy"), "WildcatSandy", 13, true)
    end
end