-----------------------------------
-- Area: Ru'Aun Gardens
--   NM: Suzaku
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/magic")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

-- Return the selected spell ID.
function onMonsterMagicPrepare(mob, target)
    -- Suzaku uses     Burn, Fire IV, Firaga III, Flare
    -- Let's give -ga3 a higher distribution than the others.
    local rnd = math.random()

    if rnd < 0.5 then
        return 176 -- firaga 3
    elseif rnd < 0.7 then
        return 147 -- fire 4
    elseif rnd < 0.9 then
        return 204 -- flare
    else
        return 235 -- burn
    end
end

function onAdditionalEffect(mob, target, damage)
    local dmg = math.random(110, 130)
    local params = {}
    params.bonusmab = 0
    params.includemab = false

    dmg = addBonusesAbility(mob, dsp.magic.ele.FIRE, target, dmg, params)
    dmg = dmg * applyResistanceAddEffect(mob, target, dsp.magic.ele.FIRE, 0)
    dmg = adjustForTarget(target, dmg, dsp.magic.ele.FIRE)
    dmg = finalMagicNonSpellAdjustments(mob, target, dsp.magic.ele.FIRE, dmg)

    return dsp.subEffect.FIRE_DAMAGE, dsp.msg.basic.ADD_EFFECT_DMG, dmg
end

function onMobDeath(mob, player, isKiller)
    player:showText(mob, ID.text.SKY_GOD_OFFSET + 8)
end