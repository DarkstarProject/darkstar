-----------------------------------
-- Zone: Abyssea-La Theine
--  NM:  Baba Yaga  (H-7)
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
    if (killer:hasKeyItem(SHIMMERING_PIXIE_PINION) == false) then
        killer:addKeyItem(SHIMMERING_PIXIE_PINION);
        killer:messageSpecial(KEYITEM_OBTAINED, SHIMMERING_PIXIE_PINION);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;