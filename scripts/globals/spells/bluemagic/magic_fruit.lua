-----------------------------------------
-- Spell: Magic Fruit
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
	local minCure = 250;

	local divisor = 0.6666;
	local constant = 130;
	local power = getCurePowerOld(caster);
	if(power > 559) then
		divisor = 2.8333;
		constant = 391.2
	elseif(power > 319) then
		divisor =  1;
		constant = 210;
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

	target:wakeUp();
	caster:updateEnmityFromCure(target,final);
	spell:setMsg(7);
	return final;
end;