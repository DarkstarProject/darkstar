-----------------------------------
-- Zone: Abyssea-Attohwa
--  NM:  Tunga
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
    if (killer:hasKeyItem(DISTENDED_CHIGOE_ABDOMEN) == false) then
        killer:addKeyItem(DISTENDED_CHIGOE_ABDOMEN);
        killer:messageSpecial(KEYITEM_OBTAINED, DISTENDED_CHIGOE_ABDOMEN);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;