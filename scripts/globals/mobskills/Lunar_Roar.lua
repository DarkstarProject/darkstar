---------------------------------------------------
-- Lunar Roar
-- Fenrir removes two beneficial status effects from enemies within Area of Effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	target:dispelStatusEffect();
	target:dispelStatusEffect();
	skill:setMsg(0);
	return 0;
	
end