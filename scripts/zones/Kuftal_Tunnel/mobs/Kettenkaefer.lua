-----------------------------------
-- Area: Kuftal Tunnel (174)
--   NM: Kettenkaefer
-- Note: Popped by qm3
-- !pos 204.052 10.25 96.414 174
-- Involved in Quest: The Potential Within
-----------------------------------
require("scripts/globals/wsquest")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS, -100)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180)
end

function onMobDeath(mob, player, isKiller)
    dsp.wsquest.handleWsnmDeath(dsp.wsquest.tachi_kasha, player)
end
