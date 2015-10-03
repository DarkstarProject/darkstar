-----------------------------------
-- Zone: Abyssea-Konschtat
--  NM:  Keratyrannos
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
    if (killer:hasKeyItem(CRACKED_WIVRE_HORN) == false) then
        killer:addKeyItem(CRACKED_WIVRE_HORN);
        killer:messageSpecial(KEYITEM_OBTAINED, CRACKED_WIVRE_HORN);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;