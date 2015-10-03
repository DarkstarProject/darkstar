-----------------------------------
-- Zone: Abyssea-Misareaux
--  NM:  Funereal Apkallu
-----------------------------------
package.loaded["scripts/zones/Abyssea-Misareaux/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Misareaux/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(JAGGED_APKALLU_BEAK) == false) then
        killer:addKeyItem(JAGGED_APKALLU_BEAK);
        killer:messageSpecial(KEYITEM_OBTAINED, JAGGED_APKALLU_BEAK);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;