-----------------------------------
-- Area: Batallia Downs
--  MOB: Goblin Gambler
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

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,74,2);

    if (ENABLE_ACP == 1 and (player:hasKeyItem(BOWL_OF_BLAND_GOBLIN_SALAD) == false) and player:getCurrentMission(ACP) >= THE_ECHO_AWAKENS) then
        -- Guesstimating 15% chance
        if (math.random(1,100) >= 85) then
            player:addKeyItem(BOWL_OF_BLAND_GOBLIN_SALAD);
            player:messageSpecial(KEYITEM_OBTAINED,BOWL_OF_BLAND_GOBLIN_SALAD);
        end
    end

end;