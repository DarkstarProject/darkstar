-----------------------------------------
-- Spell: Sandspin
-- Deals earth damage to enemies within range. Additional Effect: Accuracy Down
-- Spell cost: 10 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 2
-- Stat Bonus: VIT+1
-- Level: 1
-- Casting Time: 1.5 seconds
-- Recast Time: 9.75 seconds
-- Magic Bursts on: Scission, Gravitation, Darkness
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
        params.damageType = dsp.damageType.EARTH
        params.multiplier = 1.0
        params.tMultiplier = 1.0
        params.duppercap = 13
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.2
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    local params = {}

    params.diff = caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT)

    params.attribute = dsp.mod.INT

    params.skillType = dsp.skill.BLUE_MAGIC

    params.bonus = 1.0

    local resist = applyResistance(caster, target, spell, params)

    if (damage > 0 and resist > 0.0625) then
        if (target:canGainStatusEffect(dsp.effect.ACCURACY_DOWN)) then
            target:addStatusEffect(dsp.effect.ACCURACY_DOWN,20,3,60)
        end
    end

    return damage
end
