---------------------------------------------------
-- Earthen Ward
-- Titan grants Stoneskin to party members within area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	local base = (mob:getMainLvl() * 2) + 50;
	skill:setMsg(MSG_BUFF);
	if(mob:hasStatusEffect(EFFECT_STONESKIN) ~= false) then
		mob:delStatusEffect(EFFECT_STONESKIN);
	end
	mob:addStatusEffect(EFFECT_STONESKIN,base,0,180);
	return EFFECT_STONESKIN;
	
end