---------------------------------------------
--  Haymaker
--
--  Description: Punches the daylights out of all targets in front. Additional effect: Amnesia
--  Type: Physical
--  Utsusemi/Blink absorb: Unknown
--  Range: Front cone
--  Notes: Only used by Gurfurlur the Menacing.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
  if(mob:getFamily() == 316) then
    local mobSkin = mob:getModelId();

    if (mobSkin == 1867) then
        return 0;
    else
        return 1;
    end
  end
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,info.hitslanded);

	local typeEffect = EFFECT_AMNESIA;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 60);

	target:delHP(dmg);
	return dmg;
end;
