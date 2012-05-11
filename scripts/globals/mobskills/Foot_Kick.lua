---------------------------------------------------
-- Foot Kick
-- Deals critical damage. Chance of critical hit varies with TP. 
-- 100% TP: ??? / 200% TP: ??? / 300% TP: ???
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	numhits = 1;
	accmod = 1;
	dmgmod = 1;
	dmg = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_CRIT_VARIES,1,2,3);
	target:delHP(dmg);
	return dmg;
	
end