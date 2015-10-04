-----------------------------------
-- Zone: Abyssea-Misareaux
--  NM:  Manohra
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
    if (killer:hasKeyItem(CLIPPED_BIRD_WING) == false) then
        killer:addKeyItem(CLIPPED_BIRD_WING);
        killer:messageSpecial(KEYITEM_OBTAINED, CLIPPED_BIRD_WING);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;