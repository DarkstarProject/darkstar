-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NM:  Quasimodo
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
    if (killer:hasKeyItem(OSSIFIED_GARGOUILLE_HAND) == false) then
        killer:addKeyItem(OSSIFIED_GARGOUILLE_HAND);
        killer:messageSpecial(KEYITEM_OBTAINED, OSSIFIED_GARGOUILLE_HAND);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;