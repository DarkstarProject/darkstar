-----------------------------------
-- Area: Caedarva Mire
--  NPC: Jazaraat's Headstone
-- Involved in mission: The Lost Kingdom (TOAUM 13)
-- @pos -389 6 -570 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Caedarva_Mire/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(TOAU) == LOST_KINGDOM and player:hasKeyItem(VIAL_OF_SPECTRAL_SCENT) and player:getVar("AhtUrganStatus") == 0) then
        player:startEvent(8);
    elseif (player:getVar("AhtUrganStatus") == 1) then
        if (GetMobAction(17101146) == 0) then
            SpawnMob(17101146):updateEnmity(player);
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
    if (csid == 8) then
        player:setVar("AhtUrganStatus", 1);
    elseif (csid == 9) then
        player:setVar("AhtUrganStatus", 3);
    end
end;
