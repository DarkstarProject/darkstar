---------------------------------------------
--  Vampiric Lash
--
--  Description: Deals dark damage to a single target. Additional effect: Drain
--  Type: Magical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
--  Notes: In ToAU zones, this has an additional effect of absorbing all status effects, including food.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local dmgmod = math.random(2,3);
	local accmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_1_SHADOW);

    target:delHP(dmg);

    if(target:isUndead() == false) then
        mob:addHP(dmg*.5);
    end

	return dmg;
end;
