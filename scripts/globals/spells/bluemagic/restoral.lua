-----------------------------------------
-- Spell: Restoral
-- Restores target party member's HP and enhances attack and magic attack..
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
	local minCure = 640;
	local divisor = 0.6666;
	local constant = 500;
	local power = getCurePowerOld(caster);
	if(power > 559) then
		divisor = 2.8333;
		constant = 491.2
	elseif(power > 319) then
		divisor =  1;
		constant = 310;
	end

	local final = getCureFinal(caster,spell,getBaseCureOld(power,divisor,constant),minCure,true);

	final = final + (final * (target:getMod(MOD_CURE_POTENCY_RCVD)/100));
	local diff = (target:getMaxHP() - target:getHP());
	if(final > diff) then
		final = diff;
	end
	target:addHP(final);
	caster:updateEnmityFromCure(target,final);
	return final;
end;