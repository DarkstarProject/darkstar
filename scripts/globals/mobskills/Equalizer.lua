---------------------------------------------------
-- Equalizer
-- AoE damage (~600-800),
-- 
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
 local mobID = mob:getID();   --(16908295 ,16908302 ,16908309 =omega ,          16928966=proto-ultima   )
 local mobhp = mob:getHPP();
   if ((mobID == 16928966 and mobhp < 60 and mobhp > 20) or(mobhp < 40 and mobhp > 20 and(mobID == 16908295 or mobID == 16908302 or mobID == 16908309 )))then 
	  return 0;
   end
   return 1;
end;

function onMobWeaponSkill(target, mob, skill)

	local numhits = 2;
	local accmod = 1;
	local dmgmod = 2;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
