---------------------------------------------------
--  Catharsis
--
--  Description: Restores HP.
--
---------------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
end;

function onMobWeaponSkill(target, mob, skill)

    local potency = skill:getParam();

    if(potency == 0) then
    	potency = 20;
    end

    potency = potency - math.random(0, potency/1);

    skill:setMsg(MSG_SELF_HEAL);

    return MobHealMove(mob, mob:getMaxHP() * potency / 10);
end;
