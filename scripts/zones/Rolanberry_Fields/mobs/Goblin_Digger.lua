-----------------------------------
-- Area: Rolanberry Fields
-- MOB:  Goblin Digger
-----------------------------------
package.loaded["scripts/zones/Rolanberry_Fields/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Rolanberry_Fields/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    checkRegime(killer,mob,86,2);

    if (ENABLE_ACP == 1 and (killer:hasKeyItem(JUG_OF_GREASY_GOBLIN_JUICE) == false) and killer:getCurrentMission(ACP) >= THE_ECHO_AWAKENS) then
        -- Guesstimating 15% chance
        if (math.random(1,100) >= 85) then
            killer:addKeyItem(JUG_OF_GREASY_GOBLIN_JUICE);
            killer:messageSpecial(KEYITEM_OBTAINED,JUG_OF_GREASY_GOBLIN_JUICE);
        end
    end

end;