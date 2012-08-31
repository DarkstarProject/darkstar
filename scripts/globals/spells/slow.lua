-----------------------------------------
-- Spell: Slow
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and MND.
-- Slow's potency is calculated with the formula (150 + dMND*2)/1024, and caps at 300/1024 (~29.3%).
-- And MND of 75 is neccessary to reach the hardcap of Slow. 
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	dMND = (caster:getStat(MOD_MND) - target:getStat(MOD_MND));
	bonus = AffinityBonus(caster,spell);
	
	--Power.
	power = math.floor((100 / 1024) * (150 + dMND * 2))
	if(power > 30) then
		power = 30;
	end
	power = power * -1;
	
	--Duration, including resistance.
	duration = 120 * applyResistance(caster,spell,target,dMND,35,bonus);
	if(100 * math.random() >= target:getMod(MOD_SLOWRES)) then
		if(duration >= 60) then --Do it!
			--Try to erase a weaker slow or haste.
			slow = target:getStatusEffect(EFFECT_SLOW);
			haste = target:getStatusEffect(EFFECT_HASTE);
			if(slow ~= nil) then
				if(slow:getPower() > power) then
					target:delStatusEffect(EFFECT_SLOW);	
					target:addStatusEffect(EFFECT_SLOW,power,0,duration);
--					if(spell:isAOE() == false) then
						spell:setMsg(237);
--					else
--						spell:setMsg(267);
--					end
				else
					spell:setMsg(75);
				end
			elseif(haste ~= nil) then
				if(haste:getPower() < (-1 * power)) then
					target:delStatusEffect(EFFECT_HASTE);	
					target:addStatusEffect(EFFECT_SLOW,power,0,duration);
--					if(spell:isAOE() == false) then
						spell:setMsg(237);
--					else
--						spell:setMsg(267);
--					end
				else
					spell:setMsg(75);
				end
			else
				target:addStatusEffect(EFFECT_SLOW,power,0,duration);
--				if(spell:isAOE() == false) then
					spell:setMsg(237);
--				else
--					spell:setMsg(267);
--				end
			end
			print(power);
			print(target:getMod(MOD_HASTE));
		else
--			if(spell:isAOE() == false) then
				spell:setMsg(85);
--			else
--				spell:setMsg(284);
--			end
		end
	else
--		if(spell:isAOE() == false) then
			spell:setMsg(85);
--		else
--			spell:setMsg(284);
--		end
	end
	
	target:updateEnmity(caster,320,1);
	
	return EFFECT_SLOW;
end;