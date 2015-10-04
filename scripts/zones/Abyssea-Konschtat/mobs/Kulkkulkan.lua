-----------------------------------
-- Zone: Abyssea-Konschtat
--  NM:  Kulkkulkan
-----------------------------------
package.loaded["scripts/zones/Abyssea-Konschtat/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Konschtat/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(VENOMOUS_PEISTE_CLAW) == false) then
        killer:addKeyItem(VENOMOUS_PEISTE_CLAW);
        killer:messageSpecial(KEYITEM_OBTAINED, VENOMOUS_PEISTE_CLAW);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;