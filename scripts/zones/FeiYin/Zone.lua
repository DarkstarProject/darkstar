-----------------------------------
--
-- Zone: FeiYin (204)
--
-----------------------------------
package.loaded["scripts/zones/FeiYin/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/FeiYin/TextIDs");
require("scripts/zones/FeiYin/MobIDs");
require("scripts/globals/conquest");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(CAPRICIOUS_CASSIE);
    GetMobByID(CAPRICIOUS_CASSIE):setRespawnTime(math.random(900, 10800));

    UpdateTreasureSpawnPoint(FEIYIN_TREASURE_CHEST);
end;

function onZoneIn(player,prevZone)
    local currentMission = player:getCurrentMission(player:getNation());
    local MissionStatus = player:getVar("MissionStatus");
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(99.98,-1.768,275.993,70);
    end

    if (player:getVar("peaceForTheSpiritCS") == 1 and not player:hasItem(1093)) then -- Antique Coin
        SpawnMob(MISER_MURPHY); -- RDM AF
    end

    if (prevZone == 111 and currentMission == 14 and MissionStatus == 10) then
        cs = 1; -- MISSION 5-1
    elseif (currentMission == THE_HEIR_TO_THE_LIGHT and MissionStatus == 2) then
        cs = 23; -- San d'Oria 9-2
    elseif (player:getCurrentMission(ACP) == THOSE_WHO_LURK_IN_SHADOWS_I) then
        cs = 29;
    elseif (prevZone == 206 and player:getQuestStatus(BASTOK,THE_FIRST_MEETING) == QUEST_ACCEPTED and not player:hasKeyItem(dsp.ki.LETTER_FROM_DALZAKK)) then
        cs = 16; -- MNK AF
    elseif (prevZone == 111 and player:getQuestStatus(SANDORIA,PIEUJE_S_DECISION) == QUEST_ACCEPTED and player:getVar("pieujesDecisionCS") == 0) then
        cs = 19; -- WHM AF
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 1) then
        player:setVar("MissionStatus",11);
    elseif (csid == 16) then
        player:addKeyItem(dsp.ki.LETTER_FROM_DALZAKK);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.LETTER_FROM_DALZAKK);
    elseif (csid == 19) then
        player:setVar("pieujesDecisionCS",1);
    elseif (csid == 23) then
        player:setVar("MissionStatus",3);
    elseif (csid == 29) then
        player:completeMission(ACP,THOSE_WHO_LURK_IN_SHADOWS_I);
        player:addMission(ACP,THOSE_WHO_LURK_IN_SHADOWS_II);
    end
end;