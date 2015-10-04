-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NM:  Dvalinn
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
    if (killer:hasKeyItem(DECAYED_DVERGR_TOOTH) == false) then
        killer:addKeyItem(DECAYED_DVERGR_TOOTH);
        killer:messageSpecial(KEYITEM_OBTAINED, DECAYED_DVERGR_TOOTH);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;