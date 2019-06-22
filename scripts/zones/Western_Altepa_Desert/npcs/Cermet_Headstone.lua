-----------------------------------
-- Area: Western Altepa Desert
--  NPC: Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Earth Fragment)
-- !pos -108 10 -216 125
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/titles")
-----------------------------------

local function hasAllFragments(player)
    return
        player:hasKeyItem(dsp.ki.FIRE_FRAGMENT) and
        player:hasKeyItem(dsp.ki.WATER_FRAGMENT) and
        player:hasKeyItem(dsp.ki.EARTH_FRAGMENT) and
        player:hasKeyItem(dsp.ki.WIND_FRAGMENT) and
        player:hasKeyItem(dsp.ki.LIGHTNING_FRAGMENT) and
        player:hasKeyItem(dsp.ki.ICE_FRAGMENT) and
        player:hasKeyItem(dsp.ki.LIGHT_FRAGMENT) and
        player:hasKeyItem(dsp.ki.DARK_FRAGMENT)
end

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:getCurrentMission(ZILART) == dsp.mission.id.zilart.HEADSTONE_PILGRIMAGE then
        if not player:hasKeyItem(dsp.ki.EARTH_FRAGMENT) then
            player:startEvent(200,dsp.ki.EARTH_FRAGMENT)
        elseif hasAllFragments(player) then
            player:messageSpecial(ID.text.ALREADY_HAVE_ALL_FRAGS)
        elseif player:hasKeyItem(dsp.ki.EARTH_FRAGMENT) then
            player:messageSpecial(ID.text.ALREADY_OBTAINED_FRAG, dsp.ki.EARTH_FRAGMENT)
        end
    elseif player:hasCompletedMission(ZILART,dsp.mission.id.zilart.HEADSTONE_PILGRIMAGE) then
        player:messageSpecial(ID.text.ZILART_MONUMENT)
    else
        player:messageSpecial(ID.text.CANNOT_REMOVE_FRAG)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 200 and option == 1 then
        player:addKeyItem(dsp.ki.EARTH_FRAGMENT)

        -- Check and see if all fragments have been found (no need to check earth and dark frag)
        if hasAllFragments(player) then
            player:messageSpecial(ID.text.FOUND_ALL_FRAGS, dsp.ki.EARTH_FRAGMENT)
            player:addTitle(dsp.title.BEARER_OF_THE_EIGHT_PRAYERS)
            player:completeMission(ZILART, dsp.mission.id.zilart.HEADSTONE_PILGRIMAGE)
            player:addMission(ZILART, dsp.mission.id.zilart.THROUGH_THE_QUICKSAND_CAVES)
        else
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.EARTH_FRAGMENT)
        end
    end
end
