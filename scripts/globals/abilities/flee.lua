-----------------------------------

--	Flee		

-----------------------------------
 


require("scripts/globals/settings");
require("scripts/globals/status");


function OnUseAbility(player, target, ability)
buff = 30;
if (player:getEquipID(8) == 14094) or (player:getEquipID(8) == 15357) then
buff = (buff + 15);
end
player:addStatusEffect(EFFECT_FLEE,1,0,buff);
end;