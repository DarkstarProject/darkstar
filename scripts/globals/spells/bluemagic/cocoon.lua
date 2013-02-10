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
	local defUp = target:getStatusEffect(EFFECT_DEFENSE_BOOST);
	local defDown = target:getStatusEffect(EFFECT_DEFENSE_DOWN);
	local power = 50; -- Percentage, not amount.
	if (defUp ~= nil) then
		if (defUp:getPower() < power) then
			target:delStatusEffect(EFFECT_DEFENSE_BOOST);
			target:addStatusEffect(EFFECT_DEFENSE_BOOST,power,0,90);
		else
			spell:setMsg(75);
		end
	elseif (defDown ~= nil) then
		if (defDown:getPower() > (-1*power)) then
			target:delStatusEffect(EFFECT_DEFENSE_DOWN);
			target:addStatusEffect(EFFECT_DEFENSE_BOOST,power,0,90);
		else
			spell:setMsg(75);
		end
	else
		target:addStatusEffect(EFFECT_DEFENSE_BOOST,power,0,90);
	end
end;