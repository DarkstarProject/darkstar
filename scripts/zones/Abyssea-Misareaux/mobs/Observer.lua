-----------------------------------
-- Zone: Abyssea-Misareaux
--  NM:  Observer
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

		killer:addCurrency("Cruor",250);
		killer:messageSpecial(CRUOR_OBTAINED, 250);
		
    end