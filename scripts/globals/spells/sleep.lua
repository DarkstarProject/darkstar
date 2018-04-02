-----------------------------------------
-- Spell: Sleep I
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local duration = 60;
        if (caster:hasStatusEffect(dsp.effects.SABOTEUR)) then
        duration = duration * 2;
    end
    caster:delStatusEffect(dsp.effects.SABOTEUR);

    local pINT = caster:getStat(MOD_INT);
    local mINT = target:getStat(MOD_INT);
    local dINT = (pINT - mINT);
    local params = {};
    params.diff = nil;
    params.attribute = MOD_INT;
    params.skillType = ENFEEBLING_MAGIC_SKILL;
    params.bonus = 0;
    params.effect = dsp.effects.SLEEP_I;
    resm = applyResistanceEffect(caster, target, spell, params);
    if (resm < 0.5) then
        spell:setMsg(msgBasic.MAGIC_RESIST); -- resist message
        return dsp.effects.SLEEP_I;
    end
    duration = duration * resm;

    if (target:addStatusEffect(dsp.effects.SLEEP_I,1,0,duration)) then
        spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end

    return dsp.effects.SLEEP_I;
end;
