-----------------------------------
-- Zone: Abyssea-Konschtat
--  NM:  Raskovnik
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
    if (killer:hasKeyItem(FETID_RAFFLESIA_STALK) == false) then
        killer:addKeyItem(FETID_RAFFLESIA_STALK);
        killer:messageSpecial(KEYITEM_OBTAINED, FETID_RAFFLESIA_STALK);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;