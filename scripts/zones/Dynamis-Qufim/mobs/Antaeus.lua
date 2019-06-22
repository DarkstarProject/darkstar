-----------------------------------
-- Area: Dynamis Qufim
--  MOB: Antaeus
-----------------------------------
local ID = require("scripts/zones/Dynamis-Qufim/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/globals/titles");
-----------------------------------

function onMobEngaged(mob,target)
    if (GetServerVariable("[DynaQufim]Boss_Trigger") == 0) then
        -- spwan additional mob :
        for  Nightmare_Stirge = 16945407, 16945420, 1 do
                SpawnMob(Nightmare_Stirge);
        end
        for  Nightmare_Diremite = 16945422, 16945430, 1 do
                SpawnMob(Nightmare_Diremite);
        end
        for  Nightmare_Gaylas = 16945431, 16945442, 1 do
                SpawnMob(Nightmare_Gaylas);
        end
        for  Nightmare_Kraken = 16945443, 16945456, 1 do
                SpawnMob(Nightmare_Kraken);
        end
        for  Nightmare_Snoll = 16945458, 16945469, 1 do
                SpawnMob(Nightmare_Snoll);
        end
        for  Nightmare_Tiger = 16945510, 16945521, 1 do
                SpawnMob(Nightmare_Tiger);
        end
        for  Nightmare_Weapon = 16945549, 16945558, 1 do
                SpawnMob(Nightmare_Weapon);
        end
        for  Nightmare_Raptor = 16945589, 16945598, 1 do
                SpawnMob(Nightmare_Raptor);
        end
        SetServerVariable("[DynaQufim]Boss_Trigger",1);
    end
end;

function onMobDeath(mob, player, isKiller)
    if (player:hasKeyItem(dsp.ki.DYNAMIS_QUFIM_SLIVER ) == false) then
        player:addKeyItem(dsp.ki.DYNAMIS_QUFIM_SLIVER);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.DYNAMIS_QUFIM_SLIVER);
    end
    player:addTitle(dsp.title.DYNAMISQUFIM_INTERLOPER);
end;
