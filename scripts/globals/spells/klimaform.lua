-----------------------------------------
-- Spell: Klimaform
-- Increases magic accuracy for spells of the same element as current weather
-----------------------------------------

require("scripts/globals/status")

function onMagicCastingCheck(caster,target,spell)

    return 0

end



function onSpellCast(caster,target,spell)

    target:addStatusEffect(dsp.effect.KLIMAFORM,1,0,180)

    return dsp.effect.KLIMAFORM
end