---------------------------------------------------
-- Call Beast
-- Call my pet.
---------------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:hasPet() or mob:getPet() == nil) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    mob:spawnPet();

    skill:setMsg(msgBasic.NONE);

    return 0;
end;
