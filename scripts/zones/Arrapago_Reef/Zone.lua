-----------------------------------
--
-- Zone: Arrapago_Reef (54)
--
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Arrapago_Reef/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,-462,-4,-420,-455,-1,-392); -- approach the Cutter
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        if (prevZone == 60) then
            if (player:getCurrentMission(TOAU) == THE_BLACK_COFFIN and player:getVar("AhtUrganStatus") == 2) then
                cs = 9;
            else
                player:setPos(-456, -3, -405, 64);
            end
    elseif (prevZone == 79 and player:getCurrentMission(TOAU) == PREVALENCE_OF_PIRATES and player:getVar("AhtUrganStatus") == 0) then
        cs = 13;
        else
            player:setPos(-180.028,-10.335,-559.987,182);
        end
    end

    return cs;
end;

function afterZoneIn(player)
    player:entityVisualPacket("1pb1");
    player:entityVisualPacket("2pb1");
end;

function onRegionEnter(player,region)
    if (player:getCurrentMission(TOAU) == THE_BLACK_COFFIN and player:hasKeyItem(EPHRAMADIAN_GOLD_COIN) and player:getVar("AhtUrganStatus") == 0) then
        player:startEvent(8);
    elseif (player:getCurrentMission(TOAU) == PREVALENCE_OF_PIRATES and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(14);
    elseif (player:getCurrentMission(TOAU) == TESTING_THE_WATERS and player:hasKeyItem(EPHRAMADIAN_GOLD_COIN)) then
        player:startEvent(15);
    elseif (player:getQuestStatus(AHT_URHGAN,AGAINST_ALL_ODDS) == QUEST_ACCEPTED and player:getVar("AgainstAllOdds") == 1) then
        player:startEvent(237);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 8) then
        player:setVar("AhtUrganStatus",1);
        player:startEvent(34,1,1,1,1,1,1,1,1);
    elseif (csid == 9) then
        player:setVar("AhtUrganStatus",3);
        player:setPos(0,0,0,0,53);
    elseif (csid == 13) then
        player:setVar("AhtUrganStatus",1);
    elseif (csid == 14) then
        player:completeMission(TOAU,PREVALENCE_OF_PIRATES);
        player:setVar("AhtUrganStatus",0);
        player:addKeyItem(PERIQIA_ASSAULT_AREA_ENTRY_PERMIT);
        player:messageSpecial(KEYITEM_OBTAINED,PERIQIA_ASSAULT_AREA_ENTRY_PERMIT);
        player:addMission(TOAU,SHADES_OF_VENGEANCE);
    elseif (csid == 15) then
        player:setVar("AhtUrganStatus",1);
        player:setPos(0,0,0,0,57);
    elseif (csid == 34 and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(35);
    elseif (csid == 90) then -- enter instance: the ashu talif
        player:setPos(0,0,0,0,60);
    elseif (csid == 108) then -- enter instance: illrusi atoll
        player:setPos(0,0,0,0,55);
    elseif (csid == 237) then
        player:startEvent(240);
    elseif (csid == 240) then
        player:setVar("AgainstAllOdds",2);
    end
end;
