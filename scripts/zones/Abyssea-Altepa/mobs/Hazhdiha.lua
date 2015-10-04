-----------------------------------
-- Zone: Abyssea-Altepa
--  NM:  Hazhdiha
-----------------------------------
package.loaded["scripts/zones/Abyssea-Altepa/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Altepa/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(BLOODIED_DRAGON_EAR) == false) then
        killer:addKeyItem(BLOODIED_DRAGON_EAR);
        killer:messageSpecial(KEYITEM_OBTAINED, BLOODIED_DRAGON_EAR);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;