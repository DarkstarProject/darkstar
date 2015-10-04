-----------------------------------
-- Zone: Abyssea-Konschtat
--  NM:  Arimaspi
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
    if (killer:hasKeyItem(MUCID_AHRIMAN_EYEBALL) == false) then
        killer:addKeyItem(MUCID_AHRIMAN_EYEBALL);
        killer:messageSpecial(KEYITEM_OBTAINED, MUCID_AHRIMAN_EYEBALL);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;