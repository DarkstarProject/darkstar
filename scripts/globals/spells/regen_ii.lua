-----------------------------------------
-- Spell: Regen II
-- Gradually restores target's HP.
-----------------------------------------
-- Cleric's Briault enhances the effect
-- Scale down duration based on level
-- Composure increases duration 3x
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	local hp = 12;
	local meritBonus = caster:getMerit(MERIT_REGEN_EFFECT);

	--printf("Regen II: Merit Bonus = Extra +%d", meritBonus);

	local body = caster:getEquipID(SLOT_BODY);
	if (body == 15089 or body == 14502) then
		hp = hp+2;
	end

	hp = hp + caster:getMod(MOD_REGEN_EFFECT) + meritBonus;

	local duration = 60;

	duration = duration + caster:getMod(MOD_REGEN_DURATION);

	duration = calculateDurationForLvl(duration, 44, target:getMainLvl());

	if(target:addStatusEffect(EFFECT_REGEN,hp,3,duration)) then
		spell:setMsg(230);
	else
		spell:setMsg(75); -- no effect
	end

	return EFFECT_REGEN;
end;