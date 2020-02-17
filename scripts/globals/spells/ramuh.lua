---------------------------------------
-- Spell: Ramuh
-- Summons Ramuh to fight by your side
-----------------------------------------
require("scripts/globals/summon")
require("scripts/globals/pets")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    if (not caster:canUseMisc(tpz.zoneMisc.PET)) then
        return tpz.msg.basic.CANT_BE_USED_IN_AREA
    elseif (caster:hasPet()) then
        return tpz.msg.basic.ALREADY_HAS_A_PET
    elseif (caster:getObjType() == tpz.objType.PC) then
        return avatarMiniFightCheck(caster)
    end
    return 0
end

function onSpellCast(caster, target, spell)
    local effect = tpz.effect.DEBILITATION

    caster:spawnPet(tpz.pet.id.RAMUH)

    if caster:hasStatusEffect(effect) then
        local pet = caster:getPet()
        local statusEffect = caster:getStatusEffect(effect)
        local power = statusEffect:getPower()
        local duration = math.floor(statusEffect:getTimeRemaining()/1000)
        pet:addStatusEffectEx(effect, effect, power, 0, duration)
    end

    return 0
end
