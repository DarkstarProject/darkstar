-----------------------------------------
-- Spell: Klimaform
-- Increases magic accuracy for spells of the same element as current weather
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    
    return 0;

end;



function onSpellCast(caster,target,spell)

    target:addStatusEffect(EFFECT_KLIMAFORM,1,0,180);

    return EFFECT_KLIMAFORM;
end;