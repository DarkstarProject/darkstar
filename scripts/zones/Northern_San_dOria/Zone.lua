-----------------------------------
--
-- Zone: Northern_San_dOria (231)
--
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/events/harvest_festivals");
require("scripts/globals/zone");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/missions");
-----------------------------------

function onInitialize(zone)

    SetExplorerMoogles(17723648);

    zone:registerRegion(1, -7,-3,110, 7,-1,155);

    applyHalloweenNpcCostumes(zone:getID())
end;

function onZoneIn(player,prevZone)

    local currentMission = player:getCurrentMission(SANDORIA);
    local MissionStatus = player:getVar("MissionStatus");
    local cs = -1;

    -- FIRST LOGIN (START CS)
    if (player:getPlaytime(false) == 0) then
        if (OPENING_CUTSCENE_ENABLE == 1) then
            cs = 535;
        end
        player:setPos(0,0,-11,191);
        player:setHomePoint();
    end
    -- MOG HOUSE EXIT
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(130,-0.2,-3,160);
        if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
            cs = 30004;
        end
        player:setVar("PlayerMainJob",0);
    end
    -- RDM AF3 CS
    if (player:getVar("peaceForTheSpiritCS") == 5 and player:getFreeSlotsCount() >= 1) then
        cs = 49;
    elseif (player:getCurrentMission(COP) == THE_ROAD_FORKS and player:getVar("EMERALD_WATERS_Status") == 1) then --EMERALD_WATERS-- COP 3-3A: San d'Oria Route
        player:setVar("EMERALD_WATERS_Status",2);
        cs = 0x000E;
    elseif (currentMission == THE_HEIR_TO_THE_LIGHT and MissionStatus == 0) then
        cs = 1;
    elseif (currentMission == THE_HEIR_TO_THE_LIGHT and MissionStatus == 4) then
        cs = 0;
    elseif (player:hasCompletedMission(SANDORIA,COMING_OF_AGE) and tonumber(os.date("%j")) == player:getVar("Wait1DayM8-1_date")) then
        cs = 16;
    end
    return cs;
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onRegionEnter(player,region)
    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)  -- Chateau d'Oraguille access
        pNation = player:getNation();
        currentMission = player:getCurrentMission(pNation)
            if ((pNation == 0 and player:getRank() >= 2) or (pNation > 0 and player:hasCompletedMission(pNation,5) == 1) or (currentMission >= 5 and currentMission <= 9) or (player:getRank() >= 3)) then
                player:startEvent(569);
            else
                player:startEvent(568);
            end
        end,
    }
end;

function onRegionLeave(player,region)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 535) then
        player:messageSpecial(ITEM_OBTAINED,0x218);
    elseif (csid == 1) then
        player:setVar("MissionStatus",1);
    elseif (csid == 0) then
        player:setVar("MissionStatus",5);
    elseif (csid == 30004 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(HOMEPOINT_SET);
    elseif (csid == 569) then
        player:setPos(0,0,-13,192,0xe9);
    elseif (csid == 49) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12513);
        else
            player:addTitle(PARAGON_OF_RED_MAGE_EXCELLENCE);
            player:addItem(12513);
            player:messageSpecial(ITEM_OBTAINED, 12513); -- Warlock's Chapeau
            player:setVar("peaceForTheSpiritCS",0);
            player:addFame(SANDORIA,AF3_FAME);
            player:completeQuest(SANDORIA,PEACE_FOR_THE_SPIRIT);
        end
    elseif (csid == 16) then
        player:setVar("Wait1DayM8-1_date",0);
        player:setVar("Mission8-1Completed",1);
    end
end;
