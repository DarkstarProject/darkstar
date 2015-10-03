-----------------------------------
-- Zone: Abyssea-Attohwa
--  NM:  Drekavac
-----------------------------------
package.loaded["scripts/zones/Abyssea-Attohwa/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Attohwa/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(WRITHING_GHOST_FINGER) == false) then
        killer:addKeyItem(WRITHING_GHOST_FINGER);
        killer:messageSpecial(KEYITEM_OBTAINED, WRITHING_GHOST_FINGER);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;