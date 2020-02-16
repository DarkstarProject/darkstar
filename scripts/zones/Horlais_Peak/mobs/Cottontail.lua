-----------------------------------
-- Area: Horlais Peak
--  Mob: Cottontail
-- BCNM: Tails of Woe
-----------------------------------

require("scripts/globals/status")

function onMobInitialize(mob)
   mob:setMobMod(tpz.mobMod.NO_DROPS, 1) -- works
   
end;

function onMobSpawn(mob) 
 	mob:setMobMod(tpz.mobMod.CHARMABLE, 1)
 	--mob:addMod(tpz.effect.ACCURACY_BOOST,1)--bunnies should be fairly accurate on the nm, but are not.
end;

function onMobDeath(mob, player, isKiller)
end;