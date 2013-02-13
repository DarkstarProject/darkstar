---------------------------------------------------
-- Burning Strike M = 6?
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/summon");
require("/scripts/globals/magic");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
	numhits = 1;
	accmod = 1;
	dmgmod = 6;

	totaldamage = 0;
	damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3);
	--get resist multiplier (1x if no resist)
	resist = applyPlayerResistance(pet,-1,target,pet:getStat(MOD_INT)-target:getStat(MOD_INT),ELEMENTAL_MAGIC_SKILL, ELE_FIRE);
	--get the resisted damage
	damage.dmg = damage.dmg*resist;
	--add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	damage.dmg = mobAddBonuses(pet,spell,target,dmg,1);
	totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,numhits);
	target:delHP(totaldamage);
	target:updateEnmityFromDamage(pet,totaldamage);

	return totaldamage;
end