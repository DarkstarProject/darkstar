---------------------------------------------------
-- Berserk
-- Berserk Ability.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	skill:setMsg(MSG_BUFF);
	if(mob:getStatusEffect(EFFECT_BERSERK) ~= nil) then
		mob:delStatusEffect(EFFECT_BERSERK);
	end
	mob:addStatusEffect(EFFECT_BERSERK,1,0,180);
	return EFFECT_BERSERK;
	
end