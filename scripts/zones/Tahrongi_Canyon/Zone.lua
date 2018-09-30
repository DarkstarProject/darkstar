-----------------------------------
--
-- Zone: Tahrongi_Canyon (117)
--
-----------------------------------
local ID = require("scripts/zones/Tahrongi_Canyon/IDs")
require("scripts/globals/icanheararainbow")
require("scripts/globals/chocobo_digging")
require("scripts/globals/excavation")
require("scripts/globals/conquest")
require("scripts/globals/weather")
require("scripts/globals/zone")
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
                    { 1255, 10, DIGREQ_NONE }, -- all ores
                    { 656, 95, DIGREQ_BURROW },
                    { 749, 26, DIGREQ_BURROW },
                    { 751, 33, DIGREQ_BURROW },
                    { 750, 89, DIGREQ_BURROW },
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

local messageArray = { ID.text.DIG_THROW_AWAY, ID.text.FIND_NOTHING, ID.text.ITEM_OBTAINED };

function onChocoboDig(player, precheck)
    return chocoboDig(player, itemMap, precheck, messageArray);
end;

function onInitialize(zone)
    dsp.excavation.movePoint(GetNPCByID(ID.npc.EXCAVATION[1]), zone:getID()) -- pick a random excavation point
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( 442.781, -1.641, -40.144, 160);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 35;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 37;
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter( player, region)
end;

function onEventUpdate( player, csid, option)
    if (csid == 35) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 37) then
        if (player:getPreviousZone() == 116 or player:getPreviousZone() == 118) then
            player:updateEvent(0,0,0,0,0,7);
        elseif (player:getPreviousZone() == 198) then
            player:updateEvent(0,0,0,0,0,6);
        end
    end
end;

function onEventFinish( player, csid, option)
    if (csid == 35) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;

function isHabrokWeather(weather)
    return (weather == dsp.weather.DUST_STORM or weather == dsp.weather.SAND_STORM or weather == dsp.weather.WIND or weather == dsp.weather.GALES);
end

function onZoneWeatherChange(weather)
    local habrok = GetMobByID(ID.mob.HABROK);
    if (habrok:isSpawned() and not isHabrokWeather(weather)) then
        DespawnMob(ID.mob.HABROK);
    elseif (not habrok:isSpawned() and isHabrokWeather(weather) and os.time() > habrok:getLocalVar("pop")) then
        SpawnMob(ID.mob.HABROK);
    end
end;