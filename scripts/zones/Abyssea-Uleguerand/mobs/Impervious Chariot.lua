-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NM:  Impervious Chariot
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
    if (killer:hasKeyItem(DENTED_CHARIOT_SHIELD) == false) then
        killer:addKeyItem(DENTED_CHARIOT_SHIELD);
        killer:messageSpecial(KEYITEM_OBTAINED, DENTED_CHARIOT_SHIELD);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;