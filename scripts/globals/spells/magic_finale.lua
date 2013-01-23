-----------------------------------------
-- Spell: Magic Finale
--
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    effect = target:dispelStatusEffect();

    if(effect == EFFECT_NONE) then
        spell:setMsg(75); -- no effect
    else
        spell:setMsg(341);
    end

    return effect;
end;
