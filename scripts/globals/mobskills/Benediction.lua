---------------------------------------------------
-- Berserk
-- Berserk Ability.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (skill:getParam() ~= 0) then
        return 1;
    elseif (mob:getHPP() <= 50) then
        return 0;
    end
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
