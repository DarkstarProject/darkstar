-----------------------------------
-- Zone: Abyssea-Konschtat
--  NM:  Gangly Gean
-----------------------------------
package.loaded["scripts/zones/Abyssea-Konschtat/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Konschtat/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(FRAGRANT_TREANT_PETAL) == false) then
        killer:addKeyItem(FRAGRANT_TREANT_PETAL);
        killer:messageSpecial(KEYITEM_OBTAINED, FRAGRANT_TREANT_PETAL);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;