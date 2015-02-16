-----------------------------------------
-- Spell: Foe Sirvente
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
--[[ no, wrong, crashing server! Try again! DO NOT PUSH TO LIVE BRANCH!

	local duration = 120;
	local power = 30;
	if(caster:getObjType() == TYPE_PC) then
		local merit =((target:getMerit(MERIT_FOE_SIRVENTE) * .01) - .05);
		power = power + (power * merit);
	end
 	duration = duration + (duration * (caster:getMod(MOD_SONG_DURATION)/100));
 	duration = duration + (duration * ((caster:getMod(MOD_ALL_SONGS) * 10)/100));

	power = power + (caster:getMod(MOD_ALL_SONGS) * 2);

    -- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
    -- Since all the tiers use the same effect buff it is hard to delete a specific one.
    target:delStatusEffect(EFFECT_SIRVENTE);
    target:addStatusEffect(EFFECT_SIRVENTE,power,3,duration);
    spell:setMsg(230);
    return EFFECT_SIRVENTE;
]]
end;