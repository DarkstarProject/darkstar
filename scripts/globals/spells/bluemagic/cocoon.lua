-----------------------------------
-- Spell: Cocoon
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------
-- onSpellcast
-----------------------------------

function onSpellCast(caster, target, spell)
	local power = 50; -- Percentage, not amount.

	if(target:addStatusEffect(EFFECT_DEFENSE_BOOST,power,0,90)) then
		spell:setMsg(230);
	else
		spell:setMsg(75);
	end

    return EFFECT_DEFENSE_BOOST;
end;