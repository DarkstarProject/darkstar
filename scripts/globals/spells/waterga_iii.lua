-----------------------------------------
-- Spell: Water
-- Deals water damage to an enemy.
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
		if (YellowTrigger == 201) then
			WeaknessTriggerYellow(caster,target,spell);
		else
			if (math.random(4) == 1) then
				TriggerHintYELLOW(caster);
			end
		end
	end
	--doElementalNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
	local dmg = doElementalNuke(480,1.5,caster,spell,target,false,1.0);
	return dmg;
end;