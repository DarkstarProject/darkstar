-----------------------------------
-- Area: Batallia Downs
--  MOB: Goblin Shaman
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

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,74,2);

    if (ENABLE_ACP == 1 and (ally:hasKeyItem(BOWL_OF_BLAND_GOBLIN_SALAD) == false) and ally:getCurrentMission(ACP) >= THE_ECHO_AWAKENS) then
        -- Guesstimating 15% chance
        if (math.random(1,100) >= 85) then
            ally:addKeyItem(BOWL_OF_BLAND_GOBLIN_SALAD);
            ally:messageSpecial(KEYITEM_OBTAINED,BOWL_OF_BLAND_GOBLIN_SALAD);
        end
    end

end;