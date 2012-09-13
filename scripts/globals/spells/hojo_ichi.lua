-----------------------------------------
-- Spell: Hojo:Ichi
-- Description: Inflicts Slow on target. 
-- Edited from slow.lua
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
	bonus = AffinityBonus(caster,spell);
	--Power for Hojo is a flat 14.5% reduction
	power = 14.5;
	--Duration and Resistance calculation
	duration = 300 * applyResistance(caster,spell,target,dINT,NINJUTSU_SKILL,bonus);
	--Calculates the resist chance from Resist Blind trait
	if(math.random(0,100) >= target:getMod(MOD_SLOWRES)) then
		-- Spell succeeds if a 1 or 1/2 resist check is achieved
		if(duration >= 150) then
			--Looks for another Slow or Haste effect and replaces it if stronger
			slow = target:getStatusEffect(EFFECT_SLOW);
			haste = target:getStatusEffect(EFFECT_HASTE);
			if(slow ~= nil) then
				if(slow:getPower() > power) then
					target:delStatusEffect(EFFECT_SLOW);	
					target:addStatusEffect(EFFECT_SLOW,power,0,duration);
					spell:setMsg(237);
				else
					spell:setMsg(75);
				end
			elseif(haste ~= nil) then
				if(haste:getPower() < (-1 * power)) then
					target:delStatusEffect(EFFECT_HASTE);	
					target:addStatusEffect(EFFECT_SLOW,power,0,duration);
					spell:setMsg(237);
				else
					spell:setMsg(75);
				end
			else
				target:addStatusEffect(EFFECT_SLOW,power,0,duration);
				spell:setMsg(237);
			end
		else
			spell:setMsg(85);
		end
	else
		spell:setMsg(284);
	end
	return EFFECT_SLOW;
end;