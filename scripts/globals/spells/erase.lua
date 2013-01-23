-----------------------------------------
-- Spell: Erase
--
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

	local effect = target:eraseStatusEffect();

    if(effect == EFFECT_NONE) then
        spell:setMsg(75); -- no effect
    else
        spell:setMsg(83);
    end

    return effect;
end;
