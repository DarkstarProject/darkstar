-----------------------------------------
-- Spell: Bad Breath
-- Deals earth damage that inflicts multiple status ailments on enemies within a fan-shaped area originating from the caster
-- Spell cost: 212 MP
-- Monster Type: Plantoids
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 5
-- Stat Bonus: INT+2, MND+2
-- Level: 61
-- Casting Time: 8.75 seconds
-- Recast Time: 120 seconds
-- Magic Bursts on: Scission, Gravitation, Darkness
-- Combos: Fast Cast
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
    local multi = 2.08;
    if (caster:hasStatusEffect(EFFECT_AZURE_LORE)) then
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

    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT) - target:getStat(MOD_INT),BLUE_SKILL,1.0);

    if (damage > 0 and resist > 0.3) then
        local typeEffect = EFFECT_PARALYSIS;
        target:delStatusEffect(typeEffect);
        target:addStatusEffect(typeEffect,25,0,getBlueEffectDuration(caster,resist,typeEffect));
    end
    
    if (damage > 0 and resist > 0.3) then
    local typeEffect = EFFECT_WEIGHT;
        target:delStatusEffect(typeEffect);
        target:addStatusEffect(typeEffect,25,0,getBlueEffectDuration(caster,resist,typeEffect));
    end
    
    if (damage > 0 and resist > 0.3) then
    local typeEffect = EFFECT_POISON;
        target:delStatusEffect(typeEffect); 
        target:addStatusEffect(typeEffect,4,0,getBlueEffectDuration(caster,resist,typeEffect));
    end
    
    if (damage > 0 and resist > 0.3) then
    local typeEffect = EFFECT_SLOW;
        target:delStatusEffect(typeEffect);
        target:addStatusEffect(typeEffect,25,0,getBlueEffectDuration(caster,resist,typeEffect));
    end
    
    if (damage > 0 and resist > 0.3) then
    local typeEffect = EFFECT_SILENCE;
        target:delStatusEffect(typeEffect);
        target:addStatusEffect(typeEffect,25,0,getBlueEffectDuration(caster,resist,typeEffect));
    end
    
    if (damage > 0 and resist > 0.3) then
    local typeEffect = EFFECT_BIND;
        target:delStatusEffect(typeEffect);
        target:addStatusEffect(typeEffect,1,0,getBlueEffectDuration(caster,resist,typeEffect));
    end
        if (damage > 0 and resist > 0.3) then
    local typeEffect = EFFECT_BLINDNESS;
        target:delStatusEffect(typeEffect);
        target:addStatusEffect(typeEffect,25,0,getBlueEffectDuration(caster,resist,typeEffect));
    end
    
    return damage;

end;