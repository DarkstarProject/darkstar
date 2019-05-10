-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Qutiba
-- Type: Standard NPC
-- !pos 92.341 -7.5 -129.980 50
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local vanishProg = player:getVar("vanishingactCS")
    if player:getVar("deliveringTheGoodsCS") == 1 then
        player:startEvent(40)
    elseif player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.DELIVERING_THE_GOODS) == QUEST_COMPLETED and vanishProg == 1 then
        player:startEvent(42)
    elseif vanishProg == 2 then
        player:startEvent(54)
    elseif vanishProg == 4 and player:hasKeyItem(dsp.ki.RAINBOW_BERRY) then
        player:startEvent(45)
    else
        player:startEvent(51)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 40 then
        player:setVar("deliveringTheGoodsCS",2)
    elseif csid == 42 and option == 0 then
        player:addQuest(AHT_URHGAN,dsp.quest.id.ahtUrhgan.VANISHING_ACT)
        player:setVar("vanishingactCS",2)
    elseif csid == 45 and npcUtil.completeQuest(player, AHT_URHGAN, dsp.quest.id.ahtUrhgan.VANISHING_ACT, {item=2185, var="vanishingactCS"}) then
        player:delKeyItem(dsp.ki.RAINBOW_BERRY)
    end
end