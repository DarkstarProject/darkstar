-----------------------------------
-- Zone: Abyssea-Altepa
--  NM: Waugyl
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
    if (killer:hasKeyItem(WAUGYLS_CLAW) == false) then
        killer:addKeyItem(WAUGYLS_CLAW);
        killer:messageSpecial(KEYITEM_OBTAINED, WAUGYLS_CLAW);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;