-----------------------------------
-- Zone: Abyssea-La Theine
--  NM:  Grandgousier
-----------------------------------
package.loaded["scripts/zones/Abyssea-La_Theine/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-La_Theine/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(SEVERED_GIGAS_COLLAR) == false) then
        killer:addKeyItem(SEVERED_GIGAS_COLLAR);
        killer:messageSpecial(KEYITEM_OBTAINED, SEVERED_GIGAS_COLLAR);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;