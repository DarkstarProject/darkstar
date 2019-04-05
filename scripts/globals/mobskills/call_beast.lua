---------------------------------------------
-- Call Beast
-- Call my pet.
---------------------------------------------
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:hasPet() or mob:getPet() == nil then
        return 1
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    mob:spawnPet()

    skill:setMsg(dsp.msg.basic.NONE)

    return 0
end
