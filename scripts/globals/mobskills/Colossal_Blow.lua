---------------------------------------------------
-- Colossal_Blow
-- Deals damage to a single target.
-- 
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
 local mobID = mob:getID();   --(16908294 ,16908301 ,16908308 =omega ,16933124=proto-omega)
 local mobhp = mob:getHPP();
   if (mobID == 16933124 and mobhp < 30 )then -- omega second quadripedform
	  return 0;
   end
   return 1;
end;

function onMobWeaponSkill(target, mob, skill)

	local numhits = 1;
	local accmod = 0.8;
	local dmgmod = 5;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
