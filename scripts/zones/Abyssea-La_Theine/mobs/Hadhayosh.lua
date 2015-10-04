-----------------------------------
-- Zone: Abyssea-La Theine
--  NM:  Hadhayosh
-----------------------------------
package.loaded["scripts/zones/Abyssea-La_Theine/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-La_Theine/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(ATMA_OF_THE_LION) == false) then
        killer:addKeyItem(ATMA_OF_THE_LION);
        killer:messageSpecial(KEYITEM_OBTAINED, ATMA_OF_THE_LION);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;