----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Megapod Megalops
--   ID: 17649861
-- Note: Popped by qm1
-- !pos 115 14.68 164.1 213
-- Involved in Quest: Bugi Soden
-----------------------------------
require("scripts/globals/wsquest")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS, -100)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180)
end

function onMobDeath(mob, player, isKiller)
    dsp.wsquest.handleWsnmDeath(dsp.wsquest.blade_ku, player)
end