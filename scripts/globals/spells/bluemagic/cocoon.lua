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
	local currentDef = caster:getMod(MOD_DEF) * 0.5;
	caster:addStatusEffect(EFFECT_DEFENSE_BOOST,currentDef,0,90);
end;