-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NM:  Hedetet  
-----------------------------------
package.loaded["scripts/zones/Abyssea-Tahrongi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Tahrongi/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(GORY_SCORPION_CLAW) == false) then
        killer:addKeyItem(GORY_SCORPION_CLAW);
        killer:messageSpecial(KEYITEM_OBTAINED, GORY_SCORPION_CLAW);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;