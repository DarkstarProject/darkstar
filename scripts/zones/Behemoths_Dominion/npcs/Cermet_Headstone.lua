-----------------------------------
-- Area: Behemoth's Dominion
-- NPC:  Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Lightning Headstone)
-- !pos -74 -4 -87 127
-----------------------------------
package.loaded["scripts/zones/Behemoths_Dominion/TextIDs"] = nil;
package.loaded["scripts/zones/Behemoths_Dominion/MobIDs"] = nil;
-----------------------------------
require("scripts/zones/Behemoths_Dominion/TextIDs");
require("scripts/zones/Behemoths_Dominion/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/titles");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    -- HEADSTONE PILGRIMAGE
    if (player:getCurrentMission(ZILART) == HEADSTONE_PILGRIMAGE) then
        if (player:hasKeyItem(LIGHTNING_FRAGMENT)) then
            player:messageSpecial(ALREADY_OBTAINED_FRAG,LIGHTNING_FRAGMENT);
        elseif (os.time() >= npc:getLocalVar("cooldown")) then
            if (not GetMobByID(ANCIENT_WEAPON):isSpawned() and not GetMobByID(LEGENDARY_WEAPON):isSpawned()) then
                player:startEvent(200,LIGHTNING_FRAGMENT);
            else
                player:messageSpecial(SOMETHING_BETTER);
            end
        else
            player:addKeyItem(LIGHTNING_FRAGMENT);
            if (
                player:hasKeyItem(ICE_FRAGMENT) and
                player:hasKeyItem(EARTH_FRAGMENT) and
                player:hasKeyItem(WATER_FRAGMENT) and
                player:hasKeyItem(FIRE_FRAGMENT) and
                player:hasKeyItem(WIND_FRAGMENT) and
                player:hasKeyItem(LIGHT_FRAGMENT)
            ) then
                player:messageSpecial(FOUND_ALL_FRAGS,LIGHTNING_FRAGMENT);
                player:addTitle(BEARER_OF_THE_EIGHT_PRAYERS);
                player:completeMission(ZILART,HEADSTONE_PILGRIMAGE);
                player:addMission(ZILART,THROUGH_THE_QUICKSAND_CAVES);
            else
                player:messageSpecial(KEYITEM_OBTAINED,LIGHTNING_FRAGMENT);
            end
        end

    -- DEFAULT DIALOGS
    elseif (player:hasCompletedMission(ZILART,HEADSTONE_PILGRIMAGE)) then
        player:messageSpecial(ZILART_MONUMENT);
    else
        player:messageSpecial(CANNOT_REMOVE_FRAG);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    -- HEADSTONE PILGRIMAGE
    if (csid == 200 and option == 1) then
        SpawnMob(ANCIENT_WEAPON):updateClaim(player);
        SpawnMob(LEGENDARY_WEAPON):updateClaim(player);
    end
end;
