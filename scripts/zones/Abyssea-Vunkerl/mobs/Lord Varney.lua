-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NM:  Lord Varney
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
    if (killer:hasKeyItem(IMBRUED_VAMPYR_FANG) == false) then
        killer:addKeyItem(IMBRUED_VAMPYR_FANG);
        killer:messageSpecial(KEYITEM_OBTAINED, IMBRUED_VAMPYR_FANG);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;