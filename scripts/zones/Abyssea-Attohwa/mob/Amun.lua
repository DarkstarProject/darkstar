-----------------------------------
-- Zone: Abyssea-Attohwa
--  NM:  Amun 
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
    if (killer:hasKeyItem(SHRIVELED_HECTEYES_STALK) == false) then
        killer:addKeyItem(SHRIVELED_HECTEYES_STALK);
        killer:messageSpecial(KEYITEM_OBTAINED, SHRIVELED_HECTEYES_STALK);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;