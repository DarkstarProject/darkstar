-----------------------------------------
-- Spell: Adventurer's Dirge
-- Grants enmity minus to a party member.
-- I'm sure it's not correct but a stop gap until it's implemented.
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
--[[
	local duration = 120;
	local power = 20;
	if(caster:getObjType() == TYPE_PC) then
		local merit =((target:getMerit(MERIT_ADVENTURERS_DIRGE) * .03) - .03);
		power = power + (power * merit);
		-- printf("Power and Merit %d",power);
	end
	
	duration = duration + (duration * (target:getMod(MOD_SONG_DURATION)/100));
	duration = duration + (duration * ((target:getMod(MOD_ALL_SONGS) * 10)/100));
	
	-- printf("Final Power %d",power);
	
    -- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
    -- Since all the tiers use the same effect buff it is hard to delete a specific one.
    target:delStatusEffect(EFFECT_DIRGE);
    target:addStatusEffect(EFFECT_DIRGE,power,3,duration);
    spell:setMsg(230);
    return EFFECT_DIRGE;
]]
end;