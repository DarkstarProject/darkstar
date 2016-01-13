-----------------------------------
-- Area: Western Altepa Desert
--  NPC: Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Earth Fragment)
-- @pos -108 10 -216 125
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/missions");
local text = require("scripts/zones/Western_Altepa_Desert/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getCurrentMission(ZILART) == HEADSTONE_PILGRIMAGE) then
        if (player:hasKeyItem(EARTH_FRAGMENT) == false) then
            player:startEvent(0x00C8,EARTH_FRAGMENT);
        elseif (player:hasKeyItem(239) and player:hasKeyItem(240) and player:hasKeyItem(241) and
            player:hasKeyItem(242) and player:hasKeyItem(243) and player:hasKeyItem(244) and
            player:hasKeyItem(245) and player:hasKeyItem(246)) then
            player:messageSpecial(text.ALREADY_HAVE_ALL_FRAGS);
        elseif (player:hasKeyItem(EARTH_FRAGMENT)) then
            player:messageSpecial(text.ALREADY_OBTAINED_FRAG,EARTH_FRAGMENT);
        end
    elseif (player:hasCompletedMission(ZILART,HEADSTONE_PILGRIMAGE)) then
        player:messageSpecial(text.ZILART_MONUMENT);
    else
        player:messageSpecial(text.CANNOT_REMOVE_FRAG);
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x00C8 and option == 1) then
        player:addKeyItem(EARTH_FRAGMENT);
        -- Check and see if all fragments have been found (no need to check earth and dark frag)
        if (player:hasKeyItem(FIRE_FRAGMENT) and player:hasKeyItem(WATER_FRAGMENT) and player:hasKeyItem(ICE_FRAGMENT) and
            player:hasKeyItem(WIND_FRAGMENT) and player:hasKeyItem(LIGHTNING_FRAGMENT) and player:hasKeyItem(LIGHT_FRAGMENT)) then
            player:messageSpecial(text.FOUND_ALL_FRAGS,EARTH_FRAGMENT);
            player:addTitle(BEARER_OF_THE_EIGHT_PRAYERS);
            player:completeMission(ZILART,HEADSTONE_PILGRIMAGE);
            player:addMission(ZILART,THROUGH_THE_QUICKSAND_CAVES);
        else
            player:messageSpecial(text.KEYITEM_OBTAINED,EARTH_FRAGMENT);
        end
    end

end;