-----------------------------------------
-- Spell: Blitzstrahl
-- Deals lightning damage to an enemy. Additional effect: "Stun"
-- Spell cost: 70 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Lightning)
-- Blue Magic Points: 4
-- Stat Bonus: DEX+3
-- Level: 44
-- Casting Time: 4.5 seconds
-- Recast Time: 29.25 seconds
-- Magic Bursts on: Impaction, Fragmentation, Light
-- Combos: None
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.multiplier = 1.5625
    params.tMultiplier = 1.0
    params.duppercap = 61
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.3
    params.mnd_wsc = 0.1
    params.chr_wsc = 0.0
    local damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    local params = {}
    params.diff = caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT)
    params.attribute = dsp.mod.INT
    params.skillType = dsp.skill.BLUE_MAGIC
    params.bonus = 1.0
    local resist = applyResistance(caster, target, spell, params)

    if (damage > 0 and resist > 0.0625) then
        local typeEffect = dsp.effect.STUN
        target:delStatusEffect(typeEffect) -- Wiki says it can overwrite itself or other binds
        target:addStatusEffect(typeEffect,1,0,getBlueEffectDuration(caster,resist,typeEffect))
    end

    return damage
end