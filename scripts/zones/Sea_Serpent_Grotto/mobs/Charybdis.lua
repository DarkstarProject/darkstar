----------------------------------
-- Area: Sea Serpent Grotto (176)
--   NM: Charybdis
-- !pos -152 48 -328 176
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.MULTI_HIT, 5)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end