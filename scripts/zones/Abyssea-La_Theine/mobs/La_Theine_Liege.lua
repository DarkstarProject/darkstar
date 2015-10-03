-----------------------------------
-- Zone: Abyssea-La Theine
--  NM:  La Theine Liege
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
    if (killer:hasKeyItem(PELLUCID_FLY_EYE) == false) then
        killer:addKeyItem(PELLUCID_FLY_EYE);
        killer:messageSpecial(KEYITEM_OBTAINED, PELLUCID_FLY_EYE);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;