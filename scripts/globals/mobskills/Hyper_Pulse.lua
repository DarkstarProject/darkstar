---------------------------------------------------
--  Hyper_Pulse
--
--  Description:  300 magic damage, Gravity and short Bind, wipes Utsusemi
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
   if ((mobID == 16908294 or mobID ==16908301 or mobID ==16908308)and mobhp > 25 ) then  --omega       
      return 0;
   elseif (mobID == 16933124 and mobhp > 30  and mobhp < 70) then -- omega  bipedform
	  return 0;
   end
   return 1;
end;

function onMobWeaponSkill(target, mob, skill)
   	local typeEffect1 = EFFECT_BIND;
   	MobStatusEffectMove(mob, target, typeEffect1, 1, 0, 4);
	
	local typeEffect2 = EFFECT_WEIGHT;
    MobStatusEffectMove(mob, target, typeEffect2, 50, 0, 30);

    local dmgmod = 1.5;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end
