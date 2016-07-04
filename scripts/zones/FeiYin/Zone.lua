-----------------------------------
--
-- Zone: FeiYin (204)
--
-----------------------------------
package.loaded["scripts/zones/FeiYin/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/zone");
require("scripts/zones/FeiYin/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local tomes = {17613263,17613264};

    SetGroundsTome(tomes);

    -- Capricious Cassie
    SetRespawnTime(17613130, 900, 10800);

    UpdateTreasureSpawnPoint(17613238);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local pNation = player:getNation();
    local currentMission = player:getCurrentMission(pNation);
    local MissionStatus = player:getVar("MissionStatus");
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(99.98,-1.768,275.993,70);
    end

    if (player:getVar("peaceForTheSpiritCS") == 1 and player:hasItem(1093) == false) then -- Antique Coin
        SpawnMob(17612849); -- RDM AF
    end

    if (prevZone == 111 and currentMission == 14 and MissionStatus == 10) then
        cs = 0x0001; -- MISSION 5-1
    elseif (currentMission == THE_HEIR_TO_THE_LIGHT and MissionStatus == 2) then
        cs = 0x0017; -- San d'Oria 9-2 
    elseif (player:getCurrentMission(ACP) == THOSE_WHO_LURK_IN_SHADOWS_I) then
        cs = 0x001D;
    elseif (prevZone == 206 and player:getQuestStatus(BASTOK,THE_FIRST_MEETING) == QUEST_ACCEPTED and player:hasKeyItem(LETTER_FROM_DALZAKK) == false) then
        cs = 0x0010; -- MNK AF
    elseif (prevZone == 111 and player:getQuestStatus(SANDORIA,PIEUJE_S_DECISION) == QUEST_ACCEPTED and player:getVar("pieujesDecisionCS") == 0) then
        cs = 0x0013; -- WHM AF
        player:setVar("pieujesDecisionCS",1);

    end

    return cs;
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
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
    if (csid == 0x0001) then
        player:setVar("MissionStatus",11);
    elseif (csid == 0x0010) then
        player:addKeyItem(LETTER_FROM_DALZAKK);
        player:messageSpecial(KEYITEM_OBTAINED,LETTER_FROM_DALZAKK);
    elseif (csid == 0x0017) then
        player:setVar("MissionStatus",3);
    elseif (csid == 0x001D) then
        player:completeMission(ACP,THOSE_WHO_LURK_IN_SHADOWS_I);
        player:addMission(ACP,THOSE_WHO_LURK_IN_SHADOWS_II);
    end
end;