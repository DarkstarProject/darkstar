-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NM:  Glavoid  
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
    if (killer:hasKeyItem(CHIPPED_SANDWORM_TOOTH) == false) then
        killer:addKeyItem(CHIPPED_SANDWORM_TOOTH);
        killer:messageSpecial(KEYITEM_OBTAINED, CHIPPED_SANDWORM_TOOTH);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;