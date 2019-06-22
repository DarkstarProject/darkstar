-----------------------------------
--
-- Zone: East_Ronfaure (101)
--
-----------------------------------
local ID = require("scripts/zones/East_Ronfaure/IDs")
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/quests");
require("scripts/globals/helm")
require("scripts/globals/zone");
-----------------------------------

function onChocoboDig(player, precheck)
    return dsp.chocoboDig.start(player, precheck)
end;

function onInitialize(zone)
    dsp.helm.initZone(zone, dsp.helm.type.LOGGING)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(200.015,-3.187,-536.074,187);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 21;
    elseif (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.VAIN and player:getVar("MissionStatus") ==1) then
        cs = 23;
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
    if (csid == 21) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 23) then
        if (player:getYPos() >= -22) then
            player:updateEvent(0,0,0,0,0,7);
        else
            player:updateEvent(0,0,0,0,0,6);
        end
    end
end;

function onEventFinish(player,csid,option)
    if (csid == 21) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;