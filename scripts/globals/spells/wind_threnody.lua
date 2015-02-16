-----------------------------------------
-- Spell: Threnody - MOD_WINDRES
-----------------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/abyssea");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	if (caster:isPC()) then
		local YellowTrigger = caster:getVar("YellowTrigger");
		if (YellowTrigger == 456) then
			WeaknessTriggerYellow(caster,target,spell);
		else
			if (math.random(4) == 1) then
				TriggerHintYELLOW(caster);
			end
		end
	end
	return handleThrenody(caster, target, spell, 50, 60, MOD_WINDRES);
end;
