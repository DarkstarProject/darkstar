---------------------------------------------------
-- Restoral
-- Description: Restores HP.
---------------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local mobSkin = mob:getModelId();

    if (mobSkin == 1820) then
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local potency = skill:getParam();
    local mobhp = mob:getHPP();

    if mobhp > 50 then
        return 0;
    end

    if (potency == 0) then
        potency = 10;
    end

    potency = potency - math.random(0, potency/1);

    skill:setMsg(MSG_SELF_HEAL);

    return MobHealMove(mob, mob:getMaxHP() * potency / 10);
end;
