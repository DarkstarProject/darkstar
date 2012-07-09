---------------------------------------------
-- Magma_Hoplon
-- Covers the user in fiery spikes and absorbs damage. Enemies that hit it take fire damage. 
--
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	skill:setMsg(MSG_BUFF);
	if(mob:getStatusEffect(EFFECT_BLAZE_SPIKES) ~= nil) then
		mob:delStatusEffect(EFFECT_BLAZE_SPIKES);
	end
	randy = math.random(40,60);
	mob:addStatusEffect(EFFECT_BLAZE_SPIKES,randy,0,180);
	return EFFECT_BLAZE_SPIKES;
	
end