-----------------------------------
-- Zone: Abyssea-Grauberg
--  NM:  Deelgeed
-----------------------------------
package.loaded["scripts/zones/Abyssea-Grauberg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Grauberg/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(VACANT_BUGARD_EYE) == false) then
        killer:addKeyItem(VACANT_BUGARD_EYE);
        killer:messageSpecial(KEYITEM_OBTAINED, VACANT_BUGARD_EYE);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;