-----------------------------------
-- Zone: Abyssea-Altepa
--  NM:  Amarok
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
    if (killer:hasKeyItem(STEAMING_CERBERUS_TONGUE) == false) then
        killer:addKeyItem(STEAMING_CERBERUS_TONGUE);
        killer:messageSpecial(KEYITEM_OBTAINED, STEAMING_CERBERUS_TONGUE);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;