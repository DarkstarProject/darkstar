---------------------------------------------------
-- Bubble Shower
-- Deals Water damage in an area of effect. Additional effect: STR Down
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_STR_DOWN;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,3);
		if(resist > 0.5) then
			target:addStatusEffect(typeEffect,30,0,180); --power=-30;tic=0;duration=180;
		end
	end

	local dmgmod = 1;
	local accmod = 1;
	local cMobHp = mob:getHP();
	local mMobHp = mob:getMaxHP();
	local dmgmod = cMobHp/mMobHp * 2;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
