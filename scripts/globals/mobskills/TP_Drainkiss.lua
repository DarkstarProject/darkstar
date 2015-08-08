---------------------------------------------------
-- Drainkiss
-- Deals dark damage to a single target. Additional effect: TP Drain
-- Type: Magical
-- Utsusemi/Blink absorb: 1 shadow
-- Range: Melee
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:getTP() >= 50) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.6,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);


    skill:setMsg(MSG_DRAIN_TP);

    if (target:isUndead() == false) then
        -- can't go over limited mp
        if (target:getTP() < dmg) then
            dmg = target:getTP();
        end

        target:delTP(dmg);
        mob:addTP(dmg);
    else
        skill:setMsg(MSG_NO_EFFECT);
    end


    return dmg;
end;
