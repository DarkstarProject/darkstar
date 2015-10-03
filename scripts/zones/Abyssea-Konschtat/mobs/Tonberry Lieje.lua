-----------------------------------
-- Zone: Abyssea-Konschtat
--  NM:  Tonberry Lieje
-----------------------------------
package.loaded["scripts/zones/Abyssea-Konschtat/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Konschtat/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(TWISTED_TONBERRY_CROWN) == false) then
        killer:addKeyItem(TWISTED_TONBERRY_CROWN);
        killer:messageSpecial(KEYITEM_OBTAINED, TWISTED_TONBERRY_CROWN);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;