-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Ratihb
-- Standard Info NPC
-- !pos 75.225 -6.000 -137.203 50
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/quests")
require("scripts/globals/npc_util")
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    local LuckOfTheDraw = player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.LUCK_OF_THE_DRAW)
    local EquippedforAllOccasions = player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.EQUIPPED_FOR_ALL_OCCASIONS)

    if LuckOfTheDraw == QUEST_AVAILABLE and player:getMainLvl() >= ADVANCED_JOB_LEVEL then        -- corsair job quest
        player:startEvent(547)
        player:setVar("LuckOfTheDraw",1)
        player:addQuest(AHT_URHGAN,dsp.quest.id.ahtUrhgan.LUCK_OF_THE_DRAW)
    elseif player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.LUCK_OF_THE_DRAW) == QUEST_COMPLETED and player:getVar("LuckOfTheDraw") ==5 then    -- Ending CS for Corsair Optional
        player:startEvent(552)
        player:setVar("LuckOfTheDraw",6)
    elseif player:getVar("EquippedforAllOccasions") ==4 and player:getVar("LuckOfTheDraw") ==6 then --Af1 Final CS
        player:startEvent(772)
        player:setVar("EquippedforAllOccasions",5)
        player:setVar("LuckOfTheDraw",0)
    elseif player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.LUCK_OF_THE_DRAW) == QUEST_COMPLETED and player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.EQUIPPED_FOR_ALL_OCCASIONS == QUEST_COMPLETED) then
        player:setVar("EquippedforAllOccasions",0)
    elseif player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.AGAINST_ALL_ODDS) == QUEST_ACCEPTED and not player:hasKeyItem(dsp.ki.LIFE_FLOAT) then
        player:startEvent(604) -- reacquire life float
    else
        player:startEvent(603)    -- standard dialog
    end


end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if csid == 772 then
        npcUtil.completeQuest(player, AHT_URHGAN, dsp.quest.id.ahtUrhgan.EQUIPPED_FOR_ALL_OCCASIONS, { item=18702, var="EquippedforAllOccasions"})
    elseif csid == 604 then
        npcUtil.giveKeyItem(player, dsp.ki.LIFE_FLOAT)
    end
end
