-----------------------------------
--
-- Zone: Sauromugue_Champaign (120)
--
-----------------------------------
local ID = require("scripts/zones/Sauromugue_Champaign/IDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/zone");
-----------------------------------

function onChocoboDig(player, precheck)
    return dsp.chocoboDig.start(player, precheck)
end;

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.ROC);
    GetMobByID(ID.mob.ROC):setRespawnTime(math.random(900, 10800));
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if ( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( -103.991, -25.956, -425.221, 190);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 3;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
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
        lightCutsceneUpdate(player);  -- Quest: I Can Hear A Rainbow
    elseif (csid == 5) then
        if (player:getPreviousZone() == 200) then
            player:updateEvent(0,0,0,0,0,2);
        elseif (player:getPreviousZone() == 119) then
            player:updateEvent(0,0,0,0,0,4);
        elseif (player:getPreviousZone() == 110 or player:getPreviousZone() == 246 ) then
            player:updateEvent(0,0,0,0,0,3);
        end
    end
end;

function onEventFinish( player, csid, option)
    if (csid == 3) then
        lightCutsceneFinish(player);  -- Quest: I Can Hear A Rainbow
    end
end;