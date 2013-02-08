-----------------------------------
-- Ability: Counterstance
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
    local power = 50;

    local feet = player:getEquipID(SLOT_FEET);
    if(feet == 15133 or feet == 15666) then
        power = power + 10;
    end

	target:delStatusEffect(EFFECT_COUNTERSTANCE); --if not found this will do nothing
	target:addStatusEffect(EFFECT_COUNTERSTANCE,power,0,300);
end;
