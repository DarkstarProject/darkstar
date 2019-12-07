-----------------------------------
-- Area: Heaven's Tower
--  NPC: Kupipi
-- Involved in Mission 2-3
-- Involved in Quest: Riding on the Clouds
-- !pos 2 0.1 30 242
-----------------------------------
local ID = require("scripts/zones/Heavens_Tower/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
    if
        player:getQuestStatus(JEUNO, dsp.quest.id.jeuno.RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and
        player:getCharVar("ridingOnTheClouds_4") == 8 and
        trade:hasItemQty(1127, 1) and -- Kindred seal
        trade:getItemCount() == 1
    then
        player:setCharVar("ridingOnTheClouds_4", 0)
        player:tradeComplete()
        player:addKeyItem(dsp.ki.SPIRITED_STONE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.SPIRITED_STONE)
    elseif
        trade:hasItemQty(4365, 1) and -- Rolanberry
        trade:getItemCount() == 1 and
        player:getNation() == dsp.nation.WINDURST and
        player:getRank() >= 2 and
        not player:hasKeyItem(dsp.ki.PORTAL_CHARM)
    then
        if player:hasCompletedMission(WINDURST, dsp.mission.id.windurst.WRITTEN_IN_THE_STARS) then
            player:startEvent(291) -- Qualifies for the reward immediately
        else
            player:startEvent(292) -- Kupipi owes you the portal charm later
        end
    end
end

function onTrigger(player, npc)
    local pNation = player:getNation()
    local currentMission = player:getCurrentMission(pNation)
    local missionStatus = player:getCharVar("MissionStatus")

    if pNation == dsp.nation.SANDORIA then
        -- San d'Oria Mission 2-3 Part I - Windurst > Bastok
        if currentMission == dsp.mission.id.sandoria.JOURNEY_TO_WINDURST then
            if missionStatus == 4 then
                player:startEvent(238, 1, 1, 1, 1, pNation)
            elseif missionStatus == 5 then
                player:startEvent(240)
            elseif missionStatus == 6 then
                player:startEvent(241)
            end
        -- San d'Oria Mission 2-3 Part II - Bastok > Windurst
        elseif currentMission == dsp.mission.id.sandoria.JOURNEY_TO_WINDURST2 then
            if missionStatus == 7 then
                player:startEvent(242, 1, 1, 1, 1, 0)
            elseif missionStatus == 8 then
                player:startEvent(243)
            elseif missionStatus == 9 then
                player:startEvent(246)
            elseif missionStatus == 10 then
                player:startEvent(247)
            end
        else
            player:startEvent(251)
        end
    elseif pNation == dsp.nation.BASTOK then
        -- Bastok Mission 2-3 Part I - Windurst > San d'Oria
        if currentMission == dsp.mission.id.bastok.THE_EMISSARY_WINDURST then
            if missionStatus == 3 then
                player:startEvent(238, 1, 1, 1, 1, pNation)
            elseif missionStatus <= 5 then
                player:startEvent(240)
            elseif missionStatus == 6 then
                player:startEvent(241)
            end
        -- Bastok Mission 2-3 Part II - San d'Oria > Windurst
        elseif currentMission == dsp.mission.id.bastok.THE_EMISSARY_WINDURST2 then
            if missionStatus == 7 then
                player:startEvent(242, 1, 1, 1, 1, pNation)
            elseif missionStatus == 8 then
                player:startEvent(243)
            elseif missionStatus == 9 then
                player:startEvent(244)
            elseif missionStatus == 10 then
                player:startEvent(245)
            end
        else
            player:startEvent(251)
        end
    elseif pNation == dsp.nation.WINDURST then
        if currentMission == dsp.mission.id.windurst.THE_THREE_KINGDOMS and missionStatus == 0 then
            player:startEvent(95, 0, 0, 0, dsp.ki.LETTER_TO_THE_CONSULS_WINDURST)
        elseif currentMission == dsp.mission.id.windurst.THE_THREE_KINGDOMS and missionStatus == 11 then
            player:startEvent(101, 0, 0, dsp.ki.ADVENTURERS_CERTIFICATE)
        elseif currentMission == dsp.mission.id.windurst.THE_THREE_KINGDOMS then
            player:startEvent(97)
        elseif currentMission == dsp.mission.id.windurst.TO_EACH_HIS_OWN_RIGHT and missionStatus == 0 then
            player:startEvent(103, 0, 0, dsp.ki.STARWAY_STAIRWAY_BAUBLE)
        elseif currentMission == dsp.mission.id.windurst.TO_EACH_HIS_OWN_RIGHT and missionStatus == 1 then
            player:startEvent(104)
        elseif player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.THE_JESTER_WHO_D_BE_KING and missionStatus == 3 then
            player:startEvent(326)
        elseif player:hasCompletedMission(WINDURST, dsp.mission.id.windurst.WRITTEN_IN_THE_STARS) and player:getCharVar("OwesPortalCharm") == 1 then
            player:startEvent(293) -- Kupipi repays your favor
        elseif player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.MOON_READING and missionStatus >= 3 then
            player:startEvent(400) -- Kupipi in disbelief over player becoming Rank 10
        elseif pNation == dsp.nation.WINDURST and player:getRank() == 10 then
            player:startEvent(408) -- After achieving Windurst Rank 10, Kupipi has more to say
        else
            player:startEvent(251)
        end
    else
        player:startEvent(251)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 238 then
        if player:getNation() == dsp.nation.BASTOK then
            player:setCharVar("MissionStatus", 4)
            player:addKeyItem(dsp.ki.SWORD_OFFERING)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.SWORD_OFFERING)
        else
            player:setCharVar("MissionStatus", 5)
            player:addKeyItem(dsp.ki.SHIELD_OFFERING)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.SHIELD_OFFERING)
        end
    elseif csid == 244 or csid == 246 then
        player:setCharVar("MissionStatus", 10)
    elseif csid == 242 then
        player:addKeyItem(dsp.ki.DARK_KEY)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.DARK_KEY)
        player:setCharVar("MissionStatus", 8)
    elseif csid == 95 then
        player:setCharVar("MissionStatus", 1)
        player:addKeyItem(dsp.ki.LETTER_TO_THE_CONSULS_WINDURST)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.LETTER_TO_THE_CONSULS_WINDURST)
    elseif csid == 103 then
        player:setCharVar("MissionStatus", 1)
        player:addKeyItem(dsp.ki.STARWAY_STAIRWAY_BAUBLE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.STARWAY_STAIRWAY_BAUBLE)
    elseif csid == 101 then
        finishMissionTimeline(player, 1, csid, option)
    elseif csid == 291 then -- All condition met, grant Portal Charm
        player:tradeComplete()
        player:addKeyItem(dsp.ki.PORTAL_CHARM)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.PORTAL_CHARM)
    elseif csid == 292 then -- Traded rolanberry, but not all conditions met
        player:tradeComplete()
        player:setCharVar("OwesPortalCharm", 1)
    elseif csid == 293 then -- Traded rolanberry before, and all conditions are now met
        player:setCharVar("OwesPortalCharm", 0)
        player:addKeyItem(dsp.ki.PORTAL_CHARM)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.PORTAL_CHARM)
    elseif csid == 326 then
        player:setCharVar("MissionStatus", 4)
    elseif csid == 400 then
        player:setCharVar("KupipiDisbelief", 0)
    elseif csid == 408 then
        player:setCharVar("KupipiRankTenText", 1)
    end
end