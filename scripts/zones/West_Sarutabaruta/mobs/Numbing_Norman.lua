-----------------------------------
-- Area: West Sarutabaruta
--   NM: Numbing Norman
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob,target,damage)
    -- Guesstimating 1 in 4 chance to paralysis on melee.
    if math.random(1,100) >= 25 or target:hasStatusEffect(dsp.effect.PARALYSIS) then
        return 0,0,0
    else
        local duration = math.random(5, 15)
        target:addStatusEffect(dsp.effect.PARALYSIS, 5, 3, duration)
        return dsp.subEffect.PARALYSIS, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.PARALYSIS
    end
end

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 61, 2, dsp.regime.type.FIELDS)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
end
