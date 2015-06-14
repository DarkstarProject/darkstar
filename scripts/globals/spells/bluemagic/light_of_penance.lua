-----------------------------------------
-- Spell: Light of Penance
-- Reduces an enemy's TP. Additional effect: Blindness and "Bind"
-- Spell cost: 53 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Light)
-- Blue Magic Points: 5
-- Stat Bonus: CHR+1, HP+15
-- Level: 58
-- Casting Time: 3 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Transfixion, Fusion, and Light
-- Combos: Auto Refresh
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

    if(damage > 0 and resist > 0.3) then
        local typeEffect = EFFECT_BLINDNESS;
        target:delStatusEffect(typeEffect);
        target:addStatusEffect(typeEffect,10,0,getBlueEffectDuration(caster,resist,typeEffect));
    end
    
    if(damage > 0 and resist > 0.3) then    
        local typeEffect = EFFECT_BIND;
        target:delStatusEffect(typeEffect);
        target:addStatusEffect(typeEffect,1,0,getBlueEffectDuration(caster,resist,typeEffect));
    end

    return EFFECT_BLINDNESS;
end;