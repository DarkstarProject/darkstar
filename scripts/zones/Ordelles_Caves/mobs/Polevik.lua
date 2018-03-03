-----------------------------------
-- Area: Ordelles Caves
--  MOB: Polevik
-- Involved In Quest: Dark Puppet
-- !pos -51 0.1 3 193
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
end;

function onMobDeath(mob, player, isKiller)
    if (player:getVar("sharpeningTheSwordCS") == 3) then
        player:setVar("PolevikKilled",1);
    end
end;
