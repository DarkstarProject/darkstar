---------------------------------------------
--  Vampiric Lash
--
--  Description: Deals dark damage to a single target. Additional effect: Drain
--  Type: Magical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
--  Notes: In ToAU zones, this has an additional effect of absorbing all status effects, including food.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local dmgmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_DARK,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_1_SHADOW);

    target:delHP(dmg);

    mob:addHP(dmg);

    skill:setMsg(MSG_DRAIN_HP);

	return dmg;
end;
