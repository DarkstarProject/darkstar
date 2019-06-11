-----------------------------------
-- Area: RoMaeve
--   NM: Martinet
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.AUTO_SPIKES, 1)
    mob:addStatusEffect(dsp.effect.SHOCK_SPIKES, 55, 0, 0)
    mob:getStatusEffect(dsp.effect.SHOCK_SPIKES):setFlag(dsp.effectFlag.DEATH)
end

function onSpikesDamage(mob, target, damage)
    local INT_diff = mob:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT)

    if INT_diff > 20 then
        INT_diff = 20 + (INT_diff - 20) * 0.5 -- INT above 20 is half as effective.
    end

    local dmg = (damage + INT_diff) * 0.5 -- INT adjustment and base damage averaged together.
    local params = {}
    params.bonusmab = 0
    params.includemab = false
    dmg = addBonusesAbility(mob, dsp.magic.ele.THUNDER, target, dmg, params)
    dmg = dmg * applyResistanceAddEffect(mob, target, dsp.magic.ele.THUNDER, 0)
    dmg = adjustForTarget(target, dmg, dsp.magic.ele.THUNDER)
    dmg = finalMagicNonSpellAdjustments(mob, target, dsp.magic.ele.THUNDER, dmg)

    if dmg < 0 then
        dmg = 0
    end

    return dsp.subEffect.SHOCK_SPIKES, dsp.msg.basic.SPIKES_EFFECT_DMG, dmg

end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    -- UpdateNMSpawnPoint(mob:getID())
    -- mob:setRespawnTime(math.random((?), (?))) -- Uncertain repop time
end
