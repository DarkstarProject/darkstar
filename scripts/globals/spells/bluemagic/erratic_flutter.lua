-----------------------------------------
-- Spell: Erratic Flutter
-- Increases attack speed
-- Spell cost: 92 MP
-- Monster Type: Vermin
-- Spell Type: Enhancing (Wind)
-- Blue Magic Points: 6
-- Stat Bonus: HP+15, MP+15, AGI+15, CHR+5
-- Level: 99
-- Casting Time: 1.0 seconds
-- Recast Time: 45 seconds
-- Duration: 5 minutes
-- 
-- Combos: Fast Cast
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
    local power = 307;
    local duration = 3600;

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