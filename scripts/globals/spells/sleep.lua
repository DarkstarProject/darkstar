-----------------------------------------
-- Spell: Sleep I
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local duration = 60
        if (caster:hasStatusEffect(dsp.effect.SABOTEUR)) then
        duration = duration * 2
    end
    caster:delStatusEffect(dsp.effect.SABOTEUR)

    local pINT = caster:getStat(dsp.mod.INT)
    local mINT = target:getStat(dsp.mod.INT)
    local dINT = (pINT - mINT)
    local params = {}
    params.diff = nil
    params.attribute = dsp.mod.INT
    params.skillType = dsp.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = dsp.effect.SLEEP_I
    resm = applyResistanceEffect(caster, target, spell, params)
    if (resm < 0.5) then
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST) -- resist message
        return dsp.effect.SLEEP_I
    end
    duration = duration * resm

    if (target:addStatusEffect(dsp.effect.SLEEP_I,1,0,duration)) then
        spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.SLEEP_I
end
