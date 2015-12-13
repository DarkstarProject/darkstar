---------------------------------------------------
--  Guided_Missile
--
--  Description:  Reduces target's HP to 5% of its maximum value, ignores Utsusemi  ,Bind (30 sec)
--  Type: Magical
--  

---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local mobID = mob:getID();   --(16908294 ,16908301 ,16908308 =omega ,16933124=proto-omega)
    local mobhp = mob:getHPP();

    if ((mobID == 16908294 or mobID == 16908301 or mobID == 16908308) and mobhp < 26) then  --omega 
        return 0;
    elseif (mobID == 16933124 and mob:AnimationSub() == 1) then -- proto-omega four leg form
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

    local targetCurrentHP = target:getHP();
    local hpset = target:getMaxHP() * 0.05;
       local typeEffect = EFFECT_BIND;
       MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30);
    
    if (targetCurrentHP > hpset) then     
        dmg = targetCurrentHP - hpset;
    else
        dmg = 0;
    end
      
    target:delHP(dmg);
    return dmg;
end
