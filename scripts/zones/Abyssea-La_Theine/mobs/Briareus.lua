-----------------------------------
-- Zone: Abyssea-La Theine
--  NM:  Briareus  (H-7)
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
    if (killer:hasKeyItem(BLOOD_SMEARED_GIGAS_HELM) == false) then
        killer:addKeyItem(BLOOD_SMEARED_GIGAS_HELM);
        killer:messageSpecial(KEYITEM_OBTAINED, BLOOD_SMEARED_GIGAS_HELM);
	if (killer:hasKeyItem(ATMA_OF_THE_STOUT_ARM) == false) then
        killer:addKeyItem(ATMA_OF_THE_STOUT_ARM);
        killer:messageSpecial(KEYITEM_OBTAINED, ATMA_OF_THE_STOUT_ARM);
		killer:addCurrency("Cruor",1500);
		killer:messageSpecial(CRUOR_OBTAINED, 1500);
		end
    end
end;