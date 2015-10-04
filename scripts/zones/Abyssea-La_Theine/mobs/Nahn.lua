-----------------------------------
-- Zone: Abyssea-La Theine
--  NM:  Nahn
-----------------------------------
package.loaded["scripts/zones/Abyssea-La_Theine/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-La_Theine/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(SMOLDERING_CRAB_SHELL) == false) then
        killer:addKeyItem(SMOLDERING_CRAB_SHELL);
        killer:messageSpecial(KEYITEM_OBTAINED, SMOLDERING_CRAB_SHELL);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;