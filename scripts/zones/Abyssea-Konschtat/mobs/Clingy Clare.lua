-----------------------------------
-- Zone: Abyssea-Konschtat
--  NM:  Clingy Clare
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
    if (killer:hasKeyItem(DECAYING_MORBOL_TOOTH) == false) then
        killer:addKeyItem(DECAYING_MORBOL_TOOTH);
        killer:messageSpecial(KEYITEM_OBTAINED, DECAYING_MORBOL_TOOTH);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;