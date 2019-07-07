-----------------------------------
-- Area: Balga's Dais
-- MOB: Zuu Xowu the Darksmoke
-- BCNM Fight: Divine Punishers
-----------------------------------
mixins = {require("scripts/mixins/job_special")};

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 2):getShortID())
end

function onMobDeath(mob, player, isKiller)
end;
