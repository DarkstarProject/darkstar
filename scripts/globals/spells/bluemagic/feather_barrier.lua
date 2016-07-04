-----------------------------------------
-- Spell: Feather Barrier
-- Enhances evasion
-- Spell cost: 29 MP
-- Monster Type: Birds
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 2
-- Stat Bonus: None
-- Level: 56
-- Casting Time: 2 seconds
-- Recast Time: 120 seconds
-- Duration: 30 Seconds
-- 
-- Combos: Resist Gravity
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

    local typeEffect = EFFECT_EVASION_BOOST;
    local power = 10;
    local duration = 30;

    if (caster:hasStatusEffect(EFFECT_DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);

        if (diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end;

        caster:delStatusEffect(EFFECT_DIFFUSION);
    end;

    if (target:addStatusEffect(typeEffect,power,0,duration) == false) then
        spell:setMsg(75);
    end;

    return typeEffect;
end;