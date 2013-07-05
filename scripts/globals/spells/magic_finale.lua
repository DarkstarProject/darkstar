-----------------------------------------
-- Spell: Magic Finale
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
    local dINT = (caster:getStat(MOD_CHR) - target:getStat(MOD_CHR));

    -- apply bonus, flash is hard to fully resist
    local bonus = AffinityBonus(caster,spell) + 300;

    local resist = applyResistance(caster,spell,target,dINT,SINGING_SKILL,bonus);
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
end;
