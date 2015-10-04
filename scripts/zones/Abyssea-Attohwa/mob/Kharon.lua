-----------------------------------
-- Zone: Abyssea-Attohwa
--  NM:  Kharon
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
    if (killer:hasKeyItem(CRACKED_SKELETON_CLAVICLE) == false) then
        killer:addKeyItem(CRACKED_SKELETON_CLAVICLE);
        killer:messageSpecial(KEYITEM_OBTAINED, CRACKED_SKELETON_CLAVICLE);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;