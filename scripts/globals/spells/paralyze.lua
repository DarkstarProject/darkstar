-----------------------------------------
-- Spell: Paralyze
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
	local double duration = math.random(60, 120);

	-- Grabbing variables for paralyze potency
	mLVL = caster:getMainLvl();
	pMND = caster:getStat(MOD_MND);
	mMND = target:getStat(MOD_MND);

	dMND = (pMND - mMND);
	multiplier = 150 / mLVL;

	-- Calculate potency.
	potency = (multiplier * (pMND + dMND)) / 10;
	if potency > 25 then
		potency = 25;
	end
	--printf("Duration : %u",duration);
	--printf("Potency : %u",potency);
	if(target:hasStatusEffect(EFFECT_PARALYSIS)) then --effect already on, do nothing
		spell:setMsg(75);
	elseif(math.random(0,100) >= target:getMod(MOD_PARALYZERES)) then
		bonus = AffinityBonus(caster, spell);
		resist = applyResistance(caster,spell,target,dMND,35,bonus);
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


	else -- resist entirely.
--		if(spell:isAOE() == false) then
			spell:setMsg(85);
--		else
--			spell:setMsg(284);
--		end
	end
	return EFFECT_PARALYSIS;

end;
