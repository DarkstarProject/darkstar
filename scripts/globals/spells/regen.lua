-----------------------------------------
-- Spell: Regen
-- Gradually restores target's HP.
-----------------------------------------
-- Cleric's Briault enhances the effect
-- Scale down duration based on level
-- Composure increases duration 3x
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	
	local hp = 5;
	local meritBonus = caster:getMerit(MERIT_REGEN_EFFECT);

	--printf("Regen: Merit Bonus = Extra +%d", meritBonus);
	
	--TODO: put this into a mod? +1 hp PER TIER, would need a new mod
	local body = caster:getEquipID(SLOT_BODY);
	if (body == 15089 or body == 14502) then
		hp = hp+1;
	end

	hp = hp + caster:getMod(MOD_REGEN_EFFECT) + meritBonus;

	local duration = 75;

	duration = duration + caster:getMod(MOD_REGEN_DURATION);

	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
		duration = duration * 3;
	end

	duration = calculateDurationForLvl(duration, 21, target:getMainLvl());

	if(target:addStatusEffect(EFFECT_REGEN,hp,3,duration)) then
		spell:setMsg(230);
	else
		spell:setMsg(75); -- no effect
	end

	return EFFECT_REGEN;
end;