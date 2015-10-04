-----------------------------------
-- Zone: Abyssea-Attohwa
--  NM:  Blazing Eruca
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
    if (killer:hasKeyItem(BULBOUS_CRAWLER_COCOON) == false) then
        killer:addKeyItem(BULBOUS_CRAWLER_COCOON);
        killer:messageSpecial(KEYITEM_OBTAINED, BULBOUS_CRAWLER_COCOON);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;