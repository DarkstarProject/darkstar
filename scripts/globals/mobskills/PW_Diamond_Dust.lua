---------------------------------------------------
-- Diamond Dust
-- Deals ice elemental damage to enemies within area of effect.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    mob:setLocalVar("astralflow",1);

    local dmgmod = 2;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 8,ELE_ICE,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_ICE,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end