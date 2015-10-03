-----------------------------------
-- Zone: Abyssea-La Theine
--  NM:  Pantagruel
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
    if (killer:hasKeyItem(WARPED_GIGAS_ARMBAND) == false) then
        killer:addKeyItem(WARPED_GIGAS_ARMBAND);
        killer:messageSpecial(KEYITEM_OBTAINED, WARPED_GIGAS_ARMBAND);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;