-----------------------------------
-- Area: Horlais Peak
--  Mob: Mind's-eyed Klugwug
-- BCNM Fight: Dismemberment Brigade
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn (mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, GetMobByID(mob:getID() - 5):getShortID())
end

function onMobDeath(mob, player, isKiller)
end