-----------------------------------------
-- Spell: Saline Coat
-- Enhances magic defense
-- Spell cost: 66 MP
-- Monster Type: Luminians
-- Spell Type: Magical (Light)
-- Blue Magic Points: 3
-- Stat Bonus: VIT+2, AGI+2, MP+10
-- Level: 72
-- Casting Time: 3 seconds
-- Recast Time: 60 seconds
-- Duration: 60 seconds
--
-- Combos: Defense Bonus
-----------------------------------------
require("scripts/globals/bluemagic");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local typeEffect = dsp.effects.MAGIC_DEF_BOOST;
    local power = 40;
    local duration = 60;

    if (caster:hasStatusEffect(dsp.effects.DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);

        if (diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end;

        caster:delStatusEffect(dsp.effects.DIFFUSION);
    end;

    if (target:addStatusEffect(typeEffect,power,0,duration) == false) then
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end;

    return typeEffect;
end;
