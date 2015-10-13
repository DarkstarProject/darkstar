-----------------------------------
--
-- Zone: The_Garden_of_RuHmet (35)
--
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/The_Garden_of_RuHmet/TextIDs");
require("scripts/zones/The_Garden_of_RuHmet/MobIDs");
require("scripts/globals/missions");
require("scripts/globals/keyitems");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1, -421, -2, 377,  -417, 0, 381); -- RDC
    zone:registerRegion(2, -422, -2, -422,  -418, 0, -418); -- +1
    zone:registerRegion(3, 418, -2, 378,  422, 0, 382); -- +2
    
    zone:registerRegion(4,  -506,-4,697,  -500,4,703);--hume niv 0  150   vers niv 1
    zone:registerRegion(5,  -507,-4,-103,  -501,4,-97);--hume niv 1  158   vers niv 0
    zone:registerRegion(6,  -339,-4,-103,  -332,4,-97);--hume niv 1  159   vers niv 2
    zone:registerRegion(7,  501,-4,697,  507,4,702);--hume niv 2  169   vers niv 1                
    zone:registerRegion(8,  332,-4,696,  339,4,702);--hume niv 2  168   vers niv 3
    zone:registerRegion(9,  332,-4,-102,  338,4,-97);--hume niv 3  178   vers niv 2        
        
    zone:registerRegion(10,  -102,-4,541,  -96,4,546);--elvaan niv 0 151 vers niv 1
    zone:registerRegion(11,  -103,-4,-259,  -96,4,-252);--elvaan niv 1 160 vers niv 0
    zone:registerRegion(12,  -103,-4,-427,  -67,4,-420);--elvaan niv 1 161 vers niv 2    
    zone:registerRegion(13,  736,-4,372,  742,4,379);--elvaan niv 2 171 vers niv 1        
    zone:registerRegion(14,  736,-4,540,  743,4,546);--elvaan niv 2 170 vers niv 3
    zone:registerRegion(15,  737,-4,-259,  743,4,-252);--elvaan niv 3 179 vers niv 2    
        
    zone:registerRegion(16,  -178,-4,97,  -173,4,103);--galka niv 0 152 vers niv 1
    zone:registerRegion(17,  -178,-4,-703,  -173,4,-697);--galka niv 1 162 vers niv 0
    zone:registerRegion(18,  -347,-4,-703,  -340,4,-696);--galka niv 1 163 vers niv 2    
    zone:registerRegion(19,  492,-4,96,  499,4,103);--galka niv 2 173 vers niv 1            
    zone:registerRegion(20,  660,-4,96,  667,4,102);--galka niv 2 172 vers niv 3
    zone:registerRegion(21,  660,-4,-702,  667,4,-697);--galka niv 3 180 vers niv 2                    
        
    zone:registerRegion(22,  -498,-4,97,  -492,4,102);--taru niv 0 153 vers niv 1
    zone:registerRegion(23,  -499,-4,-703,  -492,4,-697);--taru niv 1 164 vers niv 0
    zone:registerRegion(24,  -667,-4,-703,  -661,4,-696);--taru niv 1 165 vers niv 2
    zone:registerRegion(25,  172,-4,96,  178,4,102);--taru niv 2 175 vers niv 1    
    zone:registerRegion(26,  340,-4,97,  347,4,102);--taru niv 2 174 vers niv 3
    zone:registerRegion(27,  340,-4,-703,  347,4,-697);--taru niv 3 181 vers niv 2                            
        
    zone:registerRegion(28,  -742,-4,373,  -736,4,379);--mithra niv 0 154 vers niv 1
    zone:registerRegion(29,  -743,-4,-427,  -736,4,-421);--mithra niv 1 166 vers niv 0    
    zone:registerRegion(30,  -742,-4,-259,  -737,4,-252);--mithra niv 1 167 vers niv 2
    zone:registerRegion(31,  97,-4,541,  102,4,547);--mithra niv 2 177 vers niv 1    
    zone:registerRegion(32,  97,-4,372,  102,4,379);--mithra niv 2 176 vers niv 3
    zone:registerRegion(33,  97,-4,-427, 102,4,-421);--mithra niv 3 182 vers niv 2    
    
    -- Give the Fortitude ??? a random spawn
    local qm1 = GetNPCByID(Jailer_of_Fortitude_QM);
    local qm1position = math.random(1,5);
    qm1:setPos(Jailer_of_Fortitude_QM_POS[qm1position][1], Jailer_of_Fortitude_QM_POS[qm1position][2], Jailer_of_Fortitude_QM_POS[qm1position][3]);
    
    --Give the Faith ??? a random spawn 
    local qm3 = GetNPCByID(Jailer_of_Faith_QM);
    local qm3position = math.random(1,5);
    qm3:setPos(Jailer_of_Faith_QM_POS[qm3position][1], Jailer_of_Faith_QM_POS[qm3position][2], Jailer_of_Faith_QM_POS[qm3position][3]);

    -- Give Ix'DRG a random placeholder by picking one of the four groups at random, then adding a random number of 0-2 for the specific mob.
    SetServerVariable("[SEA]IxAernDRG_PH", AwAernDRGGroups[math.random(1, #AwAernDRGGroups)] + math.random(0, 2));
end;

-----------------------------------
-- afterZoneIn
-----------------------------------

function afterZoneIn(player)
    player:entityVisualPacket("door");
    player:entityVisualPacket("lst1");
    player:entityVisualPacket("lst2");
    player:entityVisualPacket("lst3");
    player:entityVisualPacket("lop1");
    player:entityVisualPacket("lop2");
    player:entityVisualPacket("lop3");
    player:entityVisualPacket("lpmy");
    player:entityVisualPacket("clop");
    player:entityVisualPacket("slp1");
    player:entityVisualPacket("slp2");
    player:entityVisualPacket("slp3");
end;

-----------------------------------        
-- onGameHour        
-----------------------------------          

function onGameHour(npc, mob, player)
    
    local VanadielHour = VanadielHour();
    local qm2 = GetNPCByID(16921028); -- Jailer of Faith
    local qm3 = GetNPCByID(16921029); -- Ix'aern drk
    local s = math.random(6,12) -- wait time till change to next spawn pos, random 15~30 mins.
    
    -- Jailer of Fortitude spawn randomiser
    if (VanadielHour % 6 == 0) then
        local qm1 = GetNPCByID(Jailer_of_Fortitude_QM);
        qm1:hideNPC(60);
        
        local qm1position = math.random(1,5);
        qm1:setPos(Jailer_of_Fortitude_QM_POS[qm1position][1], Jailer_of_Fortitude_QM_POS[qm1position][2], Jailer_of_Fortitude_QM_POS[qm1position][3]);
    end
    
    -- Jailer of Faith spawn randomiser
    if (VanadielHour % s == 0) then
        -- Get the ??? NPC 
        local qm3 = GetNPCByID(Jailer_of_Faith_QM);
        -- Hide it for 60 seconds
        qm3:hideNPC(60);
        
        -- Get a new random position from the possible places
        local qm3position = math.random(1,5);
        -- Set the new ??? place
        qm3:setPos(Jailer_of_Faith_QM_POS[qm3position][1], Jailer_of_Faith_QM_POS[qm3position][2], Jailer_of_Faith_QM_POS[qm3position][3]);
    end
    
    --[[
    -- Ix'DRK spawn randomiser
    if (VanadielHour % 6 == 0) then -- Change ??? position every 6 hours Vana'diel time (~15 mins)
        local qm2p = math.random(1,4); -- random for next @pos. -- start in spawn pos 1.
            --print(qm2p) 
            qm3:hideNPC(30);
                if (qm2p == 1) then
                    qm2:setPos(-240,5.00,440); -- spawn point 1 "Hume-Elvaan"
                    SetServerVariable("[POSI]Ix_aern_drk",1);
                    --printf("Qm2 is at pos 1");
                elseif (qm2p == 2) then
                    qm2:setPos(-280,5.00,240); -- spawn point 2 "Elvaan-Galka"
                    SetServerVariable("[POSI]Ix_aern_drk",2);
                    --printf("Qm2 is at pos 2");
                elseif (qm2p == 3) then
                    qm2:setPos(-560,5.00,239); -- spawn point 3 "Taru-Mithra"
                    SetServerVariable("[POSI]Ix_aern_drk",3);
                    --printf("Qm2 is at pos 3");
                elseif (qm2p == 4) then
                    qm2:setPos(-600,5.00,440); -- spawn point 4 "Mithra-Hume"
                    SetServerVariable("[POSI]Ix_aern_drk",4);
                    --printf("Qm2 is at pos 4");               
                end
    end    ]]--
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
    local cs = -1;    
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then    
        player:setPos(-351.136,-2.25,-380,253);
    end    
    if (player:getCurrentMission(COP) == WHEN_ANGELS_FALL and player:getVar("PromathiaStatus")==0) then
        cs = 0x00C9 ;
    end
    player:setVar("Ru-Hmet-TP",0);
    return cs;    
end;        

-----------------------------------        
-- onRegionEnter        
-----------------------------------        

function onRegionEnter(player,region)    
 if (player:getVar("Ru-Hmet-TP")==0 and player:getAnimation()==0) then    
    switch (region:GetRegionID()): caseof
    {
        [1] = function (x) 
           if (player:getCurrentMission(COP)==DAWN or player:hasCompletedMission(COP,DAWN) or player:hasCompletedMission(COP,THE_LAST_VERSE) ) then
               player:startEvent(0x0065);  
            else
               player:startEvent(0x009B); 
            end
        end, --101         
        
        [2] = function (x) 
            if (player:hasKeyItem(BRAND_OF_DAWN) and player:hasKeyItem(BRAND_OF_TWILIGHT)) then
            player:startEvent(0x009C);
            else
            player:startEvent(0x00B7);
            end
        end, --102      
        
        
        
        [3] = function (x) 
        player:startEvent(0x0067);  
        end, --103        
        
        
        
        
        
        [4] = function (x) player:startEvent(0x0096);end,--hume niv 0  150 vers niv 1
        [5] = function (x) player:startEvent(0x009E);end,--hume niv 1  158 vers niv 0
        [6] = function (x) player:startEvent(0x009F);end,--hume niv 1  159 vers niv 2
        [7] = function (x) player:startEvent(0x00A9);end,--hume niv 2  169 vers niv 1                
        [8] = function (x) player:startEvent(0x00A8);end,--hume niv 2  168 vers niv 3
        [9] = function (x) player:startEvent(0x00B2);end,--hume niv 3  178 vers niv 2        
        
        [10] = function (x) player:startEvent(0x0097);end,--elvaan niv 0 151 vers niv 1
        [11] = function (x) player:startEvent(0x00A0);end,--elvaan niv 1 160 vers niv 0
        [12] = function (x) player:startEvent(0x00A1);end,--elvaan niv 1 161 vers niv 2    
        [13] = function (x) player:startEvent(0x00AB);end,--elvaan niv 2 171 vers niv 1        
        [14] = function (x) player:startEvent(0x00AA);end,--elvaan niv 2 170 vers niv 3
        [15] = function (x) player:startEvent(0x00B3);end,--elvaan niv 3 179 vers niv 2    
        
        [16] = function (x) player:startEvent(0x0098);end,--galka niv 0 152 vers niv 1
        [17] = function (x) player:startEvent(0x00A2);end,--galka niv 1 162 vers niv 0
        [18] = function (x) player:startEvent(0x00A3);end,--galka niv 1 163 vers niv 2    
        [19] = function (x) player:startEvent(0x00AD);end,--galka niv 2 173 vers niv 1            
        [20] = function (x) player:startEvent(0x00AC);end,--galka niv 2 172 vers niv 3
        [21] = function (x) player:startEvent(0x00B4);end,--galka niv 3 180 vers niv 2                    
        
        [22] = function (x) player:startEvent(0x0099);end,--taru niv 0 153 vers niv 1
        [23] = function (x) player:startEvent(0x00A4);end,--taru niv 1 164 vers niv 0
        [24] = function (x) player:startEvent(0x00A5);end,--taru niv 1 165 vers niv 2
        [25] = function (x) player:startEvent(0x00AF);end,--taru niv 2 175 vers niv 1    
        [26] = function (x) player:startEvent(0x00AE);end,--taru niv 2 174 vers niv 3
        [27] = function (x) player:startEvent(0x00B5);end,--taru niv 3 181 vers niv 2                            
        
        [28] = function (x) player:startEvent(0x009A);end,--mithra niv 0 154 vers niv 1
        [29] = function (x) player:startEvent(0x00A6);end,--mithra niv 1 166 vers niv 0    
        [30] = function (x) player:startEvent(0x00A7);end,--mithra niv 1 167 vers niv 2
        [31] = function (x) player:startEvent(0x00B1);end,--mithra niv 2 177 vers niv 1    
        [32] = function (x) player:startEvent(0x00B0);end,--mithra niv 2 176 vers niv 3
        [33] = function (x) player:startEvent(0x00B6);end,--mithra niv 3 182 vers niv 2    
    }
 end
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if ((csid >0x0095 and csid < 0x00B8)or  csid ==0x0066 or  csid ==0x0067 or csid ==0x0065) then
        player:setVar("Ru-Hmet-TP",1);
    
    end
end;    

-----------------------------------    
-- onEventFinish    
-----------------------------------    

function onEventFinish(player,csid,option)    
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    
    if (csid == 0x0065 and option == 1) then
        player:setPos(540,-1,-499.900,62,0x24);
        player:setVar("Ru-Hmet-TP",0);
    elseif ((csid >0x0095 and csid < 0x00B8)or  csid ==0x0066 or  csid ==0x0067 or csid == 0x0065 ) then
        player:setVar("Ru-Hmet-TP",0);
    elseif (csid ==0x00C9) then
      player:setVar("PromathiaStatus",1);    
    end
        if (csid == 0x7d00 and option==1) then
                     player:setPos(420,0,398,68);
    end
end;