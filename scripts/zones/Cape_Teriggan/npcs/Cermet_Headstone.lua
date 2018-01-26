-----------------------------------
-- Area: Cape Teriggan
--  NPC: Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Wind Headstone)
-- !pos -107 -8 450 113
-----------------------------------
package.loaded["scripts/zones/Cape_Teriggan/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Cape_Teriggan/TextIDs");
require("scripts/zones/Cape_Teriggan/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/titles");
require("scripts/globals/quests");

function onTrade(player,npc,trade)

    -- WANDERING SOULS
    if (trade:hasItemQty(949,1) and trade:getItemCount() == 1) then
        if (not player:hasCompleteQuest(OUTLANDS,WANDERING_SOULS) and (player:hasCompletedMission(ZILART,HEADSTONE_PILGRIMAGE) or player:hasKeyItem(WIND_FRAGMENT))) then
             player:addQuest(OUTLANDS,WANDERING_SOULS);
             player:startEvent(202,949);
        else
             player:messageSpecial(NOTHING_HAPPENS);
        end
    end
end;

function onTrigger(player,npc)

    -- HEADSTONE PILGRIMAGE
    if (player:getCurrentMission(ZILART) == HEADSTONE_PILGRIMAGE) then
        if (player:hasKeyItem(WIND_FRAGMENT)) then
            player:messageSpecial(ALREADY_OBTAINED_FRAG,WIND_FRAGMENT);
        elseif (os.time() >= npc:getLocalVar("cooldown")) then
            if (not GetMobByID(AXESARION_THE_WANDERER):isSpawned()) then
                player:startEvent(200,WIND_FRAGMENT);
            else
                player:messageSpecial(SOMETHING_BETTER);
            end
        else
            player:addKeyItem(WIND_FRAGMENT);
            if (
                player:hasKeyItem(ICE_FRAGMENT) and
                player:hasKeyItem(EARTH_FRAGMENT) and
                player:hasKeyItem(WATER_FRAGMENT) and
                player:hasKeyItem(FIRE_FRAGMENT) and
                player:hasKeyItem(LIGHTNING_FRAGMENT) and
                player:hasKeyItem(LIGHT_FRAGMENT)
            ) then
                player:messageSpecial(FOUND_ALL_FRAGS,WIND_FRAGMENT);
                player:addTitle(BEARER_OF_THE_EIGHT_PRAYERS);
                player:completeMission(ZILART,HEADSTONE_PILGRIMAGE);
                player:addMission(ZILART,THROUGH_THE_QUICKSAND_CAVES);
            else
                player:messageSpecial(KEYITEM_OBTAINED,WIND_FRAGMENT);
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
        SpawnMob(AXESARION_THE_WANDERER):updateClaim(player);

    -- WANDERING SOULS
    elseif (csid == 202) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13248);
        else
            player:tradeComplete();
            player:addItem(13248); -- Flagellant's Rope
            player:messageSpecial(ITEM_OBTAINED,13248);
            player:addTitle(BEARER_OF_BONDS_BEYOND_TIME);
            player:completeQuest(OUTLANDS,WANDERING_SOULS);
        end
    end
end;
