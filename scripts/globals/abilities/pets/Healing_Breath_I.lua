---------------------------------------------------
-- Healing Breath I
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
	-- TODO: Correct formula.  See Healing Breath III for details.

	local base = math.floor((45/256)*(1+(pet:getTP()/1024))*(pet:getHP())+42);
	if(target:getHP()+base > target:getMaxHP()) then
		base = target:getMaxHP() - target:getHP(); --cap it
	end
	skill:setMsg(MSG_SELF_HEAL);
	target:addHP(base);
	return base;
end