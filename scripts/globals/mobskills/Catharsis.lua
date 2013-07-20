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

function OnMobSkillCheck(target,mob,skill)
    if(target:getCurrentRegion() == 18) then
        return 0;
    end

    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)

    local potency = skill:getParam();

    if(potency == 0) then
    	potency = 8;
    end

    potency = potency + math.random(0, potency/2);

    skill:setMsg(MSG_SELF_HEAL);

    return MobHealMove(mob, mob:getHPP() * potency);
end;
