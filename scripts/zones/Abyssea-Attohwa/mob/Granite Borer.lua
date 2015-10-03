-----------------------------------
-- Zone: Abyssea-Attohwa
--  NM:  Granite Borer
-----------------------------------
package.loaded["scripts/zones/Abyssea-Attohwa/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Attohwa/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(VENOMOUS_WAMOURA_FEELER) == false) then
        killer:addKeyItem(VENOMOUS_WAMOURA_FEELER);
        killer:messageSpecial(KEYITEM_OBTAINED, VENOMOUS_WAMOURA_FEELER);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;