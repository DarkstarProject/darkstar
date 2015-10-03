-----------------------------------
-- Zone: Abyssea-Misareaux
--  NM:  Cep-Kamuy
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
    if (killer:hasKeyItem(GLISTENING_OROBON_LIVER) == false) then
        killer:addKeyItem(GLISTENING_OROBON_LIVER);
        killer:messageSpecial(KEYITEM_OBTAINED, GLISTENING_OROBON_LIVER);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;