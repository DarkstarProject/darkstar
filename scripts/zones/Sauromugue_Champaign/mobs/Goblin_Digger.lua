-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Goblin Digger
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

function onMobDeath(mob,killer)
    checkRegime(killer,mob,97,2);
    checkRegime(killer,mob,98,2);

    if(ENABLE_ACP == 1 and (killer:hasKeyItem(CHUNK_OF_SMOKED_GOBLIN_GRUB) == false) and killer:getCurrentMission(ACP) >= THE_ECHO_AWAKENS) then
        -- Guesstimating 15% chance
        if (math.random(1,100) >= 85) then
            killer:addKeyItem(CHUNK_OF_SMOKED_GOBLIN_GRUB);
            killer:messageSpecial(KEYITEM_OBTAINED,CHUNK_OF_SMOKED_GOBLIN_GRUB);
        end
    end

end;