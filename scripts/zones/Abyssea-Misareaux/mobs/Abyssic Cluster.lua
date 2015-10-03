-----------------------------------
-- Zone: Abyssea-Misareaux
--  NM:  Abyssic Cluster
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
    if (killer:hasKeyItem(BLAZING_CLUSTER_SOUL) == false) then
        killer:addKeyItem(BLAZING_CLUSTER_SOUL);
        killer:messageSpecial(KEYITEM_OBTAINED, BLAZING_CLUSTER_SOUL);
		killer:addCurrency("Cruor",500);
		killer:messageSpecial(CRUOR_OBTAINED, 500);
		
    end
end;