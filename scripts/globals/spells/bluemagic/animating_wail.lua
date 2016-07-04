-----------------------------------------
-- Spell: Animating Wail
-- Increases attack speed
-- Spell cost: 53 MP
-- Monster Type: Undead
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 5
-- Stat Bonus: HP+20
-- Level: 79
-- Casting Time: 2 Seconds
-- Recast Time: 45 Seconds
-- 5 minutes
-- 
-- Combos: Dual Wield
-----------------------------------------

require("scripts/globals/status");

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

    local typeEffect = EFFECT_HASTE;
    local power = 153;
    local duration = 300;

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