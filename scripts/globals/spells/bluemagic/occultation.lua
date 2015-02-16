-----------------------------------------
-- Bluemagic: Occultation
-- Creates shadow images that each absorb
-- a single attack directed at you.
-- VIT+3  CHR-2
-- Lvl.: 88 MP Cost: 138 Blue Points: 3
-----------------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");
-----------------------------------------
-- onMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local skill = caster:getSkillLevel(BLUE_SKILL);
    local shadows = 2;
    local duration = 300;

    -- 400 skill = 8 shadows, 450 = 9 shadows, so I am assuming every 50 skill is a shadow.
    -- Also assuming minimum of 2 shadows.
    -- I've never seen the spell cast with under 100 skill, so I could be wrong.
    if (skill > 100) then
        shadows = (skill / 100); -- Temp set fewer shadows because proc rate is wrong.
    end

    if(caster:hasStatusEffect(EFFECT_DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);

        if(diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end

        caster:delStatusEffect(EFFECT_DIFFUSION);
    end

    if(target:addStatusEffect(EFFECT_BLINK, shadows, 0, duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(75);
    end

    return EFFECT_BLINK;
end;
