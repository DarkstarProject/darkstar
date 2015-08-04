---------------------------------------------------
--  Stun_Cannon.lua
--
--  Description: 20'(?) AoE ~300 magic damage and Paralysis, ignores Utsusemi
--  Type: Magical
--  
--  Range: 20 yalms
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
 local mobID = mob:getID();   --(16908294 ,16908301 ,16908308 =omega ,16933124=proto-omega)
 local mobhp = mob:getHPP();
   if (mobID == 16933124 and mobhp < 70 and mobhp > 30 ) then -- proto-omega bipedform
	  return 0;
   end
   return 1;
end;

function onMobWeaponSkill(target, mob, skill)
   local dmgmod = 1.5;
   local typeEffect = EFFECT_PARALYSIS;
   
    MobStatusEffectMove(mob, target, typeEffect, 20, 0, 120);
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    
	target:delHP(dmg);
    return dmg;
end
