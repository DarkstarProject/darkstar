-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NM:  Treble Noctules  
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
    if (killer:hasKeyItem(TORN_BAT_WING) == false) then
        killer:addKeyItem(TORN_BAT_WING);
        killer:messageSpecial(KEYITEM_OBTAINED, TORN_BAT_WING);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;