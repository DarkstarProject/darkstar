-----------------------------------
-- Zone: Abyssea-Tahrongi
--  mob:  Pachypodium (???)
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
		killer:addCurrency("Cruor",250);
		killer:messageSpecial(CRUOR_OBTAINED, 250);
		
    end