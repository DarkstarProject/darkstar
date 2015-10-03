-----------------------------------
-- Zone: Abyssea-Altepa
--  NM:  Long-Barreled Chariot
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
    if (killer:hasKeyItem(RUSTED_CHARIOT_GEAR) == false) then
        killer:addKeyItem(RUSTED_CHARIOT_GEAR);
        killer:messageSpecial(KEYITEM_OBTAINED, RUSTED_CHARIOT_GEAR);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;