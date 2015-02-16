-----------------------------------------
-- Spell: Embalming Earth
-- Deals earth damage to an enemy.
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

function onSpellCast(caster,target,spell)
	--doElementalNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
	local dmg = doElementalNuke(719,2.8,caster,spell,target,false,1.0);
	
	if(target:hasStatusEffect(EFFECT_SLOW)) then
	spell:setMsg(75); -- no effect
	    else	
		target:addStatusEffect(EFFECT_SLOW,15,0,20);
		   end


	return dmg;
end;

