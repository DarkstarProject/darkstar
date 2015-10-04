-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NM:  Rakshas
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
    if (killer:hasKeyItem(WARPED_SMILODON_CHOKER) == false) then
        killer:addKeyItem(WARPED_SMILODON_CHOKER);
        killer:messageSpecial(KEYITEM_OBTAINED, WARPED_SMILODON_CHOKER);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;