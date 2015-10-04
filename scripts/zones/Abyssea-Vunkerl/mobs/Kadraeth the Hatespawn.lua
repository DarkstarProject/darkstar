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
    if (killer:hasKeyItem(PULSATING_SOULFLAYER_BEARD) == false) then
        killer:addKeyItem(PULSATING_SOULFLAYER_BEARD);
        killer:messageSpecial(KEYITEM_OBTAINED, PULSATING_SOULFLAYER_BEARD);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;