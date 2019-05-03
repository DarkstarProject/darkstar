-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Wuur the Sandcomber
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ALWAYS_AGGRO, 1) -- "Will aggro any player, regardless of level"
    mob:setMod(dsp.mod.REGEN, 35) -- "Strong Auto Regen effect (around 30-40 HP)"
end

function onMobDeath(mob, player, isKiller)
end
