-------------------------------------------	ID: 18612--	Item: Ram Staff--  	Enchantment: "Retrace" (San d'Oria)-----------------------------------------require("scripts/globals/teleports");require("scripts/globals/settings");require("scripts/globals/status");------------------------------------------- OnItemCheck-----------------------------------------function onItemCheck(target)	result = 0;	if (target:isZoneVisited(80) == false) then        result = 56;    endreturn result;end;------------------------------------------- OnItemUse-----------------------------------------function onItemUse(target)	ramStaff(target);end;