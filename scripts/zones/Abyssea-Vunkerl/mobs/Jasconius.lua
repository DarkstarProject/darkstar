-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NM:  Jasconius
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
    if (killer:addCurrency("Cruor",250);
		killer:messageSpecial(CRUOR_OBTAINED, 250);
		
    end