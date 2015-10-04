-----------------------------------
-- Zone: Abyssea-Grauberg
--  NM:  Melo Melo
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
    if (killer:hasKeyItem(VARIEGATED_URAGNITE_SHELL) == false) then
        killer:addKeyItem(VARIEGATED_URAGNITE_SHELL);
        killer:messageSpecial(KEYITEM_OBTAINED, VARIEGATED_URAGNITE_SHELL);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;