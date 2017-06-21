require("scripts/globals/settings");

local homepoints = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,
        26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,
        51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,
        76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,
        101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121};

--paramNum bit x y z rotation zone cost
homepoints[0]   = { 1,  1, -85.554,      1, -64.554,  45, 230,  500}; -- Southern San d'Oria #1
homepoints[1]   = { 1,  2,    44.1,      2,   -34.5, 170, 230,  500}; -- Southern San d'Oria #2
homepoints[2]   = { 1,  3,   140.5,     -2,     121,   0, 230,  500}; -- Southern San d'Oria #3
homepoints[3]   = { 1,  4,    -178,      4,      71,   0, 231,  500}; -- Northern San d'Oria #1
homepoints[4]   = { 1,  5,      10,   -0.2,      95,   0, 231,  500}; -- Northern San d'Oria #2
homepoints[5]   = { 1,  6,      70,   -0.2,      10,   0, 231,  500}; -- Northern San d'Oria #3
homepoints[6]   = { 1,  7,     -38,     -4,     -63,   0, 232,  500}; -- Port San d'Oria #1    
homepoints[7]   = { 1,  8,      48,    -12,    -105,   0, 232,  500}; -- Port San d'Oria #2    
homepoints[8]   = { 1,  9,      -6,    -13,    -150,   0, 232,  500}; -- Port San d'Oria #3    
homepoints[9]   = { 1, 10,      39,      0,     -43,   0, 234,  500}; -- Bastok Mines #1       
homepoints[10]  = { 1, 11,     118,      1,     -58,   0, 234,  500}; -- Bastok Mines #2       
homepoints[11]  = { 1, 12,    -293,    -10,    -102,   0, 235,  500}; -- Bastok Markets #1     
homepoints[12]  = { 1, 13,    -328,    -12,     -33,   0, 235,  500}; -- Bastok Markets #2     
homepoints[13]  = { 1, 14,    -189,     -8,      26,   0, 235,  500}; -- Bastok Markets #3     
homepoints[14]  = { 1, 15,   58.85,  7.499, -27.790,   0, 236,  500}; -- Port Bastok #1        
homepoints[15]  = { 1, 16,      42,    8.5,    -244,   0, 236,  500}; -- Port Bastok #2        
homepoints[16]  = { 1, 17,      46,    -14,     -19,   0, 237,  500}; -- Metalworks #1         
homepoints[17]  = { 1, 18,     -32,     -5,     132,   0, 238,  500}; -- Windurst Waters #1    
homepoints[18]  = { 1, 19,   138.5,      0,     -14,   0, 238,  500}; -- Windurst Waters #2    
homepoints[19]  = { 1, 20,     -72,     -5,     125,   0, 239,  500}; -- Windurst Walls #1     
homepoints[20]  = { 1, 21,    -212,      0,     -99,   0, 239,  500}; -- Windurst Walls #2     
homepoints[21]  = { 1, 22,      31,   -6.5,     -40,   0, 239,  500}; -- Windurst Walls #3     
homepoints[22]  = { 1, 23,    -188,     -4,     101,   0, 240,  500}; -- Port Windurst #1      
homepoints[23]  = { 1, 24,    -207,     -8,     210,   0, 240,  500}; -- Port Windurst #2      
homepoints[24]  = { 1, 25,     180,    -12,     226,   0, 240,  500}; -- Port Windurst #3      
homepoints[25]  = { 1, 26,       9,     -2,       0,   0, 241,  500}; -- Windurst Woods #1     
homepoints[26]  = { 1, 27,     107,     -5,     -56,   0, 241,  500}; -- Windurst Woods #2     
homepoints[27]  = { 1, 28,     -92,     -5,      62,   0, 241,  500}; -- Windurst Woods #3     
homepoints[28]  = { 1, 29,      74,     -7,    -139,   0, 241,  500}; -- Windurst Woods #4     
homepoints[29]  = { 1, 30,      -6,      3,       0,   0, 243,  500}; -- Ru'Lude Gardens #1    
homepoints[30]  = { 1, 31,      53,      9,     -57,   0, 243,  500}; -- Ru'Lude Gardens #2    
homepoints[31]  = { 1, 32,     -67,      6,     -25,   1, 243,  500}; -- Ru'Lude Gardens #3    
homepoints[32]  = { 2,  1,     -99,      0,     167,   0, 244,  500}; -- Upper Jeuno #1          
homepoints[33]  = { 2,  2,      32,     -1,     -44,   0, 244,  500}; -- Upper Jeuno #2          
homepoints[34]  = { 2,  3,     -52,      1,      16,   0, 244,  500}; -- Upper Jeuno #3          
homepoints[35]  = { 2,  4,     -99,      0,    -183,   0, 245,  500}; -- Lower Jeuno #1          
homepoints[36]  = { 2,  5,      18,     -1,      54,   0, 245,  500}; -- Lower Jeuno #2          
homepoints[37]  = { 2,  6,      37,      0,       9,   0, 246,  500}; -- Port Jeuno #1           
homepoints[38]  = { 2,  7,    -155,     -1,      -4,   0, 246,  500}; -- Port Jeuno #2           
homepoints[39]  = { 2,  8,      78,    -13,     -94,   0, 250,  500}; -- Kazham #1               
homepoints[40]  = { 2,  9,     -13,    -15,      87,   0, 249,  500}; -- Mhaura #1               
homepoints[41]  = { 2, 10,     -27,      0,     -47,   0, 252,  500}; -- Norg #1                 
homepoints[42]  = { 2, 11,     -29,      0,     -76,   0, 247,  500}; -- Rabao #1                
homepoints[43]  = { 2, 12,      36,    -11,      35,   0, 248,  500}; -- Selbina #1              
homepoints[44]  = { 2, 13,     -84,      4,     -32, 128, 256,  500}; -- Western Adoulin #1      
homepoints[45]  = { 2, 14,     -51,      0,      59, 128, 257,  500}; -- Eastern Adoulin #1      
homepoints[46]  = { 2, 15,    -107,      3,     295, 128, 261, 1000}; -- Ceizak Battlegrounds #1 
homepoints[47]  = { 2, 16,    -193,   -0.5,    -252, 128, 262, 1000}; -- Foret de Hennetiel #1   
homepoints[48]  = { 2, 17,    -415,  -63.2,     409, 106, 265, 1000}; -- Morimar Basalt Fields #1
homepoints[49]  = { 2, 18,    -420,      0,     -62,  64, 263, 1000}; -- Yorcia Weald #1         
homepoints[50]  = { 2, 19,     -23,      0,     174,   0, 266, 1000}; -- Marjami Ravine #1       
homepoints[51]  = { 2, 20,     210, 20.299,     315, 192, 267, 1000}; -- Kamihr Drifts #1        
homepoints[52]  = { 2, 21,     434,    -40,     171,   0, 142, 1000}; -- Yughott Grotto #1       
homepoints[53]  = { 2, 22,     109,    -38,    -147,   0, 143, 1000}; -- Palborough Mines #1     
homepoints[54]  = { 2, 23,    -132,     -3,    -303,   0, 145, 1000}; -- Giddeus #1              
homepoints[55]  = { 2, 24,     243,    -24,      62,   0, 204, 1000}; -- Fei'Yin #1              
homepoints[56]  = { 2, 25,    -984,     17,    -289,   0, 208, 1000}; -- Quicksand Caves #1      
homepoints[57]  = { 2, 26,     -80,     46,      62,   0, 160, 1000}; -- Den of Rancor #1        
homepoints[58]  = { 2, 27,    -554,    -70,      66,   0, 162, 1000}; -- Castle Zvahl Keep #1    
homepoints[59]  = { 2, 28,       5,    -42,     526,   0, 130, 1000}; -- Ru'Aun Gardens #1       
homepoints[60]  = { 2, 29,    -499,    -42,     167,   0, 130, 1000}; -- Ru'Aun Gardens #2       
homepoints[61]  = { 2, 30,    -312,    -42,    -422,   0, 130, 1000}; -- Ru'Aun Gardens #3       
homepoints[62]  = { 2, 31,     500,    -42,     158,   0, 130, 1000}; -- Ru'Aun Gardens #4       
homepoints[63]  = { 2, 32,     305,    -42,    -427,   0, 130, 1000}; -- Ru'Aun Gardens #5       
homepoints[64]  = { 3,  1,      -1,    -28,     107,   0,  26,  500}; -- Tavnazian Safehold #1     
homepoints[65]  = { 3,  2,     -21,      0,     -21,   0,  50,  500}; -- Aht Urhgan Whitegate #1   
homepoints[66]  = { 3,  3,     -20,      0,     -25,   0,  53,  500}; -- Nashmau #1                
homepoints[67]  = { 3,  4,       0,      0,       0,   0,  48,  500}; -- Al Zahbi #1    // Doesn't exist related to BG Wiki
homepoints[68]  = { 3,  5,     -85,      1,     -66,   0,  80,  500}; -- Southern San d'Oria [S] #1
homepoints[69]  = { 3,  6,    -293,    -10,    -102,   0,  87,  500}; -- Bastok Markets [S] #1     
homepoints[70]  = { 3,  7,     -32,     -5,     131,   0,  94,  500}; -- Windurst Waters [S] #1    
homepoints[71]  = { 3,  8,    -365, -176.5,     -36,   0, 158, 1000}; -- Upper Delkfutt's Tower #1 
homepoints[72]  = { 3,  9,     -13,     48,      61,   0, 178, 1000}; -- The Shrine of Ru'Avitau #1
homepoints[73]  = { 3, 10,    -520,    -18,     505, 127,  29, 1000}; -- Riverne - Site #B01 #1    
homepoints[74]  = { 3, 11,     -98,    -10,    -493, 192,  52, 1000}; -- Bhaflau Thickets #1       
homepoints[75]  = { 3, 12,    -449,     13,    -497,   0,  79, 1000}; -- Caedarva Mire #1          
homepoints[76]  = { 3, 13,      64,   -196,     181,   0,   5, 1000}; -- Uleguerand Range #1       
homepoints[77]  = { 3, 14,     380,     23,     -62,   0,   5, 1000}; -- Uleguerand Range #2       
homepoints[78]  = { 3, 15,     424,    -32,     221,   0,   5, 1000}; -- Uleguerand Range #3       
homepoints[79]  = { 3, 16,      64,    -96,     461,   0,   5, 1000}; -- Uleguerand Range #4       
homepoints[80]  = { 3, 17,    -220,     -1,     -62,   0,   5, 1000}; -- Uleguerand Range #5       
homepoints[81]  = { 3, 18,    -200,    -10,     342,   0,   7, 1000}; -- Attohwa Chasm #1          
homepoints[82]  = { 3, 19,     -58,     40,      14,  64,   9, 1000}; -- Pso'Xja #1                
homepoints[83]  = { 3, 20,     445,     27,     -22,   0,  12, 1000}; -- Newton Movalpolos #1      
homepoints[84]  = { 3, 21,     189,      0,     362,   0,  30, 1000}; -- Riveren - Site #A01 #1  // Location not verified from retail
homepoints[85]  = { 3, 22,       7,      0,     709, 192,  33, 1000}; -- Al'Taieu #1               
homepoints[86]  = { 3, 23,    -532,      0,     447, 128,  33, 1000}; -- Al'Taieu #2               
homepoints[87]  = { 3, 24,     569,      0,     410, 192,  33, 1000}; -- Al'Taieu #3               
homepoints[88]  = { 3, 25,     -12,      0,    -288, 192,  34, 1000}; -- Grand Palace of Hu'Xzoi #1
homepoints[89]  = { 3, 26,    -426,      0,     368, 224,  35, 1000}; -- The Garden of Ru'Hmet #1  
homepoints[90]  = { 3, 27,       -540.844,      -4.000,       70.809,   74,  61, 1000}; -- Mount Zhayolm #1  // No valid location
homepoints[91]  = { 3, 28,    -303,     -8,     526,   0, 113, 1000}; -- Cape Terrigan #1          
homepoints[92]  = { 3, 29,      88,    -15,    -217,   0, 153, 1000}; -- The Boyahda Tree #1       
homepoints[93]  = { 3, 30,     182,     34,     -62, 223, 160, 1000}; -- Den of Rancor #2
homepoints[94]  = { 3, 31,     102,      0,     269, 191, 204, 1000}; -- Fei'Yin #2                
homepoints[95]  = { 3, 32,     -63,     50,      81, 192, 205, 1000}; -- Ifrit's Cauldron #1       
homepoints[96]  = { 4,  1,     573,      9,    -500,   0, 208, 1000}; -- Quicksand Caves #2      
homepoints[97]  = { 4,  2,    -165,     -1,      12,  65, 230,  500}; -- Southern San d'Oria #4  
homepoints[98]  = { 4,  3,    -132,     12,     194, 170, 231,  500}; -- Northern San d'Oria #4  
homepoints[99]  = { 4,  4,      87,      7,       1,   0, 234,  500}; -- Bastok Mines #3         
homepoints[100] = { 4,  5,    -192,     -6,     -69,   0, 235,  500}; -- Bastok Markets #4       
homepoints[101] = { 4,  6,    -127,     -6,       8, 206, 236,  500}; -- Port Bastok #3          
homepoints[102] = { 4,  7,     -76,      2,       3, 124, 237,  500}; -- Metalworks #2           
homepoints[103] = { 4,  8,       5,     -4,    -175, 130, 238,  500}; -- Windurst Waters #3      
homepoints[104] = { 4,  9,     -65,     -5,      54, 127, 252,  500}; -- Norg #2                 
homepoints[105] = { 4, 10,     -21,      8,     110,  64, 247,  500}; -- Rabao #2                
homepoints[106] = { 4, 11,     130,      0,     -16,   0,  50,  500}; -- Aht Urhgan Whitegate #2 
homepoints[107] = { 4, 12,    -108,     -6,     108, 192,  50,  500}; -- Aht Urhgan Whitegate #3 
homepoints[108] = { 4, 13,     -99,      0,     -68,   0,  50,  500}; -- Aht Urhgan Whitegate #4 
homepoints[109] = { 4, 14,      32,      0,    -164,  32, 256,  500}; -- Western Adoulin #2      
homepoints[110] = { 4, 15,     -51,      0,     -96,  96, 257,  500}; -- Eastern Adoulin #2      
homepoints[111] = { 4, 16,     223,    -13,    -254,   0, 137, 1000}; -- Xarcabard [S] #1
homepoints[112] = { 4, 17,   5.539, -0.434,   8.133,  73, 281, 1000}; -- Leafallia #1  // on your right when you enter.
homepoints[113] = { 4, 18,    -554,    -70,      66, 128, 155, 1000}; -- *Castle Zvahl Keep [S] #1  // same location as in the present
homepoints[114] = { 4, 19,    -212,    -21,      93,  64, 126,  500}; -- Qufim Island #1
homepoints[115] = { 4, 20,  -257.5,     24,      82, 192, 169,  500}; -- Toraimorai Canal #1
homepoints[116] = { 4, 21,     757,    120,    17.5, 128, 276, 1000}; -- Ra'Kaznar Inner Court #1
homepoints[117] = { 4, 22,     -65,  -17.5,     563, 224,  25, 1000}; -- Misareaux Coast #1
homepoints[118] = { 4, 23,     -92,     -2,      54, 155, 238,  500}; -- Windurst Waters #4
homepoints[119] = { 4, 24,   -43.5,      0,    -145,   0, 241,  500}; -- Windurst Woods #5
homepoints[120] = { 4, 25,      14,  -9.96,      -5,   0,  26,  500}; -- Tavnazian Safehold #2
homepoints[121] = { 4, 26,   73.59,  -36.149,  38.87,   0,  26,  500}; -- Tavnazian Safehold #3



