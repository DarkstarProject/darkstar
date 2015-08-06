---------------------------------------------
--  Decayed Filament
--  Zedi, while in Animation form 2 (Bars)
--  Blinkable 1-2 hit, addtional effect poison on hit. 
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	if (mob:AnimationSub() ~= 2) then
		return 1;
	end

	return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local numhits = 2;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,0,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,0,info.hitslanded);
	local typeEffect = EFFECT_POISON;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 18, 3, 60);

	target:delHP(dmg);
	return dmg;

end;