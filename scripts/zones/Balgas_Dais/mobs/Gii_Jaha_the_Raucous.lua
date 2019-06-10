-----------------------------------
-- Area: Balga's Dais
-- MOB: Gii Jaha the Raucous
-- BCNM Fight: Divine Punishers
-----------------------------------
mixins = {require("scripts/mixins/job_special")};

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 3):getShortID())
end

function onMobDeath(mob, player, isKiller)
end;
