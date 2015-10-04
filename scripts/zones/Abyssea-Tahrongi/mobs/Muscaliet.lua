-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NM:  Muscaliet  
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
    if (killer:hasKeyItem(LUXURIANT_MANTICORE_MANE) == false) then
        killer:addKeyItem(LUXURIANT_MANTICORE_MANE);
        killer:messageSpecial(KEYITEM_OBTAINED, LUXURIANT_MANTICORE_MANE);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;