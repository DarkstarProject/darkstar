---------------------------------------------------
--  Hex Palm
--  Family: Qutrub
--  Description: Steals HP from targets in front.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Front cone
--  Notes: Used only when wielding no weapon.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:AnimationSub() == 1 or mob:AnimationSub() == 3) then
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1.1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_WIPE_SHADOWS);

    skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_HP, dmg));

    return dmg;
end;