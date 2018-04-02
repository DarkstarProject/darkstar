-----------------------------------------
-- Spell: Memento Mori
-- Enhances magic attack
-- Spell cost: 46 MP
-- Monster Type: Undead
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 4
-- Stat Bonus: INT+1
-- Level: 62
-- Casting Time: 6 seconds
-- Recast Time: 2 minutes
--
-- Combos: Magic Attack Bonus
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
    local typeEffect = dsp.effects.MAGIC_ATK_BOOST;
    local power = 20;
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
