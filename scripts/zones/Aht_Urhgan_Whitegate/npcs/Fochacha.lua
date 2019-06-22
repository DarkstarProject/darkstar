-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Fochacha
-- Type: Standard NPC
-- !pos 2.897 -1 -10.781 50
--  Quest: Delivering the Goods
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local vanishingact = player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.VANISHING_ACT)
    local deliveryGoodsProg = player:getVar("deliveringTheGoodsCS")
    local vanishActProg = player:getVar("vanishingactCS")
    if player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.DELIVERING_THE_GOODS) == QUEST_AVAILABLE then
        player:startEvent(39)
    elseif deliveryGoodsProg == 1 then
        player:startEvent(46)
    elseif deliveryGoodsProg == 2 then
        player:startEvent(41)
    elseif vanishingact == QUEST_ACCEPTED and vanishActProg == 2 then
        player:startEvent(43)
    elseif vanishActProg == 3 then
        player:startEvent(48)
    elseif vanishActProg == 4 then
        player:startEvent(49)
    elseif vanishingact == QUEST_COMPLETED then
        player:startEvent(59)
    else
        player:startEvent(47)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 39 then
        player:addQuest(AHT_URHGAN,dsp.quest.id.ahtUrhgan.DELIVERING_THE_GOODS)
        player:setVar("deliveringTheGoodsCS",1)
    elseif csid == 41 and npcUtil.completeQuest(player, AHT_URHGAN,dsp.quest.id.ahtUrhgan.DELIVERING_THE_GOODS, { item = {2184,3}, var = "deliveringTheGoodsCS"}) then
        player:setVar("VANISHING_ACT_waitJPMidnight",getMidnight())
    elseif csid == 43 then
        player:setVar("vanishingactCS",3)
    end
end