-----------------------------------
-- Zone: Abyssea-Altepa
--  NM: Ironclad Smiter
-----------------------------------
package.loaded["scripts/zones/Abyssea-Altepa/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Altepa/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(BROKEN_IRON_GIANT_SPIKE) == false) then
        killer:addKeyItem(BROKEN_IRON_GIANT_SPIKE);
        killer:messageSpecial(KEYITEM_OBTAINED, BROKEN_IRON_GIANT_SPIKE);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;