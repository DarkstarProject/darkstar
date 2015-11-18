-----------------------------------------
-- Spell: Triumphant Roar
-- Enhances Attack
-- Spell cost: 36 MP
-- Monster Type: Demon
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 3
-- Stat Bonus: STR+3
-- Level: 71
-- Casting Time: 3 seconds
-- Recast Time: 90 seconds
-- 
-- Combos: None
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
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

    local typeEffect = EFFECT_ATTACK_BOOST
    local power = 15    
    local duration = 90;

    if (caster:hasStatusEffect(EFFECT_DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);

        if (diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end;

        caster:delStatusEffect(EFFECT_DIFFUSION);
    end;

    if (target:addStatusEffect(typeEffect,power,1,duration) == false) then
        spell:setMsg(75);
    end;

    return typeEffect;
end;