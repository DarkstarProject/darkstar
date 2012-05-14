---------------------------------------------------
-- Fireball
-- Deals Fire damage in an area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
        
        dmgmod = 1;
        accmod = 1.4;
        info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*7,accmod,dmgmod,TP_NO_EFFECT);
        dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
        target:delHP(dmg);
        return dmg;
        
end
