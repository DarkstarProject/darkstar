-----------------------------------
-- Area: La Theine Plateau
--  NPC: Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Water Fragment)
-- !pos -170 39 -504 102
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/missions");
local ID = require("scripts/zones/La_Theine_Plateau/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(ZILART) == dsp.mission.id.zilart.HEADSTONE_PILGRIMAGE) then
        if (player:hasKeyItem(dsp.ki.WATER_FRAGMENT) == false) then
            player:startEvent(200,dsp.ki.WATER_FRAGMENT);
        elseif (player:hasKeyItem(dsp.ki.FIRE_FRAGMENT) and player:hasKeyItem(dsp.ki.WATER_FRAGMENT) and player:hasKeyItem(dsp.ki.EARTH_FRAGMENT) and
            player:hasKeyItem(dsp.ki.WIND_FRAGMENT) and player:hasKeyItem(dsp.ki.LIGHTNING_FRAGMENT) and player:hasKeyItem(dsp.ki.ICE_FRAGMENT) and
            player:hasKeyItem(dsp.ki.LIGHT_FRAGMENT) and player:hasKeyItem(dsp.ki.DARK_FRAGMENT)) then
            player:messageSpecial(ID.text.ALREADY_HAVE_ALL_FRAGS);
        elseif (player:hasKeyItem(dsp.ki.WATER_FRAGMENT) == true) then
            player:messageSpecial(ID.text.ALREADY_OBTAINED_FRAG,dsp.ki.WATER_FRAGMENT);
        end
    elseif (player:hasCompletedMission(ZILART,dsp.mission.id.zilart.HEADSTONE_PILGRIMAGE)) then
        player:messageSpecial(ID.text.ZILART_MONUMENT);
    else
        player:messageSpecial(ID.text.CANNOT_REMOVE_FRAG);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 200 and option == 1) then
        player:addKeyItem(dsp.ki.WATER_FRAGMENT);
        -- Check and see if all fragments have been found (no need to check earth and dark frag)
        if (player:hasKeyItem(dsp.ki.FIRE_FRAGMENT) and player:hasKeyItem(dsp.ki.EARTH_FRAGMENT) and player:hasKeyItem(dsp.ki.ICE_FRAGMENT) and
           player:hasKeyItem(dsp.ki.WIND_FRAGMENT) and player:hasKeyItem(dsp.ki.LIGHTNING_FRAGMENT) and player:hasKeyItem(dsp.ki.LIGHT_FRAGMENT)) then
            player:messageSpecial(ID.text.FOUND_ALL_FRAGS,dsp.ki.WATER_FRAGMENT);
            player:addTitle(dsp.title.BEARER_OF_THE_EIGHT_PRAYERS);
            player:completeMission(ZILART,dsp.mission.id.zilart.HEADSTONE_PILGRIMAGE);
            player:addMission(ZILART,dsp.mission.id.zilart.THROUGH_THE_QUICKSAND_CAVES);
        else
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.WATER_FRAGMENT);
        end
    end

end;