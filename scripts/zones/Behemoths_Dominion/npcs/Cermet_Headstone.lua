-----------------------------------
-- Area: Behemoth's Dominion
--  NPC: Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Lightning Headstone)
-- !pos -74 -4 -87 127
-----------------------------------
local ID = require("scripts/zones/Behemoths_Dominion/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/titles");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    -- HEADSTONE PILGRIMAGE
    if (player:getCurrentMission(ZILART) == HEADSTONE_PILGRIMAGE) then
        if (player:hasKeyItem(dsp.ki.LIGHTNING_FRAGMENT)) then
            player:messageSpecial(ID.text.ALREADY_OBTAINED_FRAG,dsp.ki.LIGHTNING_FRAGMENT);
        elseif (os.time() >= npc:getLocalVar("cooldown")) then
            if (not GetMobByID(ID.mob.ANCIENT_WEAPON):isSpawned() and not GetMobByID(ID.mob.LEGENDARY_WEAPON):isSpawned()) then
                player:startEvent(200,dsp.ki.LIGHTNING_FRAGMENT);
            else
                player:messageSpecial(ID.text.SOMETHING_BETTER);
            end
        else
            player:addKeyItem(dsp.ki.LIGHTNING_FRAGMENT);
            if (
                player:hasKeyItem(dsp.ki.ICE_FRAGMENT) and
                player:hasKeyItem(dsp.ki.EARTH_FRAGMENT) and
                player:hasKeyItem(dsp.ki.WATER_FRAGMENT) and
                player:hasKeyItem(dsp.ki.FIRE_FRAGMENT) and
                player:hasKeyItem(dsp.ki.WIND_FRAGMENT) and
                player:hasKeyItem(dsp.ki.LIGHT_FRAGMENT)
            ) then
                player:messageSpecial(ID.text.FOUND_ALL_FRAGS,dsp.ki.LIGHTNING_FRAGMENT);
                player:addTitle(dsp.title.BEARER_OF_THE_EIGHT_PRAYERS);
                player:completeMission(ZILART,HEADSTONE_PILGRIMAGE);
                player:addMission(ZILART,THROUGH_THE_QUICKSAND_CAVES);
            else
                player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.LIGHTNING_FRAGMENT);
            end
        end

    -- DEFAULT DIALOGS
    elseif (player:hasCompletedMission(ZILART,HEADSTONE_PILGRIMAGE)) then
        player:messageSpecial(ID.text.ZILART_MONUMENT);
    else
        player:messageSpecial(ID.text.CANNOT_REMOVE_FRAG);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    -- HEADSTONE PILGRIMAGE
    if (csid == 200 and option == 1) then
        SpawnMob(ID.mob.ANCIENT_WEAPON):updateClaim(player);
        SpawnMob(ID.mob.LEGENDARY_WEAPON):updateClaim(player);
    end
end;
