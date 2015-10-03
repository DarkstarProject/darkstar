-----------------------------------
-- Zone: Abyssea-Attohwa
--  NM:  Gieremund
-----------------------------------
package.loaded["scripts/zones/Abyssea-Attohwa/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/zones/Abyssea-Attohwa/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:hasKeyItem(RUSTED_HOUND_COLLAR) == false) then
        killer:addKeyItem(RUSTED_HOUND_COLLAR);
        killer:messageSpecial(KEYITEM_OBTAINED, RUSTED_HOUND_COLLAR);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;