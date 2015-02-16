-----------------------------------------
-- Spell: Hyoton: Ni
-- Deals ice damage to an enemy and lowers its resistance against fire.
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
		if (YellowTrigger == 324) then
			WeaknessTriggerYellow(caster,target,spell);
		else
			if (math.random(4) == 1) then
				TriggerHintYELLOW(caster);
			end
		end
	end
	--doNinjutsuNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
	local dmg = doNinjutsuNuke(68,1,caster,spell,target,false,1.0);
	handleNinjutsuDebuff(caster, target, spell, 30, 15, MOD_FIRERES);

	return dmg;

end;
