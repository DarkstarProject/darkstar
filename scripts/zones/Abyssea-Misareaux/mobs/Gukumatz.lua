-----------------------------------
-- Zone: Abyssea-Misareaux
--  NM:  Gukumatz
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
    if (killer:hasKeyItem(MOLTED_PEISTE_SKIN) == false) then
        killer:addKeyItem(MOLTED_PEISTE_SKIN);
        killer:messageSpecial(KEYITEM_OBTAINED, MOLTED_PEISTE_SKIN);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;