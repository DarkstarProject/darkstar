-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NM:  Minhocao  
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
    if (killer:hasKeyItem(SODDEN_SANDWORM_HUSK) == false) then
        killer:addKeyItem(SODDEN_SANDWORM_HUSK);
        killer:messageSpecial(KEYITEM_OBTAINED, SODDEN_SANDWORM_HUSK);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;