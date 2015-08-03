-----------------------------------
-- Area: Batallia Downs
--  MOB: Goblin Digger
-----------------------------------
package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Batallia_Downs/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    checkRegime(killer,mob,74,2);

    if (ENABLE_ACP == 1 and (killer:hasKeyItem(BOWL_OF_BLAND_GOBLIN_SALAD) == false) and killer:getCurrentMission(ACP) >= THE_ECHO_AWAKENS) then
        -- Guesstimating 15% chance
        if (math.random(1,100) >= 85) then
            killer:addKeyItem(BOWL_OF_BLAND_GOBLIN_SALAD);
            killer:messageSpecial(KEYITEM_OBTAINED,BOWL_OF_BLAND_GOBLIN_SALAD);
        end
    end

end;