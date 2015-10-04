-----------------------------------
-- Zone: Abyssea-Grauberg
--  NM:  Ningishizida
-----------------------------------
package.loaded["scripts/zones/Abyssea-Grauberg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Grauberg/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(VENOMOUS_HYDRA_FANG) == false) then
        killer:addKeyItem(VENOMOUS_HYDRA_FANG);
        killer:messageSpecial(KEYITEM_OBTAINED, VENOMOUS_HYDRA_FANG);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;
