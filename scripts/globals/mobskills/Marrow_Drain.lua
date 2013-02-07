---------------------------------------------------
-- Marrow Drain
-- Steals an enemy's MP. Ineffective against undead.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    if(mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 0;
    end
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
    local dmgmod = 0.9;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);


    if(target:isUndead() == false) then
        target:delMP(dmg);
        mob:addMP(dmg);
        skill:setMsg(MSG_DRAIN_MP);
    else
        skill:setMsg(MSG_NO_EFFECT);
    end

    return dmg;
end;
