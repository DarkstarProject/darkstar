-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Goblin Mugger
-----------------------------------
package.loaded["scripts/zones/Sauromugue_Champaign/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Sauromugue_Champaign/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,97,2);
    checkRegime(ally,mob,98,2);

    if (ENABLE_ACP == 1 and (ally:hasKeyItem(CHUNK_OF_SMOKED_GOBLIN_GRUB) == false) and ally:getCurrentMission(ACP) >= THE_ECHO_AWAKENS) then
        -- Guesstimating 15% chance
        if (math.random(1,100) >= 85) then
            ally:addKeyItem(CHUNK_OF_SMOKED_GOBLIN_GRUB);
            ally:messageSpecial(KEYITEM_OBTAINED,CHUNK_OF_SMOKED_GOBLIN_GRUB);
        end
    end

end;