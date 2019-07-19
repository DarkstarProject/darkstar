-----------------------------------
-- Area: Balga's Dais
--  Mob: Gii Jaha the Raucous
-- BCNM: Divine Punishers
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 3):getShortID())
end

function onMobDeath(mob, player, isKiller)
end;
