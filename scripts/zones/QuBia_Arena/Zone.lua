-----------------------------------
--
-- Zone: Qu'Bia Arena (206)
--
-----------------------------------
package.loaded["scripts/zones/QuBia_Arena/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/QuBia_Arena/TextIDs");

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
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 32004) then
        local battlefield = player:getBattlefield();
        if battlefield then
            local area = battlefield:getBattlefieldNumber();
            local tabre =
            {
                [1] = { mobids = {17621014, 17621015, 17621016}, trionPos = {-403, -201, 413, 58}, playerPos = {-400, -201, 419, 61} },
                [2] = { mobids = {17621028, 17621029, 17621030}, trionPos = {-3, -1, 4, 61}, playerPos = {0, -1, 10, 61} },
                [3] = { mobids = {17621042, 17621043, 17621044}, trionPos = {397, 198, -395, 64}, playerPos = {399, 198, -381, 57} }
            }
            for _, mobid in pairs(tabre[area].mobids) do
                SpawnMob(mobid)
            end

            local trion = battlefield:insertAlly(14183);
            trion:setSpawn(tabre[area].trionPos);
            trion:spawn();
            player:setPos(tabre[area].playerPos);
        end
    end
end;
