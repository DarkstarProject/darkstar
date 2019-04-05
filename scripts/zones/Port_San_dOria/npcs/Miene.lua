-----------------------------------
-- Area: Port San d'Oria
--  NPC: Miene
-- NPC for Quest "The Pickpocket"
-- !pos 0.750 -4.000 -81.438 232
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

function onTrade(player, npc, trade)
    -- FLYERS FOR REGINE
    if player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        if player:getVar("tradeMiene") == 0 then
            player:messageSpecial(ID.text.MIENE_DIALOG)
            player:messageSpecial(ID.text.FLYER_ACCEPTED)
            player:messageSpecial(ID.text.FLYERS_HANDED, 17 - player:getVar("FFR"))
            player:addVar("FFR", -1)
            player:setVar("tradeMiene", 1)
            player:confirmTrade()
        elseif player:getVar("tradeMiene") == 1 then
            player:messageSpecial(ID.text.FLYER_ALREADY)
        end
    end
end

function onTrigger(player, npc)
    local thePickpocket = player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.THE_PICKPOCKET)
    local thePickpocketStat = player:getVar("thePickpocket")

    -- THE PICKPOCKET
    if thePickpocket == QUEST_AVAILABLE and thePickpocketStat == 0 then
        player:startEvent(502)
    elseif thePickpocket == QUEST_AVAILABLE and thePickpocketStat == 1 then
        player:startEvent(554)
    elseif thePickpocket == QUEST_ACCEPTED and player:getVar("thePickpocketEagleButton") == 0 then
        player:startEvent(549)
        player:setVar("thePickpocketEagleButton", 1)
    elseif thePickpocket == QUEST_ACCEPTED and player:getVar("thePickpocketEagleButton") == 1 and not player:hasItem(578) then
        player:startEvent(611)

    -- STANDARD DIALOG
    else
        player:startEvent(553)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- THE PICKPOCKET
    if csid == 502 then
        player:setVar("thePickpocket", 1)
    elseif csid == 549 or csid == 611 then
        if not npcUtil.giveItem(player, 578) then
            player:startEvent(552)
        end
    end
end
