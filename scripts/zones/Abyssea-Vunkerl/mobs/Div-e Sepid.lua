-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NM:  Div-e Sepid
-----------------------------------
package.loaded["scripts/zones/Abyssea-Vunkerl/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Vunkerl/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(CHIPPED_IMPS_OLIFANT) == false) then
        killer:addKeyItem(CHIPPED_IMPS_OLIFANT);
        killer:messageSpecial(KEYITEM_OBTAINED, CHIPPED_IMPS_OLIFANT);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;