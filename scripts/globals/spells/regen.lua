-----------------------------------------
-- Spell: Regen
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

	hp = 5;
	
	--TODO: put this into a mod? +1 hp PER TIER, would need a new mod
	body = caster:getEquipID(SLOT_BODY);
	if (body == 15089 or body == 14502) then
		hp = hp+1;
	end
	
	hp = hp + caster:getMod(MOD_REGEN_EFFECT);

	duration = 75;
	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
		duration = duration * 3;
	end

	if (target:getMainLvl() < 21) then
		duration = duration * target:getMainLvl() / 21;
	end

	if(target:addStatusEffect(EFFECT_REGEN,hp,3,duration)) then
		spell:setMsg(230);
	else
		spell:setMsg(75); -- no effect
	end

	return EFFECT_REGEN;
end;