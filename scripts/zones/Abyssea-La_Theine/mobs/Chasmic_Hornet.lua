-----------------------------------
-- Zone: Abyssea-La Theine
--  NM:  Chasmic Hornet
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
    if (killer:hasKeyItem(SCARLET_ABYSSITE_OF_PERSPICACITY) == false) then
        killer:addKeyItem(SCARLET_ABYSSITE_OF_PERSPICACITY);
        killer:messageSpecial(KEYITEM_OBTAINED, SCARLET_ABYSSITE_OF_PERSPICACITY);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;