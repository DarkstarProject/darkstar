---------------------------------------------
--  Tidal Slash
--
--  Description: Deals Water<a href="http://images.wikia.com/ffxi/images/b/b7/Exclamation.gif" class="image" title="Verification Needed" data-image-name="Exclamation.gif" id="Exclamation-gif"><img alt="Verification Needed" src="http://images1.wikia.nocookie.net/__cb20061130211022/ffxi/images/thumb/b/b7/Exclamation.gif/14px-Exclamation.gif" width="14" height="12" /> damage in a threefold attack to targets in a fan-shaped area of effect.
--  Type: Physical?
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Melee?
--  Notes: Used only by Merrows equipped with a spear. If they lost their spear, they'll use Hysteric Barrage instead.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local numhits = 3;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
