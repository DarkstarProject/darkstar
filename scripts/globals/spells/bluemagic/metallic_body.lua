-----------------------------------------
-- Spell: Metallic Body
-- Absorbs an certain amount of damage from physical and magical attacks
-- Spell cost: 19 MP
-- Monster Type: Aquans
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 1
-- Stat Bonus: None
-- Level: 8
-- Casting Time: 7 seconds
-- Recast Time: 60 seconds
-- Duration: 5 minutes
-- 
-- Combos: Max MP Boost
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

    local typeEffect = EFFECT_STONESKIN
    local blueskill = caster:getSkillLevel(BLUE_SKILL);
    local power = (blueskill/3) + (caster:getMainLvl()/3) + 10;
    local duration = 300;

    if (power > 150) then
        power = 150;
    end;

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