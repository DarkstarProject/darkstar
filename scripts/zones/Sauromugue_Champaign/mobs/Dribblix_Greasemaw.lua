-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Dribblix Greasemaw
-----------------------------------
package.loaded["scripts/zones/Sauromugue_Champaign/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Sauromugue_Champaign/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if ( (killer:hasKeyItem(SEEDSPALL_VIRIDIS) == false) and (player:hasKeyItem(VIRIDIAN_KEY) == false) ) then
        killer:addKeyItem(SEEDSPALL_VIRIDIS);
        killer:messageSpecial(KEYITEM_OBTAINED,SEEDSPALL_VIRIDIS);
    end
end;