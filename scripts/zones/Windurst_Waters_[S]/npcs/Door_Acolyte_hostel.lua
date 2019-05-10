-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Door Acolyte hostel
-- !pos 125 -2 216 94
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters_[S]/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/settings")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if
        player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.THE_TIGRESS_STIRS) == QUEST_ACCEPTED and
        player:hasKeyItem(dsp.ki.SMALL_STARFRUIT)
    then
        player:startEvent(129)
    elseif
        player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.THE_TIGRESS_STRIKES) == QUEST_COMPLETED and
        player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.KNOT_QUITE_THERE) == QUEST_AVAILABLE
    then
        if player:getCurrentMission(WOTG) == dsp.mission.id.wotg.CAIT_SITH or player:hasCompletedMission(WOTG, dsp.mission.id.wotg.CAIT_SITH) then
            player:startEvent(151)
        end
    elseif player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.KNOT_QUITE_THERE) == QUEST_ACCEPTED then
        player:startEvent(152)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 129 then
        player:addItem(4144) -- hi-elixir
        player:messageSpecial(ID.text.ITEM_OBTAINED, 4144)
        player:delKeyItem(dsp.ki.SMALL_STARFRUIT)
        player:addKeyItem(dsp.ki.BRASS_RIBBON_OF_SERVICE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.BRASS_RIBBON_OF_SERVICE)
        player:completeQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.THE_TIGRESS_STIRS)
    elseif csid == 151 then
        player:addQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.KNOT_QUITE_THERE)
    end
end
