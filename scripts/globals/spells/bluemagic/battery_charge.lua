-----------------------------------------
-- Spell: Battery Charge
-- Gradually restores MP
-- Spell cost: 50 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Light)
-- Blue Magic Points: 3
-- Stat Bonus: MP+10, MND+1
-- Level: 79
-- Casting Time: 5 seconds
-- Recast Time: 75 seconds
-- Spell Duration: 100 ticks, 300 Seconds (5 Minutes)
--
-- Combos: None
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local typeEffect = EFFECT.REFRESH;
    local power = 3;
    local duration = 300;

    if (caster:hasStatusEffect(EFFECT.DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);

        if (diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end;

        caster:delStatusEffect(EFFECT.DIFFUSION);
    end;

    if (target:hasStatusEffect(EFFECT.REFRESH)) then
        target:delStatusEffect(EFFECT.REFRESH);
    end

    if (target:addStatusEffect(typeEffect,power,3,duration) == false) then
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end;

    return typeEffect;
end;
