---------------------------------------------
--  Tail Slap
--
--  Description: Delivers an area attack. Additional effect: "Stun." Damage varies with TP.
--  Type: Physical (Blunt)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_STUN;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,6);
		if(resist > 0.5) then
			target:addStatusEffect(typeEffect,1,0,math.random(2,6));--power=1;tic=0;duration=4;
		end
	end

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2.2;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_ATK_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
