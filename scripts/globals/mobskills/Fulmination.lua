---------------------------------------------
--  Fulmination
--
--  Description: Deals heavy magical damage in an area of effect. Additional effect: Paralysis + Stun
--  Type: Magical
--  Wipes Shadows
--  Range: 30 yalms
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
   local family = mob:getFamily();
   local mobhp = mob:getHPP();

   if (family == 168 and mobhp <= 35) then -- Khimera < 35%
      return 0;
   elseif (family == 315 and mobhp <= 50) then -- Tyger < 50%
      return 0;
   end

   return 1;
end;

function onMobWeaponSkill(target, mob, skill)

-- TODO: Hits all players near Khimaira, not just alliance.

	local dmgmod = 3;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 4,ELE_LIGHTNING,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_THUNDER,MOBPARAM_WIPE_SHADOWS);
   MobStatusEffectMove(mob,target,EFFECT_PARALYSIS, 40, 0, 60);
   MobStatusEffectMove(mob,target,EFFECT_STUN, 1, 0, 4);
	target:delHP(dmg);
	return dmg;
end;