local freeHpTeleGroups = { 1, 2, 3, 4, 5, 6, 7, 8, 9};

freeHpTeleGroups[1] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 97, 98}; --San d'Oria
freeHpTeleGroups[2] = { 9, 10, 11, 12 ,13, 14, 15, 16, 99, 100, 101, 102}; -- Bastok
freeHpTeleGroups[3] = { 17, 18, 19, 20, 21, 22, 23, 24, 25, 26 ,27 ,28, 103, 118, 119}; -- Windurst
freeHpTeleGroups[4] = { 29, 30, 31, 32, 33, 34, 35, 36, 37, 38}; -- Jueno
freeHpTeleGroups[5] = { 65, 106, 107, 108}; -- Aht Urghan
freeHpTeleGroups[6] = { 44, 45, 109, 110}; -- Adoulin
freeHpTeleGroups[7] = { 41, 104}; -- Norg
freeHpTeleGroups[8] = { 42, 105}; -- Rabao
freeHpTeleGroups[9] = { 64, 120, 121}; -- Tavnazian Safehold

function homepointMenu( player, csid, hpIndex)
    
    if ( HOMEPOINT_HEAL == 1) then
        player:addHP(player:getMaxHP());
        player:addMP(player:getMaxMP());
    end

    if ( HOMEPOINT_TELEPORT == 1) then
        
        if ( homepoints[hpIndex] == nil) then return; end -- Check for valid hpIndex

        player:setLocalVar("currentHpIndex", hpIndex + 1);

        local HpTeleportMask1 = bit.bor( bit.lshift( player:getVar("HpTeleportMask1a"), 16), player:getVar("HpTeleportMask1b"));
        local HpTeleportMask2 = bit.bor( bit.lshift( player:getVar("HpTeleportMask2a"), 16), player:getVar("HpTeleportMask2b"));
        local HpTeleportMask3 = bit.bor( bit.lshift( player:getVar("HpTeleportMask3a"), 16), player:getVar("HpTeleportMask3b"));
        local HpTeleportMask4 = bit.bor( bit.lshift( player:getVar("HpTeleportMask4a"), 16), player:getVar("HpTeleportMask4b"));
		
        -- Register new homepoint?
        local newHp = 0;
        if ( homepoints[hpIndex][1] == 1) then
            if ( bit.rshift( bit.lshift( HpTeleportMask1, 32 - homepoints[hpIndex][2]), 31) == 0) then
                newHp = 0x10000; -- This value causes the "You have registered a new home point!" dialog to display
                
                -- Update the homepoint teleport mask with the new location
                HpTeleportMask1 = bit.bor( HpTeleportMask1, bit.lshift( 1, homepoints[hpIndex][2] - 1)); 

                -- Save new mask to database
                player:setVar("HpTeleportMask1a", bit.rshift( HpTeleportMask1, 16));
                player:setVar("HpTeleportMask1b", bit.rshift( bit.lshift( HpTeleportMask1, 16), 16));
            end
        elseif (  homepoints[hpIndex][1] == 2) then
            if ( bit.rshift( bit.lshift( HpTeleportMask2, 32 - homepoints[hpIndex][2]), 31) == 0) then
                newHp = 0x10000;
                
                HpTeleportMask2 = bit.bor( HpTeleportMask2, bit.lshift( 1, homepoints[hpIndex][2] - 1)); 

                player:setVar("HpTeleportMask2a", bit.rshift( HpTeleportMask2, 16));
                player:setVar("HpTeleportMask2b", bit.rshift( bit.lshift( HpTeleportMask2, 16), 16));
            end
        elseif (  homepoints[hpIndex][1] == 3) then
            if ( bit.rshift( bit.lshift( HpTeleportMask3, 32 - homepoints[hpIndex][2]), 31) == 0) then
                newHp = 0x10000;
                
                HpTeleportMask3 = bit.bor( HpTeleportMask3, bit.lshift( 1, homepoints[hpIndex][2] - 1)); 

                player:setVar("HpTeleportMask3a", bit.rshift( HpTeleportMask3, 16));
                player:setVar("HpTeleportMask3b", bit.rshift( bit.lshift( HpTeleportMask3, 16), 16));
            end
        elseif (  homepoints[hpIndex][1] == 4) then
            if ( bit.rshift( bit.lshift( HpTeleportMask4, 32 - homepoints[hpIndex][2]), 31) == 0) then
                newHp = 0x10000;
                
                HpTeleportMask4 = bit.bor( HpTeleportMask4, bit.lshift( 1, homepoints[hpIndex][2] - 1)); 

                player:setVar("HpTeleportMask4a", bit.rshift( HpTeleportMask4, 16));
                player:setVar("HpTeleportMask4b", bit.rshift( bit.lshift( HpTeleportMask4, 16), 16));
            end
        elseif (  homepoints[hpIndex][1] == 5) then
        end

        player:startEvent( csid, 0, HpTeleportMask1, HpTeleportMask2, HpTeleportMask3, HpTeleportMask4, player:getGil(), 4095, hpIndex + newHp);
    else
        player:PrintToPlayer( "Home point teleports are currently disabled on this server.");
        player:startEvent( csid, 0, 0, 0, 0, 0, player:getGil(), 4095, hpIndex);
    end
