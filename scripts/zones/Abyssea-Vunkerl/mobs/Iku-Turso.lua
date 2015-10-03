-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NM:  Ayravata
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
    if (killer:hasKeyItem(GLOSSY_SEA_MONK_SUCKER) == false) then
        killer:addKeyItem(GLOSSY_SEA_MONK_SUCKER);
        killer:messageSpecial(KEYITEM_OBTAINED, GLOSSY_SEA_MONK_SUCKER);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;