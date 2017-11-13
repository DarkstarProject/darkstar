-----------------------------------------
-- Spell: Stun
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local duration = 5;

    local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
    local params = {};
    params.diff = nil;
    params.attribute = MOD_INT;
    params.skillType = 37;
    params.bonus = 0;
    params.effect = EFFECT_STUN;
    resist = applyResistanceEffect(caster, target, spell, params);
    if (resist <= (1/16)) then
        -- resisted!
        spell:setMsg(msgBasic.MAGIC_RESIST);
        return 0;
    end

    if (target:hasStatusEffect(EFFECT_STUN)) then
        -- no effect
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    else
        if (target:addStatusEffect(EFFECT_STUN,1,0,duration*resist)) then
            spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end
    end

    return EFFECT_STUN;
end;
