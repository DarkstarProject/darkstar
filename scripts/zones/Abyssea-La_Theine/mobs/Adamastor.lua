-----------------------------------
-- Zone: Abyssea-La Theine
--  NM:  Adamastor  
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
    if (killer:hasKeyItem(DENTED_GIGAS_SHIELD) == false) then
        killer:addKeyItem(DENTED_GIGAS_SHIELD);
        killer:messageSpecial(KEYITEM_OBTAINED, DENTED_GIGAS_SHIELD);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;