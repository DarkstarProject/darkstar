-----------------------------------
-- Ability: Sentinel
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
   -- Whether feet have to be equipped before using ability, or if they can be swapped in
   -- is disputed.  Source used: http://wiki.bluegartr.com/bg/Sentinel
	local sFeet = player:getEquipID(SLOT_FEET);
	local power = 90;
	if(sFeet == 15138 or sFeet == 15671) then
		power = power + 13; -- -103%.  This is oddly correct.
	end

   -- Sent as positive power because UINTs, man.
   player:addStatusEffect(EFFECT_SENTINEL,power,3,30);

end;