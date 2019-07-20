-----------------------------------
-- Area: Dynamis - Buburimu
--  Mob: Apocalyptic Beast
-----------------------------------
local ID = require("scripts/zones/Dynamis-Buburimu/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/globals/titles");
-----------------------------------

function onMobEngaged(mob,target)
    if (GetServerVariable("[DynaBuburimu]Boss_Trigger") == 0) then
        --spwan additional mob :
        for additionalmob = 16941489, 16941665, 1 do
            if (additionalmob ~= 16941666 or additionalmob ~= 16941576 or additionalmob ~= 16941552 or additionalmob ~= 16941520) then
                SpawnMob(additionalmob);
            end
        end
        SetServerVariable("[DynaBuburimu]Boss_Trigger",1);
    end
end;

function onMobDeath(mob, player, isKiller)
    if (player:hasKeyItem(dsp.ki.DYNAMIS_BUBURIMU_SLIVER ) == false) then
        player:addKeyItem(dsp.ki.DYNAMIS_BUBURIMU_SLIVER);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.DYNAMIS_BUBURIMU_SLIVER);
    end
    player:addTitle(dsp.title.DYNAMISBUBURIMU_INTERLOPER);
end;
