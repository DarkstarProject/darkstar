-----------------------------------------
-- Spell: Amplification
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

    if(caster:hasStatusEffect(EFFECT_MAGIC_ATK_BOOST) and caster:hasStatusEffect(EFFECT_MAGIC_DEF_BOOST) == true) then
    	spell:setMsg(75);
	else
		caster:addStatusEffect(EFFECT_MAGIC_ATK_BOOST,10,0,180);
		caster:addStatusEffect(EFFECT_MAGIC_DEF_BOOST,10,0,180);
    end

    return EFFECT_MAGIC_ATK_BOOST;
end;