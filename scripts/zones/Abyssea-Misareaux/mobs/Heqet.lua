-----------------------------------
-- Zone: Abyssea-Misareaux
--  NM:  Heqet
-----------------------------------
package.loaded["scripts/zones/Abyssea-Misareaux/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Misareaux/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(DOFFED_POROGGO_HAT) == false) then
        killer:addKeyItem(DOFFED_POROGGO_HAT);
        killer:messageSpecial(KEYITEM_OBTAINED, DOFFED_POROGGO_HAT);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;