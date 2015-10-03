-----------------------------------
-- Zone: Abyssea-Uleguerand
--  mob:  Sierra Tiger (???)
-----------------------------------
package.loaded["scripts/zones/Abyssea-Uleguerand/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Uleguerand/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
		killer:addCurrency("Cruor",250);
		killer:messageSpecial(CRUOR_OBTAINED, 250);
		
    end