-----------------------------------
-- Zone: Abyssea-Konschtat
--  NM:  Fistule
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
    if (killer:hasKeyItem(TURBID_SLIME_OIL) == false) then
        killer:addKeyItem(TURBID_SLIME_OIL);
        killer:messageSpecial(KEYITEM_OBTAINED, TURBID_SLIME_OIL);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;