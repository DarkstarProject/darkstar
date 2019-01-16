-----------------------------------
-- Area: Ru'Aun Gardens
--   NM: Byakko
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/magic")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    local dmg = math.random(35, 50)
    local params = {}
    params.bonusmab = 0
    params.includemab = false

    dmg = addBonusesAbility(mob, dsp.magic.ele.LIGHT, target, dmg, params)
    dmg = dmg * applyResistanceAddEffect(mob, target, dsp.magic.ele.LIGHT, 0)
    dmg = adjustForTarget(target, dmg, dsp.magic.ele.LIGHT)
    dmg = finalMagicNonSpellAdjustments(mob, target, dsp.magic.ele.LIGHT, dmg)

    return dsp.subEffect.LIGHT_DAMAGE, dsp.msg.basic.ADD_EFFECT_DMG, dmg
end

function onMobDeath(mob, player, isKiller)
    player:showText(mob, ID.text.SKY_GOD_OFFSET + 12)
end