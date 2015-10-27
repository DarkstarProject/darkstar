---------------------------------------------
--  Guided_Missile
--
--  Description: Targeted 10'(?) AoE ~400-750 physical damage, absorbed by Utsusemi
--  Type: Physical
--  Wipes Shadows
--  Range: 10 yalms
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
 local mobID = mob:getID();   --(16908294 ,16908301 ,16908308 =omega ,16933124=proto-omega)
 local mobhp = mob:getHPP();
   if ((mobID == 16908294 or mobID ==16908301 or mobID ==16908308)and mobhp >25 ) then  --omega       
      return 0;
   elseif (mobID == 16933124 and mobhp > 70 ) then -- omega first bipedform
	  return 0;
   end
   return 1;
end;

function onMobWeaponSkill(target, mob, skill)
	local numhits = 1;
	local accmod = 1;
	local dmgmod = 3;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_2_SHADOW);	
	target:delHP(dmg);
	return dmg;
end;
