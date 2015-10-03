-----------------------------------
-- Zone: Abyssea-La Theine
--  NM:  Ovni
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
    if (killer:hasKeyItem(SCARLET_ABYSSITE_OF_SOJOURN) == false) then
        killer:addKeyItem(SCARLET_ABYSSITE_OF_SOJOURN);
        killer:messageSpecial(KEYITEM_OBTAINED, SCARLET_ABYSSITE_OF_SOJOURN);
	if (killer:hasKeyItem(ATMA_OF_THE_HEAVENS) == false) then
        killer:addKeyItem(ATMA_OF_THE_HEAVENS);
        killer:messageSpecial(KEYITEM_OBTAINED, ATMA_OF_THE_HEAVENS);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		end
    end
end;