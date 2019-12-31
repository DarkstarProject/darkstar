-----------------------------------
-- Area: Bastok Mines
--  NPC: Gumbah
-- Finishes Quest: Blade of Darkness, Inheritance
-- !pos 52 0 -36 234
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/globals/settings")
require("scripts/globals/wsquest")
local ID = require("scripts/zones/Bastok_Mines/IDs")
-----------------------------------

local wsQuest = dsp.wsquest.ground_strike

function onTrade(player,npc,trade)
    local wsQuestEvent = dsp.wsquest.getTradeEvent(wsQuest,player,trade)

    if wsQuestEvent ~= nil then
        player:startEvent(wsQuestEvent)
    end
end

function onTrigger(player,npc)
    local wsQuestEvent = dsp.wsquest.getTriggerEvent(wsQuest,player)
    local bladeDarkness = player:getQuestStatus(BASTOK, dsp.quest.id.bastok.BLADE_OF_DARKNESS)

    if wsQuestEvent ~= nil then
        player:startEvent(wsQuestEvent)
    elseif (player:getMainLvl() >= ADVANCED_JOB_LEVEL and  bladeDarkness == QUEST_AVAILABLE) then
        --DARK KNIGHT QUEST
        player:startEvent(99)
    elseif (bladeDarkness == QUEST_COMPLETED and player:getQuestStatus(BASTOK,dsp.quest.id.bastok.BLADE_OF_DEATH) == QUEST_AVAILABLE) then
        player:startEvent(130)
    elseif ((player:hasCompletedMission(BASTOK, dsp.mission.id.bastok.ON_MY_WAY) == true)
    or ((player:getCurrentMission(BASTOK) == dsp.mission.id.bastok.ON_MY_WAY) and (player:getCharVar("MissionStatus") == 3)))
        and (player:getCharVar("[B7-2]Werei") == 0) then
        player:startEvent(177)
    else
        --DEFAULT
        player:startEvent(52)
    end
end

function onEventFinish(player,csid,option)
    if (csid == 99) then
        player:addQuest(BASTOK, dsp.quest.id.bastok.BLADE_OF_DARKNESS)
    elseif (csid == 130) then
        player:addQuest(BASTOK, dsp.quest.id.bastok.BLADE_OF_DEATH)
        player:addKeyItem(dsp.ki.LETTER_FROM_ZEID)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.LETTER_FROM_ZEID)
    elseif (csid == 177) then
        player:setCharVar("[B7-2]Werei", 1)
    else
        dsp.wsquest.handleEventFinish(wsQuest,player,csid,option,ID.text.GROUND_STRIKE_LEARNED)
    end
end