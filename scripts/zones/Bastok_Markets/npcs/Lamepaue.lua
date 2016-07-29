-----------------------------------
--  Area: Bastok Markets
--   NPC: Lamepaue
--  Type: Past Event Watcher
-- @zone: 235
--  @pos -172.136 -5 -69.632
-----------------------------------

package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;

require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    -- Bastok Missions.
    local BastokMissions = 0xFFFFFFFE; 
    if (player:hasCompletedMission (BASTOK,FETICHISM)) then
        BastokMissions = BastokMissions - 2; -- Fetichism.
    end
    if (player:hasCompletedMission (BASTOK,TO_THE_FORSAKEN_MINES)) then
        BastokMissions = BastokMissions - 4; -- To the Forsaken Mines.
    end

    -- Bastok Quests.
    local BastokQuests = 0xFFFFFFFE; 
    if (player:hasCompleteQuest(BASTOK,THE_RETURN_OF_THE_ADVENTURER)) then
        BastokQuests = BastokQuests - 2;     -- The Return of the Adventurer
    end
-- *Need the correct csid
--     if (player:hasCompleteQuest(BASTOK,THE_FIRST_MEETING)) then
--         BastokQuests = BastokQuests - 4;     -- The First Meeting
--     end
    if (player:hasCompleteQuest(BASTOK,WISH_UPON_A_STAR)) then
        BastokQuests = BastokQuests - 8;     -- Wish Upon a Star (pt.1)
        BastokQuests = BastokQuests - 16;    -- Wish Upon a Star (pt.2)
        BastokQuests = BastokQuests - 32;    -- Wish Upon a Star (pt.3)
    end

-- *Need the correct csid/parameters
--    if (player:hasCompleteQuest(BASTOK,ALL_BY_MYSELF)) then
--        BastokQuests = BastokQuests - 64;    -- All by Myself
--    end
    if (player:hasCompleteQuest(BASTOK,ACHIEVING_TRUE_POWER)) then
        BastokQuests = BastokQuests - 128;   -- Achieving True Power
    end
    if (player:hasCompleteQuest(BASTOK,TOO_MANY_CHEFS)) then 
        BastokQuests = BastokQuests - 512;   -- Too Many Chefs
        
    end
    if (player:hasCompleteQuest(BASTOK,A_PROPER_BURIAL)) then
        BastokQuests = BastokQuests - 1024;  -- A Proper Burial (pt.1)
        BastokQuests = BastokQuests - 2048;  -- A Proper Burial (pt.2)
        BastokQuests = BastokQuests - 4096;  -- A Proper Burial (pt.3)
        BastokQuests = BastokQuests - 8192;  -- A Proper Burial (pt.4)
        BastokQuests = BastokQuests - 16384; -- A Proper Burial (pt.5)
        BastokQuests = BastokQuests - 32768; -- A Proper Burial (pt.6)
    end

    -- Other Quests.
    local OtherQuests = 0xFFFFFFFE;
    if (player:hasCompleteQuest(JEUNO,BEAT_AROUND_THE_BUSHIN)) then
        OtherQuests = OtherQuests - 2;      -- Beat Around the Bushin
    end
    if (player:hasCompleteQuest(OTHER_AREAS,CONFESSIONS_OF_A_BELLMAKER)) then
        OtherQuests = OtherQuests - 4;      -- Confessions of a Bellmaker
    end
    if (player:hasCompleteQuest(OTHER_AREAS,PICTURE_PERFECT)) then
        OtherQuests = OtherQuests - 8;      -- Picture Perfect (pt.1)
        OtherQuests = OtherQuests - 16;     -- Picture Perfect (pt.2)
        OtherQuests = OtherQuests - 32;     -- Picture Perfect (pt.3)
        OtherQuests = OtherQuests - 64;     -- Picture Perfect (pt.4)
    end
    if (player:hasCompleteQuest(AHT_URHGAN,NO_STRINGS_ATTACHED)) then
        OtherQuests = OtherQuests - 128;    -- No Strings Attached
    end
    if (player:hasCompleteQuest(AHT_URHGAN,PUPPETMASTER_BLUES)) then
        OtherQuests = OtherQuests - 256;    -- Puppetmaster Blues (pt.1)
        OtherQuests = OtherQuests - 512;    -- Puppetmaster Blues (pt.2)
    end
    if (player:hasCompleteQuest(JEUNO,COMEBACK_QUEEN)) then
        OtherQuests = OtherQuests - 1024;   -- Comeback Queen
    end
    
