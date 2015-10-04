-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NM:  Adze  
-----------------------------------
package.loaded["scripts/zones/Abyssea-Tahrongi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Tahrongi/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(STICKY_GNAT_WING) == false) then
        killer:addKeyItem(STICKY_GNAT_WING);
        killer:messageSpecial(KEYITEM_OBTAINED, STICKY_GNAT_WING);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;