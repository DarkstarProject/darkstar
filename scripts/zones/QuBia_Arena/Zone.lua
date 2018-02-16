-----------------------------------
--
-- Zone: Qu'Bia Arena (206)
--
-----------------------------------
package.loaded["scripts/zones/QuBia_Arena/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/QuBia_Arena/TextIDs");
require("scripts/zones/QuBia_Arena/MobIDs");
require("scripts/globals/conquest");

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-241.046,-25.86,19.991,0);
    end
    return cs;
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();
    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 32004) then
        local battlefield = player:getBattlefield();
        if (battlefield) then
            local inst = battlefield:getBattlefieldNumber();
            local instOffset = HEIR_TO_THE_LIGHT_OFFSET + (14 * (inst-1));
            local allyPos =
            {
                [1] = { trionPos = {-403, -201,  413, 58}, playerPos = {-400, -201,  419, 61} },
                [2] = { trionPos = {  -3,   -1,    4, 61}, playerPos = {   0,   -1,   10, 61} },
                [3] = { trionPos = { 397,  198, -395, 64}, playerPos = { 399,  198, -381, 57} },
            }
            
            -- spawn Warlord Rojnoj and its right and left hands.
            for i = instOffset + 0, instOffset + 2 do
                SpawnMob(i);
            end

            -- spawn trion and set ally positions
            local allies = battlefield:getAllies();
            if (#allies == 0) then
                local trion = battlefield:insertAlly(14183);
                trion:setSpawn(allyPos[inst].trionPos);
                trion:spawn();
            end
            player:setPos(allyPos[inst].playerPos);
        end
    end
end;
