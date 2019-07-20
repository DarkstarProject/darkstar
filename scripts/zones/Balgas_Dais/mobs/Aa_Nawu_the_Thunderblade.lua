-----------------------------------
-- Area: Balga's Dais
--  Mob: Aa Nawu the Thunderblade
-- BCNM: Divine Punishers
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 4):getShortID())
end

function onMobDeath(mob, player, isKiller)
end;
