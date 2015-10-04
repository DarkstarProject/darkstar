-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NM:  Chukwa  
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
    if (killer:hasKeyItem(MOSSY_ADAMANTOISE_SHELL) == false) then
        killer:addKeyItem(MOSSY_ADAMANTOISE_SHELL);
        killer:messageSpecial(KEYITEM_OBTAINED, MOSSY_ADAMANTOISE_SHELL);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;