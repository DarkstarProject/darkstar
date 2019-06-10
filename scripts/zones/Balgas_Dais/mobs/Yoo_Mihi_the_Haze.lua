-----------------------------------
-- Area: Balga's Dais
-- MOB: Yoo Mihi the Haze
-- BCNM Fight: Divine Punishers
-----------------------------------
mixins = {require("scripts/mixins/job_special")};

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 5):getShortID())
end

function onMobDeath(mob, player, isKiller)
end;
