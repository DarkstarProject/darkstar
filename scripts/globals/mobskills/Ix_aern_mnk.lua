---------------------------------------------------
-- Hundred Fists
-- Meant for Ix'Aern (MNK)
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:getID() == 16916815 and mob:getLocalVar("BracerMode") == 1) then
        if (mob:getHPP() <= 50) then
            return 0;
        end
    end;
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_HUNDRED_FISTS;
    MobBuffMove(mob, typeEffect, 1, 0, 45);

    mob:setLocalVar("BracerMode", 2);
    skill:setMsg(MSG_USES);
    return typeEffect;
end;
