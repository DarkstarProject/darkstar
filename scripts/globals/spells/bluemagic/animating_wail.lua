-----------------------------------------
-- Bluemagic: Animating Wail
-- Increases attack speed.
-- HP +20
-- Lv: 79 MP Cost: 53 Blue Points: 5
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local duration = 300;

    if(caster:hasStatusEffect(EFFECT_DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);

        if(diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end

        caster:delStatusEffect(EFFECT_DIFFUSION);
    end

    if(target:addStatusEffect(EFFECT_HASTE,153,0,duration) == false) then
        spell:setMsg(75);
    end

    return EFFECT_HASTE;
end;