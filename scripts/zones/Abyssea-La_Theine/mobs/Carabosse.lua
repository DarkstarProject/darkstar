-----------------------------------
-- Zone: Abyssea-La Theine
--  NM:  Carabosse
-----------------------------------
package.loaded["scripts/zones/Abyssea-La_Theine/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-La_Theine/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(GLITTERING_PIXIE_CHOKER) == false) then
        killer:addKeyItem(GLITTERING_PIXIE_CHOKER);
        killer:messageSpecial(KEYITEM_OBTAINED, GLITTERING_PIXIE_CHOKER);
		if (killer:hasKeyItem(ATMA_OF_ALLURE) == false) then
        killer:addKeyItem(ATMA_OF_ALLURE);
        killer:messageSpecial(KEYITEM_OBTAINED, ATMA_OF_ALLURE);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		end
    end
end;