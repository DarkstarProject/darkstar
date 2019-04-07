-----------------------------------
-- Area: Rolanberry Fields [S]
--  NPC: Cavernous Maw
-- !pos -198 8 360 91
-- Teleports Players to Rolanberry Fields
-----------------------------------
require("scripts/globals/teleports")
require("scripts/globals/campaign")
require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if
        player:getCurrentMission(WOTG) == dsp.mission.id.wotg.BACK_TO_THE_BEGINNING and
        (
            player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.CLAWS_OF_THE_GRIFFON) == QUEST_COMPLETED or
            player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.THE_TIGRESS_STRIKES) == QUEST_COMPLETED or
            player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.FIRES_OF_DISCONTENT) == QUEST_COMPLETED
        )
    then
        player:startEvent(701)
    elseif not hasMawActivated(player, 1) then
        player:startEvent(101)
    else
        player:startEvent(102)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 101 and option == 1 then
        player:addNationTeleport(dsp.teleport.nation.MAW, 2)
        dsp.teleport.toMaw(player, 4)
    elseif csid == 102 and option == 1 then
        dsp.teleport.toMaw(player, 4)
    elseif csid == 701 then
        player:completeMission(WOTG, dsp.mission.id.wotg.BACK_TO_THE_BEGINNING)
        player:addMission(WOTG, dsp.mission.id.wotg.CAIT_SITH)
        player:addTitle(dsp.title.CAIT_SITHS_ASSISTANT)
        if not hasMawActivated(player, 0) then
            player:addNationTeleport(dsp.teleport.nation.MAW, 2)
        end
        dsp.teleport.toMaw(player, 4)
    end
end