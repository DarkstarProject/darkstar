---------------------------------------------
--  Sledgehammer
--
--  Description: Delivers a sledgehammer blow to all targets in front. Additional effect: Petrification
--  Type: Physical
--  Utsusemi/Blink absorb: 3 shadows
--  Range: Front cone
--  Notes: Only used by Gurfurlur the Menacing.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_PETRIFICATION;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
		if(resist > 0.5) then
			target:addStatusEffect(typeEffect,1,0,60);--power=1;tic=0;duration=60;
		end
	end

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 3.2;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_3_SHADOW);
	target:delHP(dmg);

	return dmg;
end;
