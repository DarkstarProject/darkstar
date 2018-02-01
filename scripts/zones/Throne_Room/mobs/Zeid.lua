-----------------------------------
-- Area: Throne Room
--  MOB: Zeid
-- Mission 9-2 BASTOK BCNM Fight
-----------------------------------
require("scripts/zones/Throne_Room/MobIDs");

function onMobFight(mob, target)
end;

function onMobDeath(mob, player, isKiller)
    player:startEvent(32004,3,3,1,3,3,3,3,3);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 32004) then

        local bfid = player:getVar("bcnm_instanceid");
        local zeidId = ZEID_BCNM_OFFSET + (bfid - 1) * 4;
        local playerCoords = 
        {
            [1] = {-443      , -167 , -239     , 127},
            [2] = {-762.949  , -407 , -478.991 , 127},
            [3] = {-1082.787 , -647 , -718.976 , 127},
        }
        local volkerCoords = 
        {
            [1] = {-450      , -167 , -239     , 125},
            [2] = {-769.949  , -407 , -478.991 , 125},
            [3] = {-1089.787 , -647 , -718.976 , 125},
        };
        
        SpawnMob(zeidId);
        local volker = player:getBattlefield():insertAlly(14182)
        player:setPos(unpack(playerCoords[bfid]));
        volker:setSpawn(unpack(volkerCoords[bfid]));
        volker:spawn();
    end
end;
