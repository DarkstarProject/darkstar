-----------------------------------
-- Area: Balga's Dais
-- MOB: Aa Nawu the Thunderblade
-- BCNM Fight: Divine Punishers
-----------------------------------
mixins = {require("scripts/mixins/job_special")};

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 4):getShortID())
end

function onMobDeath(mob, player, isKiller)
end;
