---------------------------------------------
--  Ill Wind
--  Description: Deals Wind damage to enemies within an area of effect. Additional effect: Dispel
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes Shadows
--  Range: Unknown radial
--  Notes: Only used by Puks in Mamook, Besieged, and the following Notorious Monsters: Vulpangue, Nis Puk, Nguruvilu, Seps , Phantom Puk and Waugyl. Dispels one effect.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	target:dispelStatusEffect();

	local dmgmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.5,ELE_WIND,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);

	--printf("[TP MOVE] Zone: %u Monster: %u Mob lvl: %u TP: %u TP Move: %u Damage: %u on Player: %u Level: %u HP: %u",mob:getZoneID(),mob:getID(),mob:getMainLvl(),skill:getTP(),skill:getID(),dmg,target:getID(),target:getMainLvl(),target:getMaxHP());

	return dmg;
end;
