-----------------------------------
-- Area: Balga's Dais
-- MOB: Cuu Doko the Blizzard
-- BCNM Fight: Divine Punishers
-----------------------------------
mixins = {require("scripts/mixins/job_special")};

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 1):getShortID())
end

function onMobDeath(mob, player, isKiller)
end;
