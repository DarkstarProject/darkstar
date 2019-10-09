-----------------------------------
--
-- Zone: Uleguerand_Range (5)
--
-----------------------------------
local ID = require("scripts/zones/Uleguerand_Range/IDs");
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/weather");
require("scripts/globals/status");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.JORMUNGAND);
    GetMobByID(ID.mob.JORMUNGAND):setRespawnTime(math.random(86400, 259200));
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(363.025,16,-60,12);
    end
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.DAWN and player:getCharVar("COP_louverance_story")== 1 ) then
        cs=17;
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 17) then
        player:setVar("COP_louverance_story",2);
    end
end;

function onZoneWeatherChange(weather)
    local waterfall = GetNPCByID(ID.npc.WATERFALL);
    if (weather == dsp.weather.SNOW or weather == dsp.weather.BLIZZARDS) then
        if (waterfall:getAnimation() ~= dsp.anim.CLOSE_DOOR) then
            waterfall:setAnimation(dsp.anim.CLOSE_DOOR);
        end
    else
        if (waterfall:getAnimation() ~= dsp.anim.OPEN_DOOR) then
            waterfall:setAnimation(dsp.anim.OPEN_DOOR);
        end
    end
end;
