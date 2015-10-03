-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NM:  Kur
-----------------------------------
package.loaded["scripts/zones/Abyssea-Uleguerand/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Uleguerand/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(BEGRIMED_DRAGON_HIDE) == false) then
        killer:addKeyItem(BEGRIMED_DRAGON_HIDE);
        killer:messageSpecial(KEYITEM_OBTAINED, BEGRIMED_DRAGON_HIDE);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;