-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NM:  Alectryon  
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
    if (killer:hasKeyItem(FAT_LINED_COCKATRICE_SKIN) == false) then
        killer:addKeyItem(FAT_LINED_COCKATRICE_SKIN);
        killer:messageSpecial(KEYITEM_OBTAINED, FAT_LINED_COCKATRICE_SKIN);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;