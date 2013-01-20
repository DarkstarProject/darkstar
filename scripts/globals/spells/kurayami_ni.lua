-----------------------------------------
-- Spell: Kurayami:Ni
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

	-- Base Stats
	local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
	local bonus = AffinityBonus(caster,spell);
	--Duration Calculation
	local duration = 300 * applyResistance(caster,spell,target,dINT,NINJUTSU_SKILL,bonus);
	--Kurayami base power is 30 and is not affected by resistaces.
	local power = 30;

	--Calculates resist chanve from Reist Blind
	if(math.random(0,100) >= target:getMod(MOD_BLINDRES)) then
		if(duration >= 150) then
			-- Erases a weaker blind and applies the stronger one
			local blindness = target:getStatusEffect(EFFECT_BLINDNESS);
			if(blindness ~= nil) then
				if(blindness:getPower() < power) then
					target:delStatusEffect(EFFECT_BLINDNESS);
					target:addStatusEffect(EFFECT_BLINDNESS,power,0,duration);
					spell:setMsg(267);
				else
					spell:setMsg(75);
				end
			else
				target:addStatusEffect(EFFECT_BLINDNESS,power,0,duration);
				spell:setMsg(267);
			end
		else
			spell:setMsg(85);
		end
	else
		spell:setMsg(284);
	end
	return EFFECT_BLINDNESS;
end;