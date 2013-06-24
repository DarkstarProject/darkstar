---------------------------------------------------
-- Berserk
-- Berserk Ability.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    if(mob:getHPP() <= 30) then
        return 0;
    end
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
    target:eraseAllStatusEffect();

    local maxHeal = target:getMaxHP() - target:getHP();

    target:addHP(maxHeal);
    target:wakeUp();

    skill:setMsg(MSG_SELF_HEAL);

    return maxHeal;
end;
