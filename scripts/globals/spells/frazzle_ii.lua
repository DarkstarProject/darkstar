-----------------------------------------
-- Spell: Frazzle II
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local dMND = (caster:getStat(MOD_MND) - target:getStat(MOD_MND));
    local power = utils.clamp(40+math.floor(dMND/5), 40, 50);
    local duration = 120;
    local params = {};
    params.diff = nil;
    params.attribute = MOD_MND;
    params.skillType = power;
    params.bonus = 0;
    params.effect = EFFECT_MAGIC_EVASION_DOWN;
    duration = duration * applyResistanceEffect(caster, target, spell, params);

    if (duration >= 60) then
        if (target:addStatusEffect(EFFECT_MAGIC_EVASION_DOWN,power,0,duration)) then
            spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end
    else
        spell:setMsg(msgBasic.MAGIC_RESIST);
    end

    return EFFECT_MAGIC_EVASION_DOWN;
end;
