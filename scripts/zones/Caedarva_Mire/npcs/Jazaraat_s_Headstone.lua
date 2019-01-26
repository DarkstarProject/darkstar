-----------------------------------
-- Area: Caedarva Mire
--  NPC: Jazaraat's Headstone
-- Involved in mission: The Lost Kingdom (TOAUM 13)
-- !pos -389 6 -570 79
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:hasCompletedMission(TOAU,LOST_KINGDOM)) then
        if (not player:hasKeyItem(dsp.ki.EPHRAMADIAN_GOLD_COIN)) then
            player:addKeyItem(dsp.ki.EPHRAMADIAN_GOLD_COIN);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.EPHRAMADIAN_GOLD_COIN);
        end
    elseif (player:getCurrentMission(TOAU) == LOST_KINGDOM) then
        if (player:hasKeyItem(dsp.ki.VIAL_OF_SPECTRAL_SCENT) and player:getVar("AhtUrganStatus") == 0) then
            player:startEvent(8);
        elseif (player:getVar("AhtUrganStatus") == 1) then
            if (not GetMobByID(ID.mob.JAZARAAT):isSpawned()) then
                SpawnMob(ID.mob.JAZARAAT):updateEnmity(player);
            end
        elseif (player:getVar("AhtUrganStatus") == 2) then
            player:startEvent(9);
        elseif (player:getVar("AhtUrganStatus") == 3) then
            player:setVar("AhtUrganStatus", 0);
            player:addKeyItem(dsp.ki.EPHRAMADIAN_GOLD_COIN);
            player:completeMission(TOAU,LOST_KINGDOM);
            player:addMission(TOAU,THE_DOLPHIN_CREST);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.EPHRAMADIAN_GOLD_COIN);
        else
            player:messageSpecial(ID.text.JAZARAATS_HEADSTONE);
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
