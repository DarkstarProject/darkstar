-----------------------------------
-- 
-- Zone: Apollyon (38)
-- 
-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/limbus");
require("scripts/zones/Apollyon/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
    SetServerVariable("[NW_Apollyon]UniqueID",0);
    SetServerVariable("[SW_Apollyon]UniqueID",0);
    SetServerVariable("[NE_Apollyon]UniqueID",0);
    SetServerVariable("[SE_Apollyon]UniqueID",0);
    SetServerVariable("[CS_Apollyon]UniqueID",0);
    SetServerVariable("[CS_Apollyon_II]UniqueID",0);
    SetServerVariable("[Central_Apollyon]UniqueID",0);
    SetServerVariable("[Central_Apollyon_II]UniqueID",0);

    zone:registerRegion( 1,  637, -4, -642,  642, 4, -637); -- APOLLYON_SE_NE exit
    zone:registerRegion( 2, -642, -4, -642, -637, 4, -637); -- APOLLYON_NW_SW exit

    zone:registerRegion(20,  396, -4, -522,  403, 4, -516); -- Apollyon SE telporter floor1 to floor2
    zone:registerRegion(21,  116, -4, -443,  123, 4, -436); -- Apollyon SE telporter floor2 to floor3
    zone:registerRegion(22,  276, -4, -283,  283, 4, -276); -- Apollyon SE telporter floor3 to floor4
    zone:registerRegion(23,  517, -4, -323,  523, 4, -316); -- Apollyon SE telporter floor4 to entrance

    zone:registerRegion(24,  396, -4,   76,  403, 4,   83); -- Apollyon NE telporter floor1 to floor2
    zone:registerRegion(25,  276, -4,  356,  283, 4,  363); -- Apollyon NE telporter floor2 to floor3
    zone:registerRegion(26,  236, -4,  517,  243, 4,  523); -- Apollyon NE telporter floor3 to floor4
    zone:registerRegion(27,  517, -4,  637,  523, 4,  643); -- Apollyon NE telporter floor4 to floor5
    zone:registerRegion(28,  557, -4,  356,  563, 4,  363); -- Apollyon NE telporter floor5 to entrance

    zone:registerRegion(29, -403, -4, -523, -396, 4, -516); -- Apollyon SW telporter floor1 to floor2   
    zone:registerRegion(30, -123, -4, -443, -116, 4, -436); -- Apollyon SW telporter floor2 to floor3  
    zone:registerRegion(31, -283, -4, -283, -276, 4, -276); -- Apollyon SW telporter floor3 to floor4 
    zone:registerRegion(32, -523, -4, -323, -517, 4, -316); -- Apollyon SW telporter floor4 to entrance 

    zone:registerRegion(33, -403, -4,   76, -396, 4,   83); -- Apollyon NW telporter floor1 to floor2 
    zone:registerRegion(34, -283, -4,  356, -276, 4,  363); -- Apollyon NW telporter floor2 to floor3 
    zone:registerRegion(35, -243, -4,  516, -236, 4,  523); -- Apollyon NW telporter floor3 to floor4 
    zone:registerRegion(36, -523, -4,  636, -516, 4,  643); -- Apollyon NW telporter floor4 to floor5 
    zone:registerRegion(37, -563, -4,  356, -556, 4,  363); -- Apollyon NW telporter floor5 to entrance 
                                                                
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
    
    -- player is returning from disconnect, so add them to matching run in progress
    if (inst > 0 and not player:isBattlefieldFree(inst)) then
        player:addPlayerToBattlefield(inst);
        local x, y, z = getBattlefieldEntrance(player, inst);
        printf("%s reconnected to battlefield. Moving to x=%f y=%f z=%f",player:getName(),x,y,z);
        player:setPos(x,y,z);
        cs = -1;
    
    -- GM can goto players in battlefield, and should not be set to entrance
    elseif (player:getGMLevel() > 0) then
        if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
            player:setPos(643,0.1,-600);
        end

    -- everyone else should be put at the entrance        
    else
        player:setPos(643,0.1,-600);
        
    end
    
    return cs;
end;

-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,region)
  local regionID = region:GetRegionID();
   switch (regionID): caseof {
        [1] = function (x) 
             player:startEvent(100); -- APOLLYON_SE_NE exit
        end,
        [2] = function (x) 
             player:startEvent(101); -- APOLLYON_NW_SW exit
            -- print("APOLLYON_NW_SW");
        end,
        
        -- ///////////////////////APOLLYON SE TELEPORTER///////////////////////////////////////////
        [20] = function (x) 
             -- print("SE_telporter_f1_to_f2");
             if (GetMobByID(16932992):isDead() and player:getAnimation()==0) then player:startEvent(219);end
        end,
        [21] = function (x) 
             -- print("SE_telporter_f2_to_f3");
              if (GetMobByID(16933006):isDead() and player:getAnimation()==0) then player:startEvent(218);end
        end,    
        [22] = function (x) 
            --  print("SE_telporter_f3_to_f4");
              if (GetMobByID(16933020):isDead() and player:getAnimation()==0) then player:startEvent(216);end
         end,       
        [23] = function (x) 
             -- print("SE_telporter_f3_to_entrance");
              if (GetMobByID(16933032):isDead() and player:getAnimation()==0) then player:startEvent(217);end
         end,
         -- ///////////////////////////////////////////////////////////////////////////////////////////      
         -- /////////////////////    APOLLYON NE TELEPORTER           ////////////////////////////////
        [24] = function (x) 
             -- print("NE_telporter_f1_to_f2");
              if (GetMobByID(16933044):isDead() and player:getAnimation()==0) then player:startEvent(214);end 
         end,
         [25] = function (x) 
             -- print("NE_telporter_f2_to_f3");
              if (GetMobByID(16933064):isDead() and player:getAnimation()==0) then player:startEvent(212);end  --212
         end,
         [26] = function (x) 
            --  print("NE_telporter_f3_to_f4");
              if (GetMobByID(16933086):isDead() and player:getAnimation()==0) then player:startEvent(210);end  --210
         end,
         [27] = function (x) 
            --  print("NE_telporter_f4_to_f5");
              if (GetMobByID(16933101):isDead() and player:getAnimation()==0) then player:startEvent(215);end    --215
         end,
         [28] = function (x) 
            --  print("NE_telporter_f5_to_entrance");
              if ( (GetMobByID(16933114):isDead() or GetMobByID(16933113):isDead()) and player:getAnimation()==0) then player:startEvent(213);end --213
         end,
         -- //////////////////////////////////////////////////////////////////////////////////////////////////
         -- /////////////////////    APOLLYON SW TELEPORTER           //////////////////////////////// 
         [29] = function (x) 
              if (GetMobByID(16932873):isDead() and player:getAnimation()==0) then player:startEvent(208);end --208
         end,
         [30] = function (x) 
              if (GetMobByID(16932885):isDead() and player:getAnimation()==0) then player:startEvent(209);end --209
              --printf("Mimics should be 0: %u",GetServerVariable("[SW_Apollyon]MimicTrigger"));
         end,
         [31] = function (x)        
              if (( GetMobByID(16932896):isDead() or GetMobByID(16932897):isDead() or GetMobByID(16932898):isDead() or  GetMobByID(16932899):isDead() )and player:getAnimation()==0) then player:startEvent(207);end -- 207
         end,
         [32] = function (x) 
              if (IselementalDayAreDead()==true and player:getAnimation()==0) then player:startEvent(206);end -- 206
         end,        
             -- //////////////////////////////////////////////////////////////////////////////////////////////////
         -- /////////////////////    APOLLYON NW TELEPORTER           //////////////////////////////// 
         [33] = function (x) 
              if (GetMobByID(16932937):isDead() and player:getAnimation()==0) then player:startEvent(205);end --205
         end,
         [34] = function (x) 
              if (GetMobByID(16932950):isDead() and player:getAnimation()==0) then player:startEvent(203);end --203
         end,
         [35] = function (x) 
              if (GetMobByID(16932963):isDead() and player:getAnimation()==0) then player:startEvent(201);end --201
         end,
         [36] = function (x) 
              if (GetMobByID(16932976):isDead() and player:getAnimation()==0) then player:startEvent(200);end --200
         end,
         [37] = function (x) 
              if (GetMobByID(16932985):isDead() and player:getAnimation()==0) then player:startEvent(202);end --202
         end,
    }
    
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
    if (csid == 209 and option == 0 and GetServerVariable("[SW_Apollyon]MimicTrigger")==0) then
        SpawnCofferSWfloor3();
        --printf("Mimics should be 1: %u",GetServerVariable("[SW_Apollyon]MimicTrigger"));
    elseif (csid == 207 and option == 0 and GetServerVariable("[SW_Apollyon]ElementalTrigger")==0) then 
        SetServerVariable("[SW_Apollyon]ElementalTrigger",VanadielDayElement()+1);
        -- printf("Elementals should be 1: %u",GetServerVariable("[SW_Apollyon]ElementalTrigger"));
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 100 and option == 1) then
        player:setPos(557,-1,441,128,0x21);  -- APOLLYON_SE_NE exit
    elseif (csid == 101 and option == 1) then
        player:setPos(-561,0,443,242,0x21); -- APOLLYON_NW_SW exit
    end
end;



