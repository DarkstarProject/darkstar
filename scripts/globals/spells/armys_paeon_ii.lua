-----------------------------------------
-- Spell: Army's Paeon II
-- Gradually restores target's HP.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

	local hp = 2;
	local sItem = caster:getEquipID(2);
	-- If Job is Bard and Level is at or above 40 then get bonus HP.
	if(caster:getMainJob() == 10 and caster:getMainLvl() >= 40) then
	    hp = hp + 1;
	end
	-- Ebony Harp
	if(sItem == 17357) then
	    hp = hp + 1;
	end
	-- Ebony Harp +1 and Ebony Harp + 2
	if(sItem == 17833 or sItem == 17848) then
	    hp = hp + 2;
	end
	-- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
	-- Since all the tiers use the same effect buff it is hard to delete a specific one.
	target:delStatusEffect(EFFECT_PAEON);
	target:addStatusEffect(EFFECT_PAEON,hp,3,120);
	return EFFECT_PAEON;
end;