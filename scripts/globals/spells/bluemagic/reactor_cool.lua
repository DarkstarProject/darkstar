-----------------------------------------
-- Spell: Reactor Cool
-- Enhances defense and covers you with magical ice spikes. Enemies that hit you take ice damage
-- Spell cost: 28 MP
-- Monster Type: Luminions
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 5
-- Stat Bonus: INT+3 MND+3
-- Level: 74
-- Casting Time: 3 seconds
-- Recast Time: 60 seconds
-- Duration: 120 seconds (2 minutes)
-- 
-- Combos: Magic Attack Bonus
-----------------------------------------

require("scripts/globals/settings");
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

    local typeEffectOne = EFFECT_ICE_SPIKES
    local typeEffectTwo = EFFECT_DEFENSE_BOOST
    local powerOne = 5;
    local powerTwo = 12
    local duration = 120;
    local returnEffect = typeEffectOne;

    if (caster:hasStatusEffect(EFFECT_DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);

        if (diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end;

        caster:delStatusEffect(EFFECT_DIFFUSION);
    end;

    if (target:addStatusEffect(typeEffectOne,powerOne,0,duration) == false and target:addStatusEffect(typeEffectTwo,powerTwo,0,duration) == false) then -- both statuses fail to apply
        spell:setMsg(75);
    elseif (target:addStatusEffect(typeEffectOne,powerOne,0,duration) == false) then -- the first status fails to apply
        target:addStatusEffect(typeEffectTwo,powerTwo,0,duration)
        spell:setMsg(230);
        returnEffect = typeEffectTwo;
    else
        target:addStatusEffect(typeEffectOne,powerOne,0,duration)
        target:addStatusEffect(typeEffectTwo,powerTwo,0,duration)
        spell:setMsg(230);
    end;

    return returnEffect;
end;