-----------------------------------------
-- Spell: Flash
-- Temporarily blinds an enemy, greatly lowering its accuracy.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    -- Pull base stats.
    local dINT = (caster:getStat(MOD_MND) - target:getStat(MOD_MND));

    local params = {};

    params.diff = nil;

    params.attribute = MOD_INT;

    params.skillType = DIVINE_MAGIC_SKILL;

    params.bonus =  150;

    params.effect = nil;

    local resist = applyResistance(caster, target, spell, params);
    local duration = 12 * resist;

    if (resist > 0.0625) then
        if (target:addStatusEffect(EFFECT_FLASH,200,0,duration)) then
            spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end
    else
        spell:setMsg(msgBasic.MAGIC_RESIST);
    end
    return EFFECT_FLASH;
end;
