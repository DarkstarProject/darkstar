-----------------------------------
-- Zone: Abyssea-La Theine
--  NM:  Megantereon
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
    if (killer:hasKeyItem(BLOODIED_SABER_TOOTH) == false) then
        killer:addKeyItem(BLOODIED_SABER_TOOTH);
        killer:messageSpecial(KEYITEM_OBTAINED, BLOODIED_SABER_TOOTH);
	if (killer:hasKeyItem(ATMA_OF_THE_SAVAGE_TIGER) == false) then
        killer:addKeyItem(ATMA_OF_THE_SAVAGE_TIGER);
        killer:messageSpecial(KEYITEM_OBTAINED, ATMA_OF_THE_SAVAGE_TIGER);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		end
    end
end;