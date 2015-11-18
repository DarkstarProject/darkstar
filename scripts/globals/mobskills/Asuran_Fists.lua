---------------------------------------------
--  Asuran Fists
--  Description: Delivers an eightfold attack. Accuracy varies with TP.
--  Type: Physical
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- maat can only use this at 70
    if (mob:getMainLvl() < 70) then
        return 1;
    end
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    if (target:getID() < 1000000) then target:showText(mob,TAKE_THAT_YOU_WHIPPERSNAPPER); end

	local numhits = 8;
	local accmod = 1;
	local dmgmod = 0.8;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
