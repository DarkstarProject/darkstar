-----------------------------------
-- Area: Chateau d'Oraguille
--  NPC: Curilla
-- Starts and Finishes Quest: The General's Secret, Enveloped in Darkness, Peace for the Spirit,
--                            Lure of the Wildcat (San d'Oria), Old Wounds
-- !pos 27 0.1 0.1 233
-----------------------------------
local ID = require("scripts/zones/Chateau_dOraguille/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/wsquest")
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------

local wsQuest = dsp.wsquest.savage_blade

function onTrade(player,npc,trade)
    local wsQuestEvent = dsp.wsquest.getTradeEvent(wsQuest,player,trade)

    if wsQuestEvent ~= nil then
        player:startEvent(wsQuestEvent)
    end

end

function onTrigger(player,npc)
    local wsQuestEvent = dsp.wsquest.getTriggerEvent(wsQuest,player)
    local mLvL = player:getMainLvl()
    local mJob = player:getMainJob()
    local theGeneralSecret = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.THE_GENERAL_S_SECRET)
    local envelopedInDarkness = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.ENVELOPED_IN_DARKNESS)
    local peaceForTheSpirit = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.PEACE_FOR_THE_SPIRIT)
    local WildcatSandy = player:getCharVar("WildcatSandy")

    if wsQuestEvent ~= nil then
        player:startEvent(wsQuestEvent)
    elseif (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,15) == false) then
        player:startEvent(562)
    elseif (theGeneralSecret == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 2) then
        player:startEvent(55) -- Start Quest "The General's Secret"
    elseif (mJob == dsp.job.RDM and mLvL >= AF2_QUEST_LEVEL and player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.THE_CRIMSON_TRIAL) == QUEST_COMPLETED and envelopedInDarkness == QUEST_AVAILABLE) then
        player:startEvent(94) -- Start Quest "Enveloped in Darkness"
    elseif (player:hasKeyItem(dsp.ki.OLD_POCKET_WATCH) and player:hasKeyItem(dsp.ki.OLD_BOOTS) == false) then
        player:startEvent(93)
    elseif (player:hasKeyItem(dsp.ki.OLD_BOOTS) and player:getCharVar("needs_crawler_blood") == 0) then
        player:startEvent(101)
    elseif (player:getCharVar("needs_crawler_blood") == 1) then
        player:startEvent(117)
    elseif (mJob == dsp.job.RDM and mLvL >= AF2_QUEST_LEVEL and envelopedInDarkness == QUEST_COMPLETED and peaceForTheSpirit == QUEST_AVAILABLE) then
        player:startEvent(109) -- Start Quest "Peace for the Spirit"
    elseif (peaceForTheSpirit == QUEST_ACCEPTED) then
        player:startEvent(108) -- Standard dialog during Peace of the spirit
    elseif (peaceForTheSpirit == QUEST_ACCEPTED and (player:getCharVar("peaceForTheSpiritCS") >= 2 and player:getCharVar("peaceForTheSpiritCS") <= 4)) then
        player:startEvent(113)
    elseif (peaceForTheSpirit == QUEST_ACCEPTED and player:getCharVar("peaceForTheSpiritCS") == 5) then
        player:startEvent(51)
    elseif (theGeneralSecret == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.CURILLAS_BOTTLE_EMPTY)) then
        player:startEvent(53)
    elseif (theGeneralSecret == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.CURILLAS_BOTTLE_FULL)) then
        player:startEvent(54)
    elseif (envelopedInDarkness == QUEST_COMPLETED and peaceForTheSpirit == QUEST_AVAILABLE) then
        player:startEvent(114) -- Standard dialog after Enveloped in darkness
    elseif (peaceForTheSpirit == QUEST_COMPLETED) then
        player:startEvent(52) -- Standard dialog after Peace of the spirit
    else
        player:startEvent(530) -- Standard dialog
    end

end

function onEventFinish(player,csid,option)
    if (csid == 55 and option == 1) then
        player:addQuest(SANDORIA,dsp.quest.id.sandoria.THE_GENERAL_S_SECRET)
        player:addKeyItem(dsp.ki.CURILLAS_BOTTLE_EMPTY)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.CURILLAS_BOTTLE_EMPTY)
    elseif (csid == 54) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,16409) -- Lynx Baghnakhs
        else
            player:delKeyItem(dsp.ki.CURILLAS_BOTTLE_FULL)
            player:addItem(16409)
            player:messageSpecial(ID.text.ITEM_OBTAINED,16409) -- Lynx Baghnakhs
            player:addFame(SANDORIA,30)
            player:completeQuest(SANDORIA,dsp.quest.id.sandoria.THE_GENERAL_S_SECRET)
        end
    elseif (csid == 94 and option == 1) then
        player:addQuest(SANDORIA,dsp.quest.id.sandoria.ENVELOPED_IN_DARKNESS)
        player:addKeyItem(dsp.ki.OLD_POCKET_WATCH)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.OLD_POCKET_WATCH)
    elseif (csid == 109 and option == 1) then
        player:addQuest(SANDORIA,dsp.quest.id.sandoria.PEACE_FOR_THE_SPIRIT)
        player:setCharVar("needs_crawler_blood",0)
    elseif (csid == 101) then
        player:setCharVar("needs_crawler_blood",1)
    elseif (csid == 562) then
        player:setMaskBit(player:getCharVar("WildcatSandy"),"WildcatSandy",15,true)
    else
        dsp.wsquest.handleEventFinish(wsQuest,player,csid,option,ID.text.SAVAGE_BLADE_LEARNED)
    end
end
