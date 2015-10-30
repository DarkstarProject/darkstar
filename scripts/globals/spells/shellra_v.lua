-----------------------------------------
-- Spell: Shellra
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
    local meritBonus = caster:getMerit(MERIT_SHELLRA_V);
    local duration = 1800;
    
    --Base Power is actually 62, but you will always have atleast 1 merit
    local power = 60 + meritBonus;
    --printf("Shellra V Power: %d", power);
    
    duration = calculateDurationForLvl(duration, 75, target:getMainLvl());

    local typeEffect = EFFECT_SHELL;
    if (target:addStatusEffect(typeEffect, power, 0, duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(75); -- no effect
    end
    return typeEffect;
end;
