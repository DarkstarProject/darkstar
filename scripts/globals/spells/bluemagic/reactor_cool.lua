-----------------------------------
-- Spell: Reactor Cool
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------
-- onSpellcast
-----------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster, target, spell)
	
	if (caster:hasStatusEffect(EFFECT_DEFENSE_BOOST) and caster:hasStatusEffect(EFFECT_ICE_SPIKES) == true) then
		spell:setMsg(75);
	else
		caster:addStatusEffect(EFFECT_DEFENSE_BOOST,25,0,120) and caster:addStatusEffect(EFFECT_ICE_SPIKES,5,0,120)
		spell:setMsg(230);
	end

    return EFFECT_ICE_SPIKES;
end;