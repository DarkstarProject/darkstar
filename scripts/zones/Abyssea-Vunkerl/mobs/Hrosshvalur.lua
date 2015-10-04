-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NM:  Hrosshvalur
-----------------------------------
package.loaded["scripts/zones/Abyssea-Vunkerl/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Vunkerl/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(SHIMMERING_PUGIL_SCALE) == false) then
        killer:addKeyItem(SHIMMERING_PUGIL_SCALE);
        killer:messageSpecial(KEYITEM_OBTAINED, SHIMMERING_PUGIL_SCALE);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;