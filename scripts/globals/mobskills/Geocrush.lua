---------------------------------------------------
-- Geocrush
-- Titan deals Earth elemental damage and stuns target.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)

	if(applyPlayerResistance(mob,skill,target,true,EFFECT_STUN,MOD_INT, ELE_EARTH) > 0.5) then
		if(target:hasStatusEffect(EFFECT_STUN) == false) then
			target:addStatusEffect(EFFECT_STUN,1,0,7);
		end
	end

	local dmgmod = 2;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 4,ELE_EARTH,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;

end