-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NM:  Ayravata
-----------------------------------
package.loaded["scripts/zones/Abyssea-Vunkerl/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Vunkerl/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(INGROWN_TAURUS_NAIL) == false) then
        killer:addKeyItem(INGROWN_TAURUS_NAIL);
        killer:messageSpecial(KEYITEM_OBTAINED, INGROWN_TAURUS_NAIL);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;