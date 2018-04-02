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

    target:addStatusEffect(dsp.effects.KLIMAFORM,1,0,180);

    return dsp.effects.KLIMAFORM;
end;