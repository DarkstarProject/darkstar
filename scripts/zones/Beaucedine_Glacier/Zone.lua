-----------------------------------
--
-- Zone: Beaucedine_Glacier (111)
--
-----------------------------------
package.loaded[ "scripts/zones/Beaucedine_Glacier/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Beaucedine_Glacier/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/icanheararainbow");
require("scripts/globals/zone");
require("scripts/globals/conquest");
-----------------------------------

function onInitialize(zone)
    SetRegionalConquestOverseers(zone:getRegionID())
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if (prevZone == 134) then -- warp player to a correct position after dynamis
        player:setPos(-284.751,-39.923,-422.948,235);
    end

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( -247.911, -82.165, 260.207, 248);
    end

    if (player:getCurrentMission( COP) == DESIRES_OF_EMPTINESS and player:getVar( "PromathiaStatus") == 9) then
        cs = 206;
    elseif (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 114;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 116;
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
    if (csid == 114) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 116) then
        player:updateEvent(0,0,0,0,0,4);
    end
end;

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 206) then
        player:setVar("PromathiaStatus",10);
    elseif (csid == 114) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;

function onZoneWeatherChange(weather)
    local mirrorPond = GetNPCByID(17232196); -- Quest: Love And Ice

    if (weather == WEATHER_GLOOM or weather == WEATHER_DARKNESS) then
        mirrorPond:setStatus(STATUS_NORMAL);
    else
        mirrorPond:setStatus(STATUS_DISAPPEAR);
    end
end;