---------------------------------------------
--  Hypothermal Combustion
--  Self-destructs, releasing ice at nearby targets.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Notes: Damage is based on remaining HP
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1;
        local BOMB_TOSS_HPP = skill:getHPP() / 100;

    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*20*BOMB_TOSS_HPP,ELE_ICE,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
    mob:setHP(0);
    target:delHP(dmg);
    return dmg;
end;
