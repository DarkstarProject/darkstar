-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Goblin Digger
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/settings");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Sauromugue_Champaign/IDs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 97, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 98, 2, dsp.regime.type.FIELDS)
    if (ENABLE_ACP == 1 and (player:hasKeyItem(dsp.ki.CHUNK_OF_SMOKED_GOBLIN_GRUB) == false) and player:getCurrentMission(ACP) >= THE_ECHO_AWAKENS) then
        -- Guesstimating 15% chance
        if (math.random(1,100) >= 85) then
            player:addKeyItem(dsp.ki.CHUNK_OF_SMOKED_GOBLIN_GRUB);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.CHUNK_OF_SMOKED_GOBLIN_GRUB);
        end
    end

end;