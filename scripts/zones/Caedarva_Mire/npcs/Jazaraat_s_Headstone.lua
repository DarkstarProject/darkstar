-----------------------------------
-- Area: Caedarva Mire
--  NPC: Jazaraat's Headstone
-- Involved in mission: The Lost Kingdom (TOAUM 13)
-- !pos -389 6 -570 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Caedarva_Mire/TextIDs");
require("scripts/zones/Caedarva_Mire/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:hasCompletedMission(TOAU,LOST_KINGDOM)) then
        if (not player:hasKeyItem(EPHRAMADIAN_GOLD_COIN)) then
            player:addKeyItem(EPHRAMADIAN_GOLD_COIN);
            player:messageSpecial(KEYITEM_OBTAINED,EPHRAMADIAN_GOLD_COIN);
        end
    elseif (player:getCurrentMission(TOAU) == LOST_KINGDOM) then
        if (player:hasKeyItem(VIAL_OF_SPECTRAL_SCENT) and player:getVar("AhtUrganStatus") == 0) then
            player:startEvent(8);
        elseif (player:getVar("AhtUrganStatus") == 1) then
            if (not GetMobByID(JAZARAAT):isSpawned()) then
                SpawnMob(JAZARAAT):updateEnmity(player);
            end
        elseif (player:getVar("AhtUrganStatus") == 2) then
            player:startEvent(9);
        elseif (player:getVar("AhtUrganStatus") == 3) then
            player:setVar("AhtUrganStatus", 0);
            player:addKeyItem(EPHRAMADIAN_GOLD_COIN);
            player:completeMission(TOAU,LOST_KINGDOM);
            player:addMission(TOAU,THE_DOLPHIN_CREST);
            player:messageSpecial(KEYITEM_OBTAINED,EPHRAMADIAN_GOLD_COIN);
        else
            player:messageSpecial(JAZARAATS_HEADSTONE);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 8) then
        player:setVar("AhtUrganStatus", 1);
    elseif (csid == 9) then
        player:setVar("AhtUrganStatus", 3);
    end
end;
