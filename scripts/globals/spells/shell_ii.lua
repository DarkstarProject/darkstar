-----------------------------------------
-- Spell: Shell II
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	local power = 36;
	local duration = 1800;

    local typeEffect = EFFECT_SHELL;
	if(target:addStatusEffect(typeEffect, power, 0, duration)) then
        spell:setMsg(230);
    else
		spell:setMsg(75); -- no effect
	end
	return typeEffect;
end;
