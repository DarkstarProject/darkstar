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

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2.5;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

	local hit = MobPhysicalHit(skill, dmg, target, info.hitslanded);
	local typeEffect = EFFECT_DEFENSE_DOWN;
	local statmod = MOD_INT;
	local resist = 1;
	if(hit and target:hasStatusEffect(typeEffect) == false) then
		resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_WIND);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,30,0,90*resist);--power=30;tic=0;duration=90;
		end
	end

	typeEffect = EFFECT_STUN;
	if(hit and target:hasStatusEffect(typeEffect) == false) then
		--statmod = MOD_INT;
		resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_THUNDER);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,1,0,7*resist);--power=1;tic=0;duration=7;
		end
	end

	target:delHP(dmg);
	return dmg;
end;
