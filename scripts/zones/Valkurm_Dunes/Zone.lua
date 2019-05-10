-----------------------------------
--
-- Zone: Valkurm_Dunes (103)
--
-----------------------------------
local ID = require("scripts/zones/Valkurm_Dunes/IDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/weather");
require("scripts/globals/status");
-----------------------------------

function onChocoboDig(player, precheck)
    return dsp.chocoboDig.start(player, precheck)
end;

function onInitialize(zone)
    dsp.conq.setRegionalConquestOverseers(zone:getRegionID())
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( 60.989, -4.898, -151.001, 198);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 3;
    elseif (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.VAIN and player:getVar("MissionStatus") ==1) then
        cs = 5;
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
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
    local qm1 = GetNPCByID(ID.npc.SUNSAND_QM); -- Quest: An Empty Vessel
    if (weather == dsp.weather.DUST_STORM) then
        qm1:setStatus(dsp.status.NORMAL);
    else
        qm1:setStatus(dsp.status.DISAPPEAR);
    end
end;
