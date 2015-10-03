-----------------------------------
-- Zone: Abyssea-Attohwa
--  mob:  Ephemeral Murex
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
		killer:addCurrency("Cruor",250);
		killer:messageSpecial(CRUOR_OBTAINED, 250);
		
    end