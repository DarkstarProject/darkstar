-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NM:  Awahondo  
-----------------------------------
package.loaded["scripts/zones/Abyssea-Uleguerand/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Uleguerand/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(DECAYING_DIREMITE_FANG) == false) then
        killer:addKeyItem(DECAYING_DIREMITE_FANG);
        killer:messageSpecial(KEYITEM_OBTAINED, DECAYING_DIREMITE_FANG);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;