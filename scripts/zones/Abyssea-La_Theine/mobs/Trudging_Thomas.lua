-----------------------------------
-- Zone: Abyssea-La Theine
--  NM:  Trudging Thomas
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
    if (killer:hasKeyItem(MARBLED_MUTTON_CHOP) == false) then
        killer:addKeyItem(MARBLED_MUTTON_CHOP);
        killer:messageSpecial(KEYITEM_OBTAINED, MARBLED_MUTTON_CHOP);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;