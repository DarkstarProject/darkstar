-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NM:  Orphanim  
-----------------------------------
package.loaded["scripts/zones/Abyssea-Tahrongi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Tahrongi/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(VEINOUS_HECTEYES_EYELID) == false) then
        killer:addKeyItem(VEINOUS_HECTEYES_EYELID);
        killer:messageSpecial(KEYITEM_OBTAINED, VEINOUS_HECTEYES_EYELID);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;