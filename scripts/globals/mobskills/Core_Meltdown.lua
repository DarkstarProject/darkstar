---------------------------------------------------
-- Core Meltdown (Ghrah)
-- Reactor core fails and self-destructs, damaging any nearby targets.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if(mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 1;
    elseif(mob:AnimationSub() ~=0) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1;

    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*math.random(7,15),ELE_NONE,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_NONE,MOBPARAM_IGNORE_SHADOWS);
    mob:setHP(0);
    target:delHP(dmg);
    return dmg;
end
