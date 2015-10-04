-----------------------------------
-- Zone: Abyssea-Misareaux
--  NM:  Ironclad Observer
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
    if (killer:hasKeyItem(SCALDING_IRONCLAD_SPIKE) == false) then
        killer:addKeyItem(SCALDING_IRONCLAD_SPIKE);
        killer:messageSpecial(KEYITEM_OBTAINED, SCALDING_IRONCLAD_SPIKE);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;