-----------------------------------
-- Zone: Abyssea-Grauberg
--  NM:  Ironclad Sunderer
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
    if (killer:hasKeyItem(SHATTERED_IRON_GIANT_CHAIN) == false) then
        killer:addKeyItem(SHATTERED_IRON_GIANT_CHAIN);
        killer:messageSpecial(KEYITEM_OBTAINED, SHATTERED_IRON_GIANT_CHAIN);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;