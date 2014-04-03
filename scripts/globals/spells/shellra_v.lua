-----------------------------------------
-- Spell: Shellra
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
    local power = 62;
    local duration = 1800;

    --printf("Shellra V Base Power: %d", power);

    local meritBonus = caster:getMerit(MERIT_SHELLRA_V) - 1;
    --printf("Shellra V Merit Bonus: %d", meritBonus);
    
    if(meritBonus > 0) then
        power = power + meritBonus;
    end
    
    --printf("Shellra V Final Power: %d", power);
    
    duration = calculateDurationForLvl(duration, 75, target:getMainLvl());

    local typeEffect = EFFECT_SHELL;
    if(target:addStatusEffect(typeEffect, power, 0, duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(75); -- no effect
    end
    return typeEffect;
end;
