-----------------------------------
-- Zone: Abyssea-Attohwa
--  NM:  Gaizkin
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
    if (killer:hasKeyItem(BLOTCHED_DOOMED_TONGUE) == false) then
        killer:addKeyItem(BLOTCHED_DOOMED_TONGUE);
        killer:messageSpecial(KEYITEM_OBTAINED, BLOTCHED_DOOMED_TONGUE);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;