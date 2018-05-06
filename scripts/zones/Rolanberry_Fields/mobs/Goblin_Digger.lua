-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Goblin Digger
-----------------------------------
package.loaded["scripts/zones/Rolanberry_Fields/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/fieldsofvalor");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Rolanberry_Fields/TextIDs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,86,2);

    if (ENABLE_ACP == 1 and (player:hasKeyItem(dsp.ki.JUG_OF_GREASY_GOBLIN_JUICE) == false) and player:getCurrentMission(ACP) >= THE_ECHO_AWAKENS) then
        -- Guesstimating 15% chance
        if (math.random(1,100) >= 85) then
            player:addKeyItem(dsp.ki.JUG_OF_GREASY_GOBLIN_JUICE);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.JUG_OF_GREASY_GOBLIN_JUICE);
        end
    end

end;