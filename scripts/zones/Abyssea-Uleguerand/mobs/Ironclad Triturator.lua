-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NM:  Ironclad Triturator
-----------------------------------
package.loaded["scripts/zones/Abyssea-Uleguerand/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Uleguerand/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(WARPED_IRON_GIANT_NAIL) == false) then
        killer:addKeyItem(WARPED_IRON_GIANT_NAIL);
        killer:messageSpecial(KEYITEM_OBTAINED, WARPED_IRON_GIANT_NAIL);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;