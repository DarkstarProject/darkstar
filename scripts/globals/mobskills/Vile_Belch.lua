---------------------------------------------------

---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
	local NM = mob:getID();
	local HP = mob:getHPP();
	
	if (NM == 17662476 or NM == 17662481 or NM == 17662486) and (HP > 50) then
		return 0;
	end
	return 1;
end;

function onMobWeaponSkill(target, mob, skill)
	local numhits = 2;
	local accmod = 2;
	local dmgmod = 6;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg(),ELE_NONE,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_NONE,MOBPARAM_3_SHADOW);
    MobStatusEffectMove(mob, target, EFFECT_SILENCE, 1, 0, 30);
	MobStatusEffectMove(mob, target, EFFECT_PLAGUE, 1, 0, 30);
	target:delHP(dmg);
    mob:resetEnmity(target);
	return dmg;
end;
