-----------------------------------
-- Area: Beadeaux
--  MOB: Copper Quadav
-- Note: PH for Da'Dha Hundredmask
-- Involved in Mission 3-1 (Bastok)
-----------------------------------
local ID = require("scripts/zones/Beadeaux/IDs");
require("scripts/globals/missions");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(BASTOK) == dsp.mission.id.bastok.THE_FOUR_MUSKETEERS) then
        local missionStatus = player:getVar("MissionStatus");

        if (missionStatus > 1 and missionStatus < 22) then
            player:setVar("MissionStatus", missionStatus + 1)
        end
    end
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.DA_DHA_HUNDREDMASK_PH,10,5400); -- 90 minutes
end;
