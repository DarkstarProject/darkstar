-------------------------------------------	ID: 16048--	Item: Tavnzanian Ring--  	Enchantment: "Teleport" (Tavnzanian Safehold)-----------------------------------------require("scripts/globals/teleports");require("scripts/globals/settings");require("scripts/globals/status");------------------------------------------- OnItemCheck-----------------------------------------function onItemCheck(target)result = 0;	if (target:isZoneVisited(26) == false) then        result = 56;    end	return result;end;------------------------------------------- OnItemUse-----------------------------------------function onItemUse(target)	tavnzanianRing(target);end;