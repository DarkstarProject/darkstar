---------------------------------------------------
--  Wild Carrot
--
--  Description: Restores HP.
--
---------------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local healPercent = math.random(1,4)+10; -- 9% - 12%
    local mobHP = mob:getHP();
    local mobMaxHP = mob:getMaxHP();
    local base = (mobMaxHP/100)* healPercent;
    if(mobHP+base > mobMaxHP) then
        base = mobMaxHP - mobHP;
    end
    skill:setMsg(MSG_SELF_HEAL);
    mob:addHP(base);
    return base;
end;
