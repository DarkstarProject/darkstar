-----------------------------------
--
-- Zone: Western_Altepa_Desert (125)
--
-----------------------------------
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Western_Altepa_Desert/TextIDs");
require("scripts/zones/Western_Altepa_Desert/MobIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/weather");
require("scripts/globals/zone");
-----------------------------------

local itemMap =
{
    -- itemid, abundance, requirement
                    { 880, 224, DIGREQ_NONE },
                    { 887, 39, DIGREQ_NONE },
                    { 645, 14, DIGREQ_NONE },
                    { 893, 105, DIGREQ_NONE },
                    { 737, 17, DIGREQ_NONE },
                    { 643, 64, DIGREQ_NONE },
                    { 17296, 122, DIGREQ_NONE },
                    { 942, 6, DIGREQ_NONE },
                    { 642, 58, DIGREQ_NONE },
                    { 864, 22, DIGREQ_NONE },
                    { 843, 4, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },  -- all crystals
                    { 845, 122, DIGREQ_BURROW },
                    { 844, 71, DIGREQ_BURROW },
                    { 1845, 33, DIGREQ_BURROW },
                    { 838, 11, DIGREQ_BURROW },
                    { 902, 6, DIGREQ_BORE },
                    { 886, 3, DIGREQ_BORE },
                    { 867, 3, DIGREQ_BORE },
                    { 1587, 19, DIGREQ_BORE },
                    { 888, 25, DIGREQ_BORE },
                    { 1586, 8, DIGREQ_BORE },
                    { 885, 10, DIGREQ_BORE },
                    { 866, 3, DIGREQ_BORE },
                    { 4570, 10, DIGREQ_MODIFIER },
                    { 4487, 11, DIGREQ_MODIFIER },
                    { 4409, 12, DIGREQ_MODIFIER },
                    { 1188, 10, DIGREQ_MODIFIER },
                    { 4532, 12, DIGREQ_MODIFIER },
};

local messageArray = { DIG_THROW_AWAY, FIND_NOTHING, ITEM_OBTAINED };

function onChocoboDig(player, precheck)
    return chocoboDig(player, itemMap, precheck, messageArray);
end;

function onInitialize(zone)
    UpdateNMSpawnPoint(KING_VINEGARROON);
    GetMobByID(KING_VINEGARROON):setRespawnTime(math.random(900, 10800));
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if ( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( -19.901, 13.607, 440.058, 78);
    end

    if ( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
        cs = 2;
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onRegionEnter( player, region)
end;

function onEventUpdate( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if ( csid == 2) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    end
end;

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 2) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;

function onZoneWeatherChange(weather)
    if (GetMobAction(KING_VINEGARROON) == 24 and (weather == WEATHER_DUST_STORM or weather == WEATHER_SAND_STORM)) then
        SpawnMob(KING_VINEGARROON); -- King Vinegarroon
    elseif (GetMobAction(KING_VINEGARROON) == 16 and (weather ~= WEATHER_DUST_STORM and weather ~= WEATHER_SAND_STORM)) then
        DespawnMob(KING_VINEGARROON);
    end
end;