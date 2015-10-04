-----------------------------------
-- Zone: Abyssea-Misareaux
--  NM:  Sirrush
-----------------------------------
package.loaded["scripts/zones/Abyssea-Misareaux/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Misareaux/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(GNARLED_LIZARD_NAIL) == false) then
        killer:addKeyItem(GNARLED_LIZARD_NAIL);
        killer:messageSpecial(KEYITEM_OBTAINED, GNARLED_LIZARD_NAIL);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;