-- *This quest,as of the time this script was written,is not yet defined in the Darkstar Project.
--     if (player:hasCompleteQuest(**Unknown**,DANCER_ATTIRE)) then
--         OtherQuests = OtherQuests - 2048;   -- Dancer Attire (pt.1)
--         OtherQuests = OtherQuests - 4096;   -- Dancer Attire (pt.2)
--     end
    if (player:hasCompleteQuest(CRYSTAL_WAR,DRAFTED_BY_THE_DUCHY)) then
        OtherQuests = OtherQuests - 8192;   -- Drafted by the Duchy
    end
    if (player:hasCompleteQuest(CRYSTAL_WAR,BATTLE_ON_A_NEW_FRONT)) then
        OtherQuests = OtherQuests - 16384;  -- Battle on a New Front
    end
    if (player:hasCompleteQuest(CRYSTAL_WAR,VOIDWALKER_OP_126)) then
        OtherQuests = OtherQuests - 32768;  -- VW Op. #126: Qufim Incursion
    end

-- *This quest,as of the time this script was written,is not yet defined in the Darkstar Project.
--     if (player:hasCompleteQuest(**Unknown**,RECORDS_OF_EMINENCE)) then
--         OtherQuests = OtherQuests - 65536;  -- Records of Eminence
--     end

-- *This quest,as of the time this script was written,is not yet defined in the Darkstar Project.
--     if (player:hasCompleteQuest(**Unknown**,TRUST_MUMOR)) then
--         OtherQuests = OtherQuests - 131072; -- Trust (Mumor)
--     end

-- *This quest,as of the time this script was written,is not yet defined in the Darkstar Project.
--     if (player:hasCompleteQuest(**Unknown**,UNITY_CONCORD)) then
--         OtherQuests = OtherQuests - 262144; -- Unity Concord (pt.1)
--         OtherQuests = OtherQuests - 524288; -- Unity Concord (pt.2)
--     end

    -- Seekers of Adoulin
    local SeekersOfAdoulin = 0xFFFFFFFE;
-- *Need the correct csid
--    if (player:hasCompletedMission (SOA,RUMORS_FROM_THE_WEST)) then
--        SeekersOfAdoulin = SeekersOfAdoulin - 2; -- Rumors from the West
--    end

    -- Determine if any cutscenes are available for the player.
    local gil = player:getGil();
    if (BastokMissions   == 0xFFFFFFFE and 
        BastokQuests     == 0xFFFFFFFE and
        OtherQuests      == 0xFFFFFFFE and
        SeekersOfAdoulin == 0xFFFFFFFE)
    then -- Player has no cutscenes available to be viewed.
        gil = 0; -- Setting gil to a value less than 10(cost) will trigger the appropriate response from this npc.
    end

    player:startEvent(0x0146,BastokMissions,BastokQuests,OtherQuests,SeekersOfAdoulin,0xFFFFFFFE,0xFFFFFFFE,10,gil); 
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf ("CSID: %u",csid);
    -- printf ("RESULT: %u",option);

    if (player:delGil(10) == false) then
        player:setLocalVar("Lamepaue_PlayCutscene", 2) ; -- Cancel the cutscene.
        player:updateEvent(0);
    else
        player:setLocalVar("Lamepaue_PlayCutscene", 1) 
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf ("CSID: %u",csid);
    -- printf ("RESULT: %u",option);

    if (player:getLocalVar("Lamepaue_PlayCutscene") < 2) then
        if (option ==   1) then        -- Fetichism.
            player:startEvent(0x03F0); 
        elseif (option ==   2) then        -- To the Forsaken Mines.
            player:startEvent(0x03F2);
        elseif (option ==  33) then        -- The Return of the Adventurer
            player:startEvent(0x00F3);            
