-----------------------------------------
-- Spell: Dispelga
--
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
    -- Pull base stats.
    dINT = (caster:getStat(MOD_INT)*1.3 - target:getStat(MOD_INT));

    -- apply bonus, flash is hard to fully resist
    bonus = AffinityBonus(caster,spell);

    local resist = applyResistance(caster,spell,target,dINT,ENFEEBLING_MAGIC_SKILL,bonus);
    local effect = EFFECT_NONE;

    if(resist > 0.0625) then
        if(target:hasStatusEffect(EFFECT_FLASH) == false) then
            spell:setMsg(341);
            effect = target:dispelStatusEffect();
            if(effect == EFFECT_NONE) then
                -- no effect
                spell:setMsg(75);
            end
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end

    return effect;
