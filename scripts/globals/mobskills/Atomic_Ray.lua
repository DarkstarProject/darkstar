---------------------------------------------------
-- Spike Flail
-- Deals extreme damage in a threefold attack to targets behind the user.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
   -- if (mob:hasStatusEffect(EFFECT_MIGHTY_STRIKES)) then
   --     return 1;
  --  elseif (mob:hasStatusEffect(EFFECT_SUPER_BUFF)) then
  --      return 1;
  --  elseif (mob:hasStatusEffect(EFFECT_INVINCIBLE)) then
  --      return 1;
  --  elseif (mob:hasStatusEffect(EFFECT_BLOOD_WEAPON)) then
  --      return 1;
	--if(target:isBehind(mob, 48) == false) then
	--	return 1;
   -- elseif (mob:AnimationSub() == 1) then
    --    return 1;
	--end
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local dmgmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*10,ELE_FIRE,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	mob:resetEnmity(target);
	return dmg;
end;
