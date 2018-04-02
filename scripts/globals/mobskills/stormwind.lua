---------------------------------------------
--  Stormwind
--
--  Description: Creates a whirlwind that deals Wind damage to targets in an area of effect.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown radial
--  Notes:
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1;
    
    if (mob:getName() == "Kreutzet") then
        local stormwindDamage = mob:getLocalVar("stormwindDamage");
        if (stormwindDamage == 2) then
            dmgmod = 1.25;
        elseif (stormwindDamage == 3) then
            dmgmod = 1.6;
        end
    end

    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_WIND,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_WIPE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;
