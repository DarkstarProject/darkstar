-----------------------------------
-- Zone: Abyssea-Altepa
--  NM:  Ouzelum
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
    if (killer:hasKeyItem(RESPLENDENT_ROC_QUILL) == false) then
        killer:addKeyItem(RESPLENDENT_ROC_QUILL);
        killer:messageSpecial(KEYITEM_OBTAINED, RESPLENDENT_ROC_QUILL);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;