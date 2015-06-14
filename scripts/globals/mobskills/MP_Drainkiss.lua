---------------------------------------------------
-- MP Drainkiss
-- Deals dark damage to a single target. Additional effect: Aspir
-- Type: Magical
-- Utsusemi/Blink absorb: 1 shadow
-- Range: Melee
-- Notes: If used against undead, it will simply do damage and not drain MP.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if(target:getMP() > 0) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*1.6,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

    skill:setMsg(MSG_DRAIN_MP);

    if(target:isUndead() == false) then

        -- can't go over limited mp
        if(target:getMP() < dmg) then
            dmg = target:getMP();
        end

        target:delMP(dmg);
        mob:addMP(dmg);
    else
        skill:setMsg(MSG_NO_EFFECT);
    end

    return dmg;
end;
