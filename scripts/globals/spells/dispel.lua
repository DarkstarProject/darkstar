-----------------------------------------
-- Spell: Dispel
--
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	target:dispelStatusEffect();

    if(effect == EFFECT_NONE) then
        spell:setMsg(MSG_NONE);
    else
        spell:setMsg(341);
    end

    return effect;
end;
