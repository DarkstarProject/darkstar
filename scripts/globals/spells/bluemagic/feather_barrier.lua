-----------------------------------------
-- Spell: Feather Barrier
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/bluemagic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

    if(caster:hasStatusEffect(EFFECT_EVASION_BOOST) == true) then
    	spell:setMsg(75);
	else
		caster:addStatusEffect(EFFECT_EVASION_BOOST,10,0,300);
    end

    return EFFECT_EVASION_BOOST;
end;