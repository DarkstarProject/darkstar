-----------------------------------------
-- Spell: Valor Minuet II
-- Grants Attack bonus to all allies.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	local sItem = caster:getEquipID(2);
	local sLvl = caster:getSkillLevel(40); -- Gets skill level of Singing

	if (sLvl < 67) then -- If your skill level is below 67 your stuck at the minimum
		power = 14;
	end

	if (sLvl >= 67 and sLvl <= 119) then -- If your above 66 skill then you get the bonus of 1 more attack for every 3 skill
		sBoost = math.floor((sLvl - 66)/3);
		power = 14 + sBoost;
	end

	if(sLvl >= 120) then -- The bonus caps at skill 120
		power = 32;
	end

	if(sItem == 17344) then -- Cornette will add 3 more
		power = power + 3;
	end

	if(sItem == 17369 or sItem == 17846) then -- Cornette +1 and Cornette +2 give 5 more
		power = power + 5;
	end

	-- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
	-- Since all the tiers use the same effect buff it is hard to delete a specific one.
	target:delStatusEffect(EFFECT_MINUET);
	target:addStatusEffect(EFFECT_MINUET,power,0,120);
	return EFFECT_MINUET;
end;