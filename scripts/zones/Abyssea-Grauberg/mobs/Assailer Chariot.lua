-----------------------------------
-- Zone: Abyssea-Grauberg
--  NM:  Assailer chariot 
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
    if (killer:hasKeyItem(WARPED_CHARIOT_PLATE) == false) then
        killer:addKeyItem(WARPED_CHARIOT_PLATE);
        killer:messageSpecial(KEYITEM_OBTAINED, WARPED_CHARIOT_PLATE);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;