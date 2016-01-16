-----------------------------------------
-- Spell: Repose
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local dMND = (caster:getStat(MOD_MND) - target:getStat(MOD_MND));
    local resist = applyResistanceEffect(caster,spell,target,dMND,DIVINE_MAGIC_SKILL,0,EFFECT_SLEEP_II);
    if (resist < 0.5) then
        spell:setMsg(85); -- Resist
        return EFFECT_SLEEP_II;
    end

    if (target:addStatusEffect(EFFECT_SLEEP_II,2,0,90*resist)) then
        spell:setMsg(237);
    else
        spell:setMsg(75); -- No effect
    end

    if (caster:isPC()) then
        target:updateEnmity(caster,320,1);
    end

    return EFFECT_SLEEP_II;
end;
