-----------------------------------
-- Zone: Apollyon
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")
require("scripts/globals/conquest")
require("scripts/globals/zone")

function onInitialize(zone)
    zone:registerRegion(1,  637,-4,-642,642,4,-637)  -- APOLLYON_SE_NE exit
    zone:registerRegion(2, -642,-4,-642,-637,4,-637)  -- APOLLYON_NW_SW exit

    zone:registerRegion(20,   396,-4,-522,   403,4,-516) -- appolyon SE telporter floor1 to floor2
    zone:registerRegion(21,   116,-4,-443,   123,4,-436) -- appolyon SE telporter floor2 to floor3
    zone:registerRegion(22,   276,-4,-283,   283,4,-276) -- appolyon SE telporter floor3 to floor4
    --zone:registerRegion(23,   517,-4,-323,   523,4,-316); -- appolyon SE telporter floor4 to entrance

    zone:registerRegion(24,   396,-4,76,   403,4,83) -- appolyon NE telporter floor1 to floor2
    zone:registerRegion(25,   276,-4,356,   283,4,363) -- appolyon NE telporter floor2 to floor3
    zone:registerRegion(26,   236,-4,517,   243,4,523) -- appolyon NE telporter floor3 to floor4
    zone:registerRegion(27,   517,-4,637,   523,4,643) -- appolyon NE telporter floor4 to floor5
    --zone:registerRegion(28,   557,-4,356,   563,4,363); -- appolyon NE telporter floor5 to entrance

    zone:registerRegion(29, -403,-4,-523,  -396,4,-516) -- appolyon SW telporter floor1 to floor2
    zone:registerRegion(30, -123,-4,-443,  -116,4,-436) -- appolyon SW telporter floor2 to floor3
    zone:registerRegion(31, -283,-4,-283,  -276,4,-276) -- appolyon SW telporter floor3 to floor4
    --zone:registerRegion(32, -523,-4,-323,  -517,4,-316); -- appolyon SW telporter floor4 to entrance

    zone:registerRegion(33, -403,-4,76,   -396,4,83) -- appolyon NW telporter floor1 to floor2
    zone:registerRegion(34, -283,-4,356,  -276,4,363) -- appolyon NW telporter floor2 to floor3
    zone:registerRegion(35, -243,-4,516,  -236,4,523) -- appolyon NW telporter floor3 to floor4
    zone:registerRegion(36, -523,-4,636,  -516,4,643) -- appolyon NW telporter floor4 to floor5
    --zone:registerRegion(37, -563,-4,356,  -556,4,363); -- appolyon NW telporter floor5 to entrance
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn(player, prevZone)
    cs = -1
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(643, 0.1, -600)
    end
    return cs
end

function onRegionEnter(player,region)
    local regionID = region:GetRegionID()
    local battlefield = player:getBattlefield()
    switch (regionID): caseof
    {
        [1] = function ()
            player:startEvent(100) -- APOLLYON_SE_NE exit
        end,
        [2] = function ()
            player:startEvent(101) -- APOLLYON_NW_SW exit
        end,

    -- APOLLYON SE TELEPORTER
        [20] = function()
            if GetMobByID(ID.mob.APOLLYON_SE_MOB[1]):isDead() and player:getAnimation() == 0 then player:startEvent(219) end
        end,
        [21] = function()
            if GetMobByID(ID.mob.APOLLYON_SE_MOB[2]):isDead() and player:getAnimation() == 0 then player:startEvent(218) end
        end,
        [22] = function()
            if GetMobByID(ID.mob.APOLLYON_SE_MOB[3]):isDead() and player:getAnimation() == 0 then player:startEvent(216) end
        end,
        --[23] = function (x)
             -- print("SE_telporter_f3_to_entrance");
        --      if (GetMobByID(16933032):isDead() and player:getAnimation()==0) then player:startEvent(217);end
        -- end,
    -- APOLLYON NE TELEPORTER
        [24] = function()
            if battlefield:getLocalVar("portalF1") == 1 and player:getAnimation() == 0 then player:startEvent(214) end
        end,
        [25] = function()
            if battlefield:getLocalVar("portalF2") == 1 and player:getAnimation() == 0 then player:startEvent(212) end  --212
        end,
        [26] = function()
            if battlefield:getLocalVar("portalF3") == 1 and player:getAnimation() == 0 then player:startEvent(210) end  --210
        end,
        [27] = function()
            if battlefield:getLocalVar("portalF4") == 1 and player:getAnimation() == 0 then player:startEvent(215) end    --215
        end,
        -- [28] = function (x)
            --  print("NE_telporter_f5_to_entrance");
        --      if ( (GetMobByID(16933114):isDead() or GetMobByID(16933113):isDead()) and player:getAnimation()==0) then player:startEvent(213);end --213
        -- end,
    -- APOLLYON SW TELEPORTER
        [29] = function()
            if battlefield:getLocalVar("portalF1") == 1 and player:getAnimation() == 0 then player:startEvent(208) end --208
        end,
        [30] = function()
            if GetMobByID(ID.mob.APOLLYON_SW_MOB[2]):isDead() and player:getAnimation() == 0 then player:startEvent(209) end --209
        end,
        [31] = function()
            if battlefield:getLocalVar("mimicKilled") == 1 and player:getAnimation() == 0 then player:startEvent(207) end -- 207
        end,
        -- [32] = function (x)
        --      if (IselementalDayAreDead()==true and player:getAnimation()==0) then player:startEvent(206);end -- 206
        -- end,
    -- APOLLYON NW TELEPORTER
        [33] = function()
            if battlefield:getLocalVar("portalF1") == 1 and player:getAnimation() == 0 then player:startEvent(205) end --205
        end,
        [34] = function()
            if battlefield:getLocalVar("portalF2") == 1 and player:getAnimation() == 0 then player:startEvent(203) end --203
        end,
        [35] = function()
            if battlefield:getLocalVar("portalF3") == 1 and player:getAnimation() == 0 then player:startEvent(201) end --201
        end,
        [36] = function()
            if battlefield:getLocalVar("portalF4") == 1 and player:getAnimation() == 0 then player:startEvent(200) end --200
        end,
        -- [37] = function (x)
        --      if (GetMobByID(16932985):isDead() and player:getAnimation()==0) then player:startEvent(202);end --202
        -- end,
    }
end

function onRegionLeave(player, region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 100 and option == 1 then
        player:setPos(557, -1, 441, 128, 33)  -- APOLLYON_SE_NE exit
    elseif csid == 101 and option == 1 then
        player:setPos(-561, 0, 443, 242, 33) -- APOLLYON_NW_SW exit
    end
    if (csid == 32001 or csid == 32002) and player:getCharVar("ApollyonEntrance") == 1 then
        player:setPos(638.099, 0.000, -610.997) -- East
        player:setCharVar("ApollyonEntrance", 0)
    elseif (csid == 32001 or csid == 32002) and player:getCharVar("ApollyonEntrance") == 0 then
        player:setPos(-646.000, 0.000, -616.000) -- West
    end
end
