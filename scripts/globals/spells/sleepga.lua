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

    if (caster:isMob()) then
        if (caster:getPool() == 5310) then -- Amnaf (Flayer)
            caster:resetEnmity(target)
        end
        -- Todo: get rid of this whole block by handling it in the mob script
        -- this requires a multi target enmity without specifying a target (have to get hate list from mob)
        -- OR by altering onSpellPrecast to have a target param..
        -- onMonsterMagicPrepare is not a realistic option.
        -- You'd have to script the use of every individual spell in Amnaf's list..
    end

    if (resm < 0.5) then
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST) -- Resist
        return dsp.effect.SLEEP_I
    end

    duration = duration * resm

    if (target:addStatusEffect(dsp.effect.SLEEP_I,1,0,duration)) then
        spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT) -- No effect
    end

    return dsp.effect.SLEEP_I
end
