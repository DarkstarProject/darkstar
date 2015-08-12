---------------------------------------------------
-- Chainspell
-- Meant for Qn'aern (RDM) with Ix'Aern encounter
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:getID() == 16916816) then
        if (mob:getHPP() <= 70) then
            return 0;
        end
    end;
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_CHAINSPELL;
    MobBuffMove(mob, typeEffect, 1, 0, 60);

    skill:setMsg(MSG_USES);
    return typeEffect;
end;
