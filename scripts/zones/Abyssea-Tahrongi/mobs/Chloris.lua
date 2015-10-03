-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NM:  Chloris  
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
    if (killer:hasKeyItem(OVERGROWN_MANDRAGORA_FLOWER) == false) then
        killer:addKeyItem(OVERGROWN_MANDRAGORA_FLOWER);
        killer:messageSpecial(KEYITEM_OBTAINED, OVERGROWN_MANDRAGORA_FLOWER);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;