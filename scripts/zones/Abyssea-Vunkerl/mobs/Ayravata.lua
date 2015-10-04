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
    if (killer:hasKeyItem(MALODOROUS_MARID_FUR) == false) then
        killer:addKeyItem(MALODOROUS_MARID_FUR);
        killer:messageSpecial(KEYITEM_OBTAINED, MALODOROUS_MARID_FUR);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;