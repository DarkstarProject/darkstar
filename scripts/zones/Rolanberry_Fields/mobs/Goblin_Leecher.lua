-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Goblin Leecher
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

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,86,2);

    if (ENABLE_ACP == 1 and (ally:hasKeyItem(JUG_OF_GREASY_GOBLIN_JUICE) == false) and ally:getCurrentMission(ACP) >= THE_ECHO_AWAKENS) then
        -- Guesstimating 15% chance
        if (math.random(1,100) >= 85) then
            ally:addKeyItem(JUG_OF_GREASY_GOBLIN_JUICE);
            ally:messageSpecial(KEYITEM_OBTAINED,JUG_OF_GREASY_GOBLIN_JUICE);
        end
    end

end;