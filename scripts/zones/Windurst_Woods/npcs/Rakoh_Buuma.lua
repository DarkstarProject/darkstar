-----------------------------------
-- Area: Windurst Woods
--  NPC: Rakoh Buuma
-- Starts Windurst Missions
-- !pos 106 -5 -23 241
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/titles")
require("scripts/globals/zone")
-----------------------------------

function onTrigger(player,npc)
    if player:getNation() ~= dsp.nation.WINDURST then
        player:startEvent(105) -- for other nation
    else
        local CurrentMission = player:getCurrentMission(WINDURST)
        local MissionStatus = player:getVar("MissionStatus")
        local pRank = player:getRank()
        local cs, p, offset = getMissionOffset(player,1,CurrentMission,MissionStatus)

        if CurrentMission <= 15 and (cs ~= 0 or offset ~= 0 or (CurrentMission == 0 and offset == 0)) then
            if cs == 0 then
                player:showText(npc,ORIGINAL_MISSION_OFFSET + offset) -- dialog after accepting mission
            else
                player:startEvent(cs,p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8])
            end
        elseif CurrentMission ~= 255 then
            player:startEvent(112)
        elseif not player:hasCompletedMission(WINDURST,THE_HORUTOTO_RUINS_EXPERIMENT) then
            player:startEvent(121)
        elseif not player:hasCompletedMission(WINDURST,THE_HEART_OF_THE_MATTER) then
            player:startEvent(132)
        elseif not player:hasCompletedMission(WINDURST,THE_PRICE_OF_PEACE) then
            player:startEvent(149)
        elseif player:hasKeyItem(dsp.ki.MESSAGE_TO_JEUNO_WINDURST) then
            player:startEvent(197)
        elseif player:hasCompletedMission(WINDURST,MOON_READING) then
            player:startEvent(632)
        else
            local flagMission, repeatMission = getMissionMask(player)
            player:startEvent(114,flagMission,0,0,0,dsp.ki.STAR_CRESTED_SUMMONS,repeatMission)
        end
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    finishMissionTimeline(player,1,csid,option)

    if csid == 121 and option == 1 then
        player:addTitle(dsp.title.NEW_BUUMAS_BOOMERS_RECRUIT)
    elseif csid == 114 and (option == 12 or option == 15) then
        player:addKeyItem(dsp.ki.STAR_CRESTED_SUMMONS)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.STAR_CRESTED_SUMMONS)
    elseif csid == 632 then
        player:setVar("WWoodsRTenText", 1)
    end
end