---------------------------------------------------
-- Benediction
-- Meant for Qn'aern (WHM) with Ix'Aern encounter
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:getID() == 16916817) then
        if(mob:getHPP() <= 50) then
            return 0;
        end
    end;
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    target:eraseAllStatusEffect();

    local maxHeal = target:getMaxHP() - target:getHP();

    target:addHP(maxHeal);
    target:wakeUp();

    skill:setMsg(MSG_SELF_HEAL);

    return maxHeal;
end;
