-----------------------------------
-- Area: Beadeaux
--  MOB: Copper Quadav
-- Involved in Mission 3-1 (Bastok)
-----------------------------------
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Beadeaux/TextIDs");
require("scripts/globals/missions");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    if (player:getCurrentMission(BASTOK) == THE_FOUR_MUSKETEERS) then
        local missionStatus = player:getVar("MissionStatus");

        if (missionStatus > 1 and missionStatus < 22) then
            player:setVar("MissionStatus", missionStatus + 1)
        end
    end

end;