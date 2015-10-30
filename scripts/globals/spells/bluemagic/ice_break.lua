-----------------------------------------
-- Spell: Ice Break
-- Deals ice damage to enemies within range. Additional Effect: "Bind"
-- Spell cost: 142 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 3
-- Stat Bonus: INT+1
-- Level: 50
-- Casting Time: 5.25 seconds
-- Recast Time: 33.75 seconds
-- Magic Bursts on: Induration, Distortion, and Darkness
-- Combos: Magic Defense Bonus
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
    
    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT) - target:getStat(MOD_INT),BLUE_SKILL,1.0);
    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.multiplier = 2.25;
        params.tMultiplier = 1.0;
        params.duppercap = 69; 
        params.str_wsc = 0.0;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.3;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

    if (damage > 0 and resist > 0.0625) then
        local typeEffect = EFFECT_BIND;
        target:delStatusEffect(typeEffect); -- Wiki says it can overwrite itself or other binds
        target:addStatusEffect(typeEffect,1,0,getBlueEffectDuration(caster,resist,typeEffect));
    end
    
    return damage;
end;    