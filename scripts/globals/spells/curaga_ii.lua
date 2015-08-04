-----------------------------------------
-- Spell: Curaga II
-- Restores HP of all party members within area of effect.
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local minCure = 130;

	local divisor = 1;
	local constant = 70;
	local power = getCurePowerOld(caster);
	if (power > 300) then
		divisor = 15.6666;
		constant = 180.43;
	elseif (power > 180) then
		divisor =  2;
		constant = 115;
	end

	local final = getCureFinal(caster,spell,getBaseCureOld(power,divisor,constant),minCure,false);

	final = final + (final * (target:getMod(MOD_CURE_POTENCY_RCVD)/100));
	
	--Applying server mods....
	final = final * CURE_POWER;
	
	local diff = (target:getMaxHP() - target:getHP());
	if (final > diff) then
		final = diff;
	end
	target:addHP(final);

	target:wakeUp();
	caster:updateEnmityFromCure(target,final);
	
	spell:setMsg(367);	
	
	return final;
end;