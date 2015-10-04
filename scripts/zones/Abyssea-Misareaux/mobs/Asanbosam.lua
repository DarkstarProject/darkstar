-----------------------------------
-- Zone: Abyssea-Misareaux
--  NM:  Asanbosam
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
    if (killer:hasKeyItem(BLOODIED_BAT_FUR) == false) then
        killer:addKeyItem(BLOODIED_BAT_FUR);
        killer:messageSpecial(KEYITEM_OBTAINED, BLOODIED_BAT_FUR);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;