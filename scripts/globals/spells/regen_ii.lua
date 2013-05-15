-----------------------------------------
-- Spell: Regen II
-- Gradually restores target's HP.
-----------------------------------------
-- Cleric's Briault enhances the effect
-- Scale down duration based on level
-- Composure increases duration 3x
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	hp = 12;

	body = caster:getEquipID(SLOT_BODY);
	if (body == 15089 or body == 14502) then
		hp = hp+2;
	end

	hp = hp + caster:getMod(MOD_REGEN_EFFECT);
	
	duration = 60;

	if (target:getMainLvl() < 66) then
		duration = duration * target:getMainLvl() / 66;
	end

	if(target:addStatusEffect(EFFECT_REGEN,hp,3,duration)) then
		spell:setMsg(230);
	else
		spell:setMsg(75); -- no effect
	end

	return EFFECT_REGEN;
end;