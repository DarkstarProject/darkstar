-----------------------------------
-- Zone: Abyssea-Misareaux
--  NM:  Minax Bugard
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
    if (killer:hasKeyItem(BLOODSTAINED_BUGARD_FANG) == false) then
        killer:addKeyItem(BLOODSTAINED_BUGARD_FANG);
        killer:messageSpecial(KEYITEM_OBTAINED, BLOODSTAINED_BUGARD_FANG);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;