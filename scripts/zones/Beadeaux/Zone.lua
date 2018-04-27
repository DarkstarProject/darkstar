-----------------------------------
--
-- Zone: Beadeaux (147)
--
-----------------------------------
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Beadeaux/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/titles");
-----------------------------------

function onInitialize(zone)
    -- The Afflictor System (RegionID, X, Radius, Z)
    zone:registerRegion(1, -163, 10, -137, 0,0,0); -- 17379798 The Afflictor
    zone:registerRegion(2, -209, 10, -131, 0,0,0); -- 17379799 The Afflictor
    zone:registerRegion(3, -140, 10,   20, 0,0,0); -- 17379800 The Afflictor
    zone:registerRegion(4,  261, 10,  140, 0,0,0); -- 17379801 The Afflictor
    zone:registerRegion(5,  340, 10,  100, 0,0,0); -- 17379802 The Afflictor
    zone:registerRegion(6,  380, 10,   60, 0,0,0); -- 17379803 The Afflictor

    UpdateTreasureSpawnPoint(17379842);
    UpdateTreasureSpawnPoint(17379843);

end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(387.382,38.029,19.694,3);
    end

    if (prevZone == 109) then
        if (player:getQuestStatus(BASTOK, BLADE_OF_DARKNESS) == QUEST_ACCEPTED and player:getVar("ChaosbringerKills") >= 100) then
            cs = 121;
        elseif (player:getCurrentMission(BASTOK) == THE_FOUR_MUSKETEERS and player:getVar("MissionStatus") == 1) then
            cs = 120;
        elseif (player:getMainJob() == dsp.jobs.DRK and player:getQuestStatus(BASTOK,DARK_PUPPET) == QUEST_COMPLETED and player:getQuestStatus(BASTOK,BLADE_OF_EVIL) == QUEST_AVAILABLE) then
            cs = 122;
        end
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
    if (region:GetRegionID() <= 6) then
        if (player:hasStatusEffect(dsp.effects.CURSE_I) == false and player:hasStatusEffect(dsp.effects.SILENCE) == false) then
            player:addStatusEffect(dsp.effects.CURSE_I,50,0,300);
            if (player:getQuestStatus(BASTOK,THE_CURSE_COLLECTOR) == QUEST_ACCEPTED and player:getVar("cCollectCurse") == 0) then
                player:setVar("cCollectCurse",1);
            end
        end
    end
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

    if (csid == 121) then
        player:unlockJob(dsp.jobs.DRK);
        player:addTitle(DARK_SIDER);
        player:setVar("ZeruhnMines_Zeid_CS", 0);
        player:messageSpecial(YOU_CAN_NOW_BECOME_A_DARK_KNIGHT);
        player:completeQuest(BASTOK, BLADE_OF_DARKNESS);
    elseif (csid == 120) then
        player:setVar("MissionStatus",2);
        player:setPos(-297, 1, 96, 1);
    elseif (csid == 122) then
        player:addQuest(BASTOK,BLADE_OF_EVIL);
    end

end;
