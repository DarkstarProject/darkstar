-----------------------------------
-- Area: Balga's Dais
--  Mob: Myrmidon Epa-epa
-- BCNM: Royal Succession
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(dsp.mod.SLEEPRES, 50)
end

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 4):getShortID())
end

function onMobDeath(mob, player, isKiller)
end