end;

function hpTeleport( player, option)

    if ( option == 2 or option > 0x10000 and option < 0x7F0003) then
        local hpIndex = bit.rshift( option, 16); -- Calculate hpIndex based on option selected
        
        local teleportCost = homepoints[hpIndex][8];
        if ( freeHpTeleport( player, hpIndex)) then
            teleportCost = 0;
        end

        player:delGil(teleportCost);
        player:setLocalVar("currentHpIndex", 0);
        player:setPos( homepoints[hpIndex][3], homepoints[hpIndex][4], homepoints[hpIndex][5], homepoints[hpIndex][6], homepoints[hpIndex][7]);
    end
end;

function freeHpTeleport( player, hpIndex)

    local currentHpIndex = player:getLocalVar("currentHpIndex") - 1;

    for x = 1, 20 do
        if ( freeHpTeleGroups[x] ~= nil) then
            for y = 1, 20 do
                if ( freeHpTeleGroups[x][y] ~= nil) then
                    if ( freeHpTeleGroups[x][y] == currentHpIndex) then
                        for z = 1, 20 do
                            if ( freeHpTeleGroups[x][z] ~= nil) then
                                if ( freeHpTeleGroups[x][z] == hpIndex) then
                                    return true;
                                end
                            else
                                break;
                            end
                        end                    
                    end
                else
                    break;
                end
            end
        else
            break;
        end
    end

    return false;
end;