--        elseif (option ==  34) then        -- The First Meeting
--            player:startEvent(CSID);                   
        elseif (option ==  35) then        -- Wish Upon a Star (pt.1)
            player:startEvent(0x0149);                    
        elseif (option ==  36) then        -- Wish Upon a Star (pt.2)
            player:startEvent(0x014C);                     
        elseif (option ==  37) then        -- Wish Upon a Star (pt.3)
            player:startEvent(0x014E);                           
--        elseif (option ==  38) then        -- All by Myself
--            player:startEvent(0x00B9);                  
        elseif (option ==  39) then        -- Achieving True Power
            player:startEvent(0x01B9);                  
        elseif (option ==  40) then        -- Too Many Chefs
            player:startEvent(0x019B);           
        elseif (option ==  41) then        -- A Proper Burial (pt.1)
            player:startEvent(0x01DB);           
        elseif (option ==  42) then        -- A Proper Burial (pt.2)
            player:startEvent(0x01DD);           
        elseif (option ==  43) then        -- A Proper Burial (pt.3)
            player:startEvent(0x01DF);                  
        elseif (option ==  44) then        -- A Proper Burial (pt.4)
            player:startEvent(0x01E1);            
        elseif (option ==  45) then        -- A Proper Burial (pt.5)
            player:startEvent(0x01E3);            
        elseif (option ==  46) then        -- A Proper Burial (pt.6)
            player:startEvent(0x01E5);             
        elseif (option ==  65) then        -- Beat Around the Bushin
            player:startEvent(0x0156);             
        elseif (option ==  66) then        -- Confessions of a Bellmaker
            player:startEvent(0x0192);
-- Picture Perfect cutscenes need to be verified.            
        elseif (option ==  67) then        -- Picture Perfect (pt.1)
            player:startEvent(0x0193);               
        elseif (option ==  68) then        -- Picture Perfect (pt.2)
            player:startEvent(0x0194);               
        elseif (option ==  69) then        -- Picture Perfect (pt.3) 
            player:startEvent(0x0195);            
        elseif (option ==  70) then        -- Picture Perfect (pt.4)
            player:startEvent(0x0196);               
        elseif (option ==  71) then        -- No Strings Attached
            player:startEvent(0x01B2);                    
        elseif (option ==  72) then        -- Puppetmaster Blues (pt.1)
            player:startEvent(0x01B5);        
        elseif (option ==  73) then        -- Puppetmaster Blues (pt.2)
            player:startEvent(0x01B7);        
        elseif (option ==  74) then        -- Comeback Queen
            player:startEvent(0x01EA);        
--        elseif (option ==  75) then        -- Dancer Attire (pt.1)
--            player:startEvent(CSID);                      
--        elseif (option ==  76) then        -- Dancer Attire (pt.2)
--            player:startEvent(CSID);
-- Drafted by the Duchy and Battle on a New Front cutscenes need to be verified,ids may need to be changed or have additional parameters.
        elseif (option ==  77) then        -- Drafted by the Duchy
            player:startEvent(0x0012);    
        elseif (option ==  78) then        -- Battle on a New Front
            player:startEvent(0x000C);            
        elseif (option ==  79) then        -- VW Op. #126: Qufim Incursion
            player:startEvent(0x0102);            
--        elseif (option ==  80) then        -- Records of Eminence
--            player:startEvent(CSID);        
--        elseif (option ==  81) then        -- Trust (Mumor)
--            player:startEvent(CSID);        
--        elseif (option ==  82) then        -- Unity Concord (pt.1)
--            player:startEvent(CSID);           
--        elseif (option ==  83) then        -- Unity Concord (pt.2)
--            player:startEvent(CSID);            
--        elseif (option ==  129) then        -- Rumors from the West
--            player:startEvent(CSID);            
        end
    end

    player:setLocalVar("Lamepaue_PlayCutscene", 0)
end;
