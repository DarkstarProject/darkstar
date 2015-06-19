---------------------------------------------------
-- Call Wyvern
-- Call my pet.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if(mob:hasPet() or mob:getPet() == nil) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    mob:spawnPet();

    skill:setMsg(MSG_NONE);

    return 0;
end;
