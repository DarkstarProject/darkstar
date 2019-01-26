-----------------------------------------
-- Spell: Maiden's Virelai
-- Charms pet
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/pets")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    if (caster:getPet() ~= nil) then
        return dsp.msg.basic.ALREADY_HAS_A_PET
    elseif (target:getMaster() ~= nil and target:getMaster():isPC()) then
        return dsp.msg.basic.THAT_SOMEONES_PET
    end

    -- Per wiki, Virelai wipes all shadows even if it resists or the target is immune to charm
    -- This can't be done in the onSpellCast function (that runs after it "hits")
    spell:setFlag(dsp.magic.spellFlag.WIPE_SHADOWS)

    return 0
end

function onSpellCast(caster,target,spell)
    local dCHR = (caster:getStat(dsp.mod.CHR) - target:getStat(dsp.mod.CHR))
    local bonus = 0 -- No idea what value, but seems likely to need this edited later to get retail resist rates.
    local params = {}
    params.diff = nil
    params.attribute = dsp.mod.CHR
    params.skillType = dsp.skill.SINGING
    params.bonus = bonus
    params.effect = dsp.effect.CHARM_I
    local resist = applyResistanceEffect(caster, target, spell, params)
    -- print(resist)
    if (resist >= 0.25 and caster:getCharmChance(target, false) > 0) then
        spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        if (caster:isMob()) then
            target:addStatusEffect(dsp.effect.CHARM_I, 0, 0, 30*resist)
            caster:charm(target)
        else
            caster:charmPet(target)
        end
    else
        -- Resist
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return dsp.effect.CHARM_I
end
