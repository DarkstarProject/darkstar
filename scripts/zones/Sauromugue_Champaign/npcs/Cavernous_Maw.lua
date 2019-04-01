-----------------------------------
-- Area: Sauromugue Champaign
--  NPC: Cavernous Maw
-- Teleports Players to Sauromugue_Champaign_S
-- !pos 369 8 -227 120
-----------------------------------
local ID = require("scripts/zones/Sauromugue_Champaign/IDs")
require("scripts/globals/teleports")
require("scripts/globals/campaign")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if ENABLE_WOTG == 1 and not player:hasKeyItem(dsp.ki.PURE_WHITE_FEATHER) then
        player:startEvent(500, 2)
    elseif ENABLE_WOTG == 1 and hasMawActivated(player, 2) then
        if
            player:getCurrentMission(WOTG) == BACK_TO_THE_BEGINNING and
            (
                player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.CLAWS_OF_THE_GRIFFON) == QUEST_COMPLETED or
                player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.THE_TIGRESS_STRIKES) == QUEST_COMPLETED or
                player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.FIRES_OF_DISCONTENT) == QUEST_COMPLETED
            )
        then
            player:startEvent(501)
        else
            player:startEvent(904)
        end
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 500 then
        local r = math.random(1, 3)

        player:addKeyItem(dsp.ki.PURE_WHITE_FEATHER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.PURE_WHITE_FEATHER)
        player:completeMission(WOTG, CAVERNOUS_MAWS)
        player:addMission(WOTG, BACK_TO_THE_BEGINNING)

        if r == 1 then
            player:addNationTeleport(dsp.teleport.nation.MAW, 1)
            dsp.teleport.toMaw(player, 1) -- go to Batallia_Downs[S]
        elseif r == 2 then
            player:addNationTeleport(dsp.teleport.nation.MAW, 2)
            dsp.teleport.toMaw(player, 3) -- go to Rolanberry_Fields_[S]
        elseif r == 3 then
            player:addNationTeleport(dsp.teleport.nation.MAW, 4)
            dsp.teleport.toMaw(player, 5) -- go to Sauromugue_Champaign_[S]
        end
    elseif csid == 904 and option == 1 then
        dsp.teleport.toMaw(player, 5) -- go to Sauromugue_Champaign_[S]
    elseif csid == 501 then
        player:completeMission(WOTG, BACK_TO_THE_BEGINNING)
        player:addMission(WOTG, CAIT_SITH)
        player:addTitle(dsp.title.CAIT_SITHS_ASSISTANT)
        dsp.teleport.toMaw(player, 5)
    end
end