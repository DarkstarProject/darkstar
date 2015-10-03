-----------------------------------
-- Zone: Abyssea-Konschtat
--  NM:  Alkonost
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
    if (killer:hasKeyItem(TATTERED_HIPPOGRYPH_WING) == false) then
        killer:addKeyItem(TATTERED_HIPPOGRYPH_WING);
        killer:messageSpecial(KEYITEM_OBTAINED, TATTERED_HIPPOGRYPH_WING);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;