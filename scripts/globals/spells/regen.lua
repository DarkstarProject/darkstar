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

function onSpellCast(caster,target,spell)
	
	hp = 5; 
	
	body = caster:getEquipID(5);
	if (body == 15089 or body == 14502) then
		hp = hp+1;
	end
	
	duration = 75;
	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
		duration = duration * 3;
	end
	
	if (target:getMainLvl() < 21) then
		duration = duration * target:getMainLvl() / 21;
	end
	
	if(target:hasStatusEffect(EFFECT_REGEN) == true) then
		effect = target:getStatusEffect(EFFECT_REGEN);
		cPower = effect:getPower();
		if(cPower > 6) then
			spell:setMsg(75); -- no effect
		else
			target:delStatusEffect(EFFECT_REGEN);
			target:addStatusEffect(EFFECT_REGEN,hp,3,duration);	
		end
    else
		target:addStatusEffect(EFFECT_REGEN,hp,3,duration);
	end

	return 0;
end;