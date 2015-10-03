-----------------------------------
-- Zone: Abyssea-Attohwa
--  NM:  Rahu
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
    if (killer:hasKeyItem(HOLLOW_DRAGON_EYE) == false) then
        killer:addKeyItem(HOLLOW_DRAGON_EYE);
        killer:messageSpecial(KEYITEM_OBTAINED, HOLLOW_DRAGON_EYE);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;