-----------------------------------
--
-- Zone: Valkurm_Dunes (103)
--
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Valkurm_Dunes/TextIDs");
require("scripts/zones/Valkurm_Dunes/MobIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/weather");
require("scripts/globals/status");

local itemMap = {
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
    SetRegionalConquestOverseers(zone:getRegionID())
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( 60.989, -4.898, -151.001, 198);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 3;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 5;
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
    if (csid == 3) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 5) then
        if (player:getZPos() > 45) then
            if (player:getZPos() > -301) then
                player:updateEvent(0,0,0,0,0,1);
            else
                player:updateEvent(0,0,0,0,0,3);
            end
        end
    end
end;

function onEventFinish( player, csid, option)
    if (csid == 3) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;

function onZoneWeatherChange(weather)
    local qm1 = GetNPCByID(VALKURM_SUNSAND_QM); -- Quest: An Empty Vessel
    if (weather == dsp.weather.DUST_STORM) then
        qm1:setStatus(dsp.status.NORMAL);
    else
        qm1:setStatus(dsp.status.DISAPPEAR);
    end
end;
