-----------------------------------
--
-- Zone: Temenos (37)
--
-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    SetServerVariable("[Temenos_W_Tower]UniqueID",0);
    SetServerVariable("[Temenos_N_Tower]UniqueID",0);
    SetServerVariable("[Temenos_E_Tower]UniqueID",0);
    SetServerVariable("[C_Temenos_Base]UniqueID",0);
    SetServerVariable("[C_Temenos_Base_II]UniqueID",0);
    SetServerVariable("[C_Temenos_1st]UniqueID",0);
    SetServerVariable("[C_Temenos_2nd]UniqueID",0);
    SetServerVariable("[C_Temenos_3rd]UniqueID",0);
    SetServerVariable("[C_Temenos_4th]UniqueID",0);
    SetServerVariable("[C_Temenos_4th_II]UniqueID",0);
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = 0;

    player:delStatusEffect(EFFECT_LIMBUS);
    local inst = belongsInBattlefield(player);
    local zone = player:getZone()

    -- player is returning from disconnect, so add them to matching run in progress
    if (inst > 0 and not zone:battlefieldsFull(inst)) then
        if player:enterBattlefield(inst) then
            local x, y, z = getBattlefieldEntrance(player, inst);
            printf("%s reconnected to battlefield. Moving to x=%f y=%f z=%f",player:getName(),x,y,z);
            player:setPos(x,y,z);
            cs = -1;
        end

    -- GM can goto players in battlefield, and should not be set to entrance
    elseif (player:getGMLevel() > 0) then
        if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
            player:setPos(580,-1.5,4.452,192);
        end

    -- everyone else should be put at the entrance
    else
        player:setPos(580,-1.5,4.452,192);

    end

    return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onRegionLeave
-----------------------------------

function onRegionLeave(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;