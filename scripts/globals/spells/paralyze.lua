-----------------------------------------
-- Spell: Paralize
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
	
	-- Calculate duration.
	-- Generates rand# from 0.2~1.2 which is then x100 to form the duration (20-120).
	local double duration = (0.2 + math.random()) * 100; 
	
	-- Grabbing variables for paralyze potency
	mLVL = caster:getMainLvl();
	pMND = caster:getStat(MOD_MND);
	mMND = target:getStat(MOD_MND);
	
	dMND = (pMND - mMND);
	multiplier = 150 / mLVL;
	
	-- Calculate potency.
	potency = (multiplier * (pMND + dMND)) / 10;
	--printf("Duration : %u",duration);
	--printf("Potency : %u",potency);
	
	--Try to resist entirely.
	if(math.random(0,100) >= target:getMod(MOD_PARALYZERES)) then
		--See ifeffect is already on....
		if(target:getStatusEffect(EFFECT_PARALYSIS) ~= nil) then --effect already on, do nothing
			spell:setMsg(75);
		else
			bonus = AffinityBonus(caster, spell);
			resist = applyResistance(caster,spell,target,dMND,35,bonus);
			printf("resist : %u",resist);
			if(resist == 1) then -- Full hit, no duration penalty
				target:addStatusEffect(EFFECT_PARALYSIS,potency,0,duration);
--				if(spell:isAOE() == false) then
					spell:setMsg(237);
--				else
--					spell:setMsg(267);
--				end
			elseif(resist == 0.5) then -- Half duration
				duration = duration / 2;
				target:addStatusEffect(EFFECT_PARALYSIS,potency,0,duration);
--				if(spell:isAOE() == false) then
					spell:setMsg(237);
--				else
--					spell:setMsg(267);
--				end
			else -- resist entirely.
--				if(spell:isAOE() == false) then
					spell:setMsg(85);
--				else
--					spell:setMsg(284);
--				end
			end
		end
	else -- resist entirely.
--		if(spell:isAOE() == false) then
			spell:setMsg(85);
--		else
--			spell:setMsg(284);
--		end
	end

	return EFFECT_PARALYSIS;
	
end;