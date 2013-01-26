---------------------------------------------------
-- Thunder Break
-- Channels the power of Thunder toward targets in an area of effect. Additional effect: Stun

---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_STUN;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_THUNDEr);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,1,0,math.random(4,8));--power=1;tic=0;duration=5;
		end
	end

	local dmgmod = math.random(1,2)+math.random();
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3.5,ELE_THUNDER,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_THUNDER,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
