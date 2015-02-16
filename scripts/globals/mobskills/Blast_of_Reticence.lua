---------------------------------------------
--  Tebbad Wing
--
--  Description: Deals darkness damage to enemies within a very wide area of effect. Additional effect: Sleep
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 30' radial.
--  Notes: Used only by Vrtra and Azdaja
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
  --  if (mob:AnimationSub() == 1) then
     --   return 1;
	--if(target:isBehind(mob, 48) == true) then
    --    return 1;
   -- end
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local currentHP = target:getHP();
	-- remove all by 1%
	local damage = 0;
	-- if have more hp then 30%, then reduce to 1%
	if(currentHP / target:getMaxHP() > 0.2) then
		damage = currentHP * .99;
	else
		-- else you die
		damage = currentHP * .99;
	end
	local dmgmod = 1;
	--local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,ELE_DARK,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(damage,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,MOBPARAM_IGNORE_SHADOWS);

	target:delHP(dmg);
	mob:resetEnmity(target);
	return dmg;
end;







