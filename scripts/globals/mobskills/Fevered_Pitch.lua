---------------------------------------------
--  Fevered Pitch
--  Deals damage to a single target. Additional effect: Stun and Defense Down
--  Utsusemi/Blink absorb: 1 shadow
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_DEFENSE_DOWN;
	local statmod = MOD_INT;
	local resist = 1;
	if(target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,4);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,30,0,90);--power=30;tic=0;duration=90;
		end
	end

	typeEffect = EFFECT_STUN;
	if(target:hasStatusEffect(typeEffect) == true) then
		--statmod = MOD_INT;
		resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,7);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,1,0,7);--power=1;tic=0;duration=7;
		end
	end

	local numhits = 1;
	local accmod = 2;
	local dmgmod = 3;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_1_SHADOW);
	target:delHP(dmg);
	return dmg;
end;
