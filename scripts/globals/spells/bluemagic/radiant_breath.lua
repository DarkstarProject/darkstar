-----------------------------------------
-- Spell: Radiant Breath
-- Deals light damage to enemies within a fan-shaped area of effect originating from the caster. Additional effect: Slow and Silence.
-- Spell cost: 116 MP
-- Monster Type: Wyverns
-- Spell Type: Magical (Light)
-- Blue Magic Points: 4
-- Stat Bonus: CHR+1, HP+5
-- Level: 54
-- Casting Time: 5.25 seconds
-- Recast Time: 33.75 seconds
-- Magic Bursts on: Transfixion, Fusion, Light
-- Combos: None
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    local multi = 2.90;
    if (caster:hasStatusEffect(dsp.effects.AZURE_LORE)) then
        multi = multi + 0.50;
    end
        params.multiplier = multi;
        params.tMultiplier = 1.5;
        params.duppercap = 69;
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.3;
        params.chr_wsc = 0.0;
    damage = BlueMagicalSpell(caster, target, spell, params, MND_BASED);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

    local params = {};

    params.diff = caster:getStat(MOD_INT) - target:getStat(MOD_INT);

    params.attribute = MOD_INT;

    params.skillType = BLUE_SKILL;

    params.bonus = 1.0;

    local resist = applyResistance(caster, target, spell, params);

    if (damage > 0 and resist > 0.3) then
    local typeEffect = dsp.effects.SLOW;
        target:delStatusEffect(typeEffect);
        target:addStatusEffect(typeEffect,35,0,getBlueEffectDuration(caster,resist,typeEffect));
    end
    
    if (damage > 0 and resist > 0.3) then
    local typeEffect = dsp.effects.SILENCE;
        target:delStatusEffect(typeEffect);
        target:addStatusEffect(typeEffect,25,0,getBlueEffectDuration(caster,resist,typeEffect));
    end
    
    return damage;
end;