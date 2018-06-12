----------------------------------
-- Area: Ifrit's Cauldron (205)
--  MOB: Cailleach Bheur
--   ID: 17617165
-- Note: Popped by qm3
-- Involved in Quest: Blood and Glory
-- !pos 117.074 19.403 144.834 205
-----------------------------------
require("scripts/globals/wsquest")

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS,-100)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN,180)
end

function onMobDeath(mob,player,isKiller)
    dsp.wsquest.handleWsnmDeath(dsp.wsquest.retribution,player)
end