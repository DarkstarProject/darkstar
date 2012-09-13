-----------------------------------------
-- Spell: Blind
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	-- Pull base stats.
	dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
	bonus = AffinityBonus(caster,spell);
	
	-- Base power.  May need more research.
	power = math.floor((dINT + 60) / 4);
	if(power < 5) then
		power = 5;
	end
	
	-- Duration, including resistance.  Unconfirmed.
	duration = 180 * applyResistance(caster,spell,target,dINT,35,bonus);
	
	if(100 * math.random() >= target:getMod(MOD_BLINDRES)) then
		if(duration >= 90) then --Do it!
			-- Try to erase a weaker blind.
			blind = target:getStatusEffect(EFFECT_BLINDNESS)
			if(blind ~= nil) then
				if(blind:getPower() < power) then
					target:delStatusEffect(EFFECT_BLINDNESS);	
					target:addStatusEffect(EFFECT_BLINDNESS,power,0,duration);
--					if(spell:isAOE() == false) then
--						spell:setMsg(237);
--					else
						spell:setMsg(267);
--					end
				else
					spell:setMsg(75);
				end
			else
				target:addStatusEffect(EFFECT_BLINDNESS,power,0,duration);
--				if(spell:isAOE() == false) then
--					spell:setMsg(237);
--				else
					spell:setMsg(267);
--				end
			end
		else
--			if(spell:isAOE() == false) then
--				spell:setMsg(85);
--			else
				spell:setMsg(284);
--			end
		end
	else
--		if(spell:isAOE() == false) then
--			spell:setMsg(85);
--		else
			spell:setMsg(284);
--		end
	end
	return EFFECT_BLINDNESS;
end;