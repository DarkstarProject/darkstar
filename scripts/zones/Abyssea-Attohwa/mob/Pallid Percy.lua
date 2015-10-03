-----------------------------------
-- Zone: Abyssea-Attohwa
--  NM:  Pallid Percy
-----------------------------------
package.loaded["scripts/zones/Abyssea-Attohwa/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Attohwa/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(MUCID_WORM_SEGMENT) == false) then
        killer:addKeyItem(MUCID_WORM_SEGMENT);
        killer:messageSpecial(KEYITEM_OBTAINED, MUCID_WORM_SEGMENT);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;