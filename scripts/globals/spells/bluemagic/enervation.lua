-----------------------------------------
-- Spell: Enervation
-- Lowers the defense and magical defense of enemies within range
-- Spell cost: 48 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 5
-- Stat Bonus: HP-5, MP+5
-- Level: 67
-- Casting Time: 6 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Compression, Gravitation, and Darkness
-- Combos: Counter
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

    if(damage > 0 and resist > 0) then
        local typeEffect = EFFECT_DEFENSE_DOWN;
        target:delStatusEffect(typeEffect);
        target:addStatusEffect(typeEffect,10,0,getBlueEffectDuration(caster,resist,typeEffect));
    end
    
    if(damage > 0 and resist > 0) then    
        local typeEffect = EFFECT_MAGIC_DEF_DOWN;
        target:delStatusEffect(typeEffect);
        target:addStatusEffect(typeEffect,8,0,getBlueEffectDuration(caster,resist,typeEffect));
    end

    return EFFECT_DEFENSE_DOWN;
end;