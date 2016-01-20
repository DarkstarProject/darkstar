
require("scripts/globals/magic");
require("scripts/globals/status");
-----------------------------------------
-- Spell: Dispel
--
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    -- Pull base stats.
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));

    local resist = applyResistance(caster,spell,target,dINT,ENFEEBLING_MAGIC_SKILL);
    local effect = EFFECT_NONE;

    if (resist > 0.0625) then
        spell:setMsg(341);
        effect = target:dispelStatusEffect();
        if (effect == EFFECT_NONE) then
            -- no effect
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end

    return effect;
end;
