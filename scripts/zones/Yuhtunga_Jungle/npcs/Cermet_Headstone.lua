-----------------------------------
-- Area: Yuhtunga Jungle
--  NPC: Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Fire Fragment)
-- !pos 491 20 301 123
-----------------------------------
package.loaded["scripts/zones/Yuhtunga_Jungle/TextIDs"] = nil;
package.loaded["scripts/zones/Yuhtunga_Jungle/MobIDs"] = nil;
-----------------------------------
require("scripts/zones/Yuhtunga_Jungle/TextIDs");
require("scripts/zones/Yuhtunga_Jungle/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/titles");

function onTrade(player,npc,trade)

    -- WRATH OF THE OPO-OPOS
    if (trade:hasItemQty(790,1) and trade:getItemCount() == 1) then
        if (not player:hasCompleteQuest(OUTLANDS,WRATH_OF_THE_OPO_OPOS) and (player:hasCompletedMission(ZILART,HEADSTONE_PILGRIMAGE) or player:hasKeyItem(FIRE_FRAGMENT))) then
            player:addQuest(OUTLANDS,WRATH_OF_THE_OPO_OPOS);
            player:startEvent(202,790);
        else
            player:messageSpecial(NOTHING_HAPPENS);
        end
    end
end;

function onTrigger(player,npc)

    -- HEADSTONE PILGRIMAGE
    if (player:getCurrentMission(ZILART) == HEADSTONE_PILGRIMAGE) then
        if (player:hasKeyItem(FIRE_FRAGMENT)) then
            player:messageSpecial(ALREADY_OBTAINED_FRAG,FIRE_FRAGMENT);
        elseif (os.time() >= npc:getLocalVar("cooldown")) then
            if (not GetMobByID(TIPHA):isSpawned() and not GetMobByID(CARTHI):isSpawned()) then
                player:startEvent(200,FIRE_FRAGMENT);
            else
                player:messageSpecial(SOMETHING_BETTER);
            end
        else
            player:addKeyItem(FIRE_FRAGMENT);
            if (
                player:hasKeyItem(ICE_FRAGMENT) and
                player:hasKeyItem(EARTH_FRAGMENT) and
                player:hasKeyItem(WATER_FRAGMENT) and
                player:hasKeyItem(WIND_FRAGMENT) and
                player:hasKeyItem(LIGHTNING_FRAGMENT) and
                player:hasKeyItem(LIGHT_FRAGMENT)
            ) then
                player:messageSpecial(FOUND_ALL_FRAGS,FIRE_FRAGMENT);
                player:addTitle(BEARER_OF_THE_EIGHT_PRAYERS);
                player:completeMission(ZILART,HEADSTONE_PILGRIMAGE);
                player:addMission(ZILART,THROUGH_THE_QUICKSAND_CAVES);
            else
                player:messageSpecial(KEYITEM_OBTAINED,FIRE_FRAGMENT);
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
        SpawnMob(TIPHA):updateClaim(player);
        SpawnMob(CARTHI):updateClaim(player);

    -- WRATH OF THE OPO-OPOS
    elseif (csid == 202) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13143);
        else
            player:tradeComplete();
            player:addItem(13143); -- Opo-opo Necklace
            player:messageSpecial(ITEM_OBTAINED,13143);
            player:addTitle(FRIEND_OF_THE_OPOOPOS);
            player:completeQuest(OUTLANDS,WRATH_OF_THE_OPO_OPOS);
        end
    end
end;
