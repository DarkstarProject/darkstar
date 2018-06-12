-----------------------------------
-- Area: Ordelles Caves
--  MOB: Gerwitz's Soul
-- Involved In Quest: Dark Puppet
-- !pos -51 0.1 3 193
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    if (player:getVar("darkPuppetCS") >= 4) then
        player:setVar("darkPuppetCS",5);
    end

end;