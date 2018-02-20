-----------------------------------
--
-- Zone: Rolanberry_Fields (110)
--
-----------------------------------
package.loaded["scripts/zones/Rolanberry_Fields/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Rolanberry_Fields/TextIDs");
require("scripts/zones/Rolanberry_Fields/MobIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/zone");
-----------------------------------

local itemMap =
{
    -- itemid, abundance, requirement
                    { 4450, 30, DIGREQ_NONE },
                    { 4566, 7, DIGREQ_NONE },
                    { 768, 164, DIGREQ_NONE },
                    { 748, 15, DIGREQ_NONE },
                    { 846, 97, DIGREQ_NONE },
                    { 17396, 75, DIGREQ_NONE },
                    { 749, 45, DIGREQ_NONE },
                    { 739, 3, DIGREQ_NONE },
                    { 17296, 216, DIGREQ_NONE },
                    { 4448, 15, DIGREQ_NONE },
                    { 638, 82, DIGREQ_NONE },
                    { 106, 37, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },  -- all crystals
                    { 656, 200, DIGREQ_BURROW },
                    { 750, 100, DIGREQ_BURROW },
                    { 4375, 60, DIGREQ_BORE },
                    { 4449, 15, DIGREQ_BORE },
                    { 4374, 52, DIGREQ_BORE },
                    { 4373, 10, DIGREQ_BORE },
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
    UpdateNMSpawnPoint(SIMURGH);
    GetMobByID(SIMURGH):setRespawnTime(math.random(900, 10800));
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if ( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( -381.747, -31.068, -788.092, 211);
    end

    if ( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
        cs = 2;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 4;
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

function onGameHour(zone)
    local vanadielHour = VanadielHour();

    --Silk Caterpillar should spawn every 6 hours from 03:00
    --this is approximately when the Jeuno-Bastok airship is flying overhead towards Jeuno.
    if (vanadielHour % 6 == 3 and not GetMobByID(SILK_CATERPILLAR):isSpawned()) then
        -- Despawn set to 210 seconds (3.5 minutes, approx when the Jeuno-Bastok airship is flying back over to Bastok).
        SpawnMob(SILK_CATERPILLAR, 210);
    end
end;

function onEventUpdate( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if ( csid == 2) then
        lightCutsceneUpdate( player);  -- Quest: I Can Hear A Rainbow
    elseif (csid == 4) then
        if (player:getZPos() <  75) then
            player:updateEvent(0,0,0,0,0,1);
        else
            player:updateEvent(0,0,0,0,0,2);
        end
    end
end;

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if ( csid == 2) then
        lightCutsceneFinish( player);  -- Quest: I Can Hear A Rainbow
    end
end;
