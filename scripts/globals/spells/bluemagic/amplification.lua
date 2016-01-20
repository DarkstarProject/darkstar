-----------------------------------------
-- Spell: Amplification
-- Enhances magic attack and magic defense
-- Spell cost: 48 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Water)
-- Blue Magic Points: 3
-- Stat Bonus: HP-5, MP+5
-- Level: 70
-- Casting Time: 7 seconds
-- Recast Time: 120 seconds
-- Duration: 90 seconds
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

    local typeEffectOne = EFFECT_MAGIC_ATK_BOOST
    local typeEffectTwo = EFFECT_MAGIC_DEF_BOOST
    local power = 10;
    local duration = 90;
    local returnEffect = typeEffectOne;

    if (caster:hasStatusEffect(EFFECT_DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);

        if (diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end;

        caster:delStatusEffect(EFFECT_DIFFUSION);
    end;

    if (target:addStatusEffect(typeEffectOne,power,0,duration) == false and target:addStatusEffect(typeEffectTwo,power,0,duration) == false) then -- both statuses fail to apply
        spell:setMsg(75);
    elseif (target:addStatusEffect(typeEffectOne,power,0,duration) == false) then -- the first status fails to apply
        target:addStatusEffect(typeEffectTwo,power,0,duration)
        spell:setMsg(230);
        returnEffect = typeEffectTwo;
    else
        target:addStatusEffect(typeEffectOne,power,0,duration)
        target:addStatusEffect(typeEffectTwo,power,0,duration)
        spell:setMsg(230);
    end;

    return returnEffect;
end;