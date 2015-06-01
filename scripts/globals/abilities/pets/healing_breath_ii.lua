---------------------------------------------------
-- Healing Breath II
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
	-- TODO: Correct base value (45/256).  See Healing Breath III for details.

   ---------- Deep Breathing ----------
   -- 0 for none
   -- 1 for first merit
   -- 0.25 for each merit after the first
   -- TODO: 0.1 per merit for augmented AF2 (10663 *w/ augment*)
   local deep = 0;
   if (pet:hasStatusEffect(EFFECT_MAGIC_ATK_BOOST) == true) then
      deep = 1+((master:getMerit(MERIT_DEEP_BREATHING)-1)*0.25);
      pet:delStatusEffect(EFFECT_MAGIC_ATK_BOOST);
   end

   local gear = master:getMod(MOD_WYVERN_BREATH)/256; -- Master gear that enhances breath

	local base = math.floor((45/256)*(1+(pet:getTP()/1024))*(pet:getHP())+42);
	if(target:getHP()+base > target:getMaxHP()) then
		base = target:getMaxHP() - target:getHP(); --cap it
	end
	skill:setMsg(MSG_SELF_HEAL);
	target:addHP(base);
	return base;
end