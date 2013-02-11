---------------------------------------------
--  1000 Needles
--
--  Description: Shoots multiple needles at enemies within range.
--  Type: Magical (Light)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	
    local needles = 1000;
	local numhits = 1;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_LIGHT,needles);
    if (mob:isMobType(8)==true)then
     dmg =1000;
    end	
	target:delHP(dmg);
	return dmg;
end;
