-----------------------------------------
-- Spell: Pollen
-- Restores target's HP.
-- Shamelessly stolen from http://members.shaw.ca/pizza_steve/cure/Cure_Calculator.html
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local minCure = 14;

	local divisor = 1;
	local constant = -6;
	local power = getCurePowerOld(caster);
	if(power > 99) then
		divisor = 57;
		constant = 33.125;
	elseif(power > 59) then
		divisor =  2;
		constant = 9;
	end

	local final = getCureFinal(caster,spell,getBaseCureOld(power,divisor,constant),minCure,true);

	final = final + (final * (target:getMod(MOD_CURE_POTENCY_RCVD)/100));
	
	if(target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == TYPE_PC or target:getObjType() == TYPE_MOB)) then
		--Applying server mods....
		final = final * CURE_POWER;
	end
		
	local diff = (target:getMaxHP() - target:getHP());
	if(final > diff) then
		final = diff;
	end
	target:addHP(final);

	if(target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == TYPE_PC or target:getObjType() == TYPE_MOB)) then
		caster:updateEnmityFromCure(target,final);
	end
	spell:setMsg(7);
	return final;
end;