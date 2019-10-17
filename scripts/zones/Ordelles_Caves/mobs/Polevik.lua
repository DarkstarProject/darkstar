-----------------------------------
-- Area: Ordelles Caves
--   NM: Polevik
-- Involved In Quest: Dark Puppet
-- !pos -51 0.1 3 193
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180)
end

function onMobDeath(mob, player, isKiller)
    if player:getCharVar("sharpeningTheSwordCS") == 3 then
        player:setCharVar("PolevikKilled", 1)
    end
end
