-----------------------------------------
-- Spell: Knight's Minne III
-- Grants Defense bonus to all allies.
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

	if (sLvl < 118) then -- If your skill level is below 118 your stuck at the minimum
		power = 26;
	end

	if (sLvl >= 118 and sLvl <= 186) then -- If your above 117 skill then you get the bonus of 1 more defense for every 5 skill
		sBoost = math.floor((sLvl - 117)/5);
		power = 26 + sBoost;
	end

	if(sLvl >= 187) then -- The bonus caps at skill 187
		power = 40;
	end

	if(sItem == 17373 or sItem == 17354) then -- Maple Harp +1 or Harp will add 3 more
		power = power + 3;
	end

	if(sItem == 17374) then -- Harp +1 gives 5 more
		power = power + 5;
	end

	-- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
	-- Since all the tiers use the same effect buff it is hard to delete a specific one.
	target:delStatusEffect(EFFECT_MINNE);
	target:addStatusEffect(EFFECT_MINNE,power,0,120);
	spell:setMsg(230);
	return EFFECT_MINNE;
end;