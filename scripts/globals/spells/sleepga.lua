-----------------------------------------
-- Spell: Sleepga
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local dINT = caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT)

    local duration = calculateDuration(60, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    local params = {}
    params.diff = dINT
    params.skillType = dsp.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = dsp.effect.SLEEP_I
    local resist = applyResistanceEffect(caster, target, spell, params)

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
    
    if resist >= 0.5 then
        if target:addStatusEffect(params.effect, 1, 0, duration * resist) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT) -- No effect
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end