-----------------------------------------
-- Spell: Knight's Minne II
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

	-- If your skill level is below 65 your stuck at the minimum
	local sItem = caster:getEquipID(2);
	local sLvl = caster:getSkillLevel(40); -- Gets skill level of Singing
	power=0;
	-- If your above 64 skill then you get the bonus of 1 more defense for every 4 skill
	if (sLvl >= 65 and sLvl <= 121) then
		sBoost = math.floor((sLvl - 61)/4);
		power = power + sBoost;
	end
	-- The bonus caps at skill 125
	if(sLvl >= 125) then
		power = 28;
	end
	-- Maple Harp +1 or Harp will add 3 more
	if(sItem == 17373 or sItem == 17354) then
		power = power + 3;
	end
	-- Harp +1 gives 5 more
	if(sItem == 17374) then
		power = power + 5;
	end
	-- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
	-- Since all the tiers use the same effect buff it is hard to delete a specific one.
	target:delStatusEffect(EFFECT_MINNE);
	target:addStatusEffect(EFFECT_MINNE,power,0,120);

	return EFFECT_MINNE;
